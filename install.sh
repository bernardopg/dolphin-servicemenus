#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILES_DIR="$ROOT_DIR/files"

log() {
  printf '[install] %s\n' "$1"
}

install_file() {
  local src="$1"
  local dst="$2"
  local mode="$3"
  mkdir -p "$(dirname -- "$dst")"
  install -m "$mode" "$src" "$dst"
}

install_desktop_template() {
  local src="$1"
  local dst="$2"
  local tmp
  local home_escaped

  tmp="$(mktemp)"
  home_escaped="$(printf '%s\n' "$HOME" | sed 's/[&]/\\&/g')"
  sed "s|@HOME@|$home_escaped|g" "$src" > "$tmp"
  mkdir -p "$(dirname -- "$dst")"
  install -m 0644 "$tmp" "$dst"
  rm -f "$tmp"
}

set_kservice_visible() {
  local key="$1"
  if command -v kwriteconfig6 >/dev/null 2>&1; then
    kwriteconfig6 --file "$HOME/.config/kservicemenurc" --group Show --key "$key" true
  else
    # Fallback if kwriteconfig6 is unavailable
    touch "$HOME/.config/kservicemenurc"
    if ! rg -n "^${key}=" "$HOME/.config/kservicemenurc" >/dev/null 2>&1; then
      printf '%s=true\n' "$key" >> "$HOME/.config/kservicemenurc"
    fi
  fi
}

log "Installing Dolphin helper scripts"
install_file "$FILES_DIR/local/bin/dolphin-open-terminal" "$HOME/.local/bin/dolphin-open-terminal" 0755
install_file "$FILES_DIR/local/bin/dolphin-copy-path" "$HOME/.local/bin/dolphin-copy-path" 0755
install_file "$FILES_DIR/local/bin/dolphin-extract" "$HOME/.local/bin/dolphin-extract" 0755
install_file "$FILES_DIR/local/bin/dolphin-run-in-terminal" "$HOME/.local/bin/dolphin-run-in-terminal" 0755

log "Installing Dolphin service menus"
install_desktop_template "$FILES_DIR/local/share/kio/servicemenus/open-in-kitty.desktop" "$HOME/.local/share/kio/servicemenus/open-in-kitty.desktop"
install_desktop_template "$FILES_DIR/local/share/kio/servicemenus/extract-archives.desktop" "$HOME/.local/share/kio/servicemenus/extract-archives.desktop"
install_desktop_template "$FILES_DIR/local/share/kio/servicemenus/run-in-terminal.desktop" "$HOME/.local/share/kio/servicemenus/run-in-terminal.desktop"

log "Installing dolphinrc"
DOLPHINRC_SRC="$FILES_DIR/config/hypr/dolphin/dolphinrc"
if [[ -L "$HOME/.config/dolphinrc" ]]; then
  DOLPHINRC_TARGET="$(readlink -f "$HOME/.config/dolphinrc")"
  install_file "$DOLPHINRC_SRC" "$DOLPHINRC_TARGET" 0644
else
  install_file "$DOLPHINRC_SRC" "$HOME/.config/dolphinrc" 0644
fi

log "Enabling custom actions"
set_kservice_visible openInKitty
set_kservice_visible copyAbsolutePath
set_kservice_visible extractHere
set_kservice_visible extractToFolder
set_kservice_visible runInTerminal

log "Refreshing KDE service cache"
if command -v kbuildsycoca6 >/dev/null 2>&1; then
  kbuildsycoca6 --noincremental >/dev/null 2>&1 || true
fi

log "Done. Restart Dolphin if menus do not appear immediately."
