#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

copy_file() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname -- "$dst")"
  install -m "$3" "$src" "$dst"
}

copy_file "$HOME/.config/hypr/dolphin/dolphinrc" "$ROOT_DIR/files/config/hypr/dolphin/dolphinrc" 0644
copy_file "$HOME/.local/share/kio/servicemenus/open-in-kitty.desktop" "$ROOT_DIR/files/local/share/kio/servicemenus/open-in-kitty.desktop" 0755
copy_file "$HOME/.local/share/kio/servicemenus/extract-archives.desktop" "$ROOT_DIR/files/local/share/kio/servicemenus/extract-archives.desktop" 0755
copy_file "$HOME/.local/share/kio/servicemenus/run-in-terminal.desktop" "$ROOT_DIR/files/local/share/kio/servicemenus/run-in-terminal.desktop" 0755
copy_file "$HOME/.local/share/kio/servicemenus/compress-items.desktop" "$ROOT_DIR/files/local/share/kio/servicemenus/compress-items.desktop" 0755
copy_file "$HOME/.local/share/kio/servicemenus/file-tools.desktop" "$ROOT_DIR/files/local/share/kio/servicemenus/file-tools.desktop" 0755
copy_file "$HOME/.local/share/kio/servicemenus/open-in-editor.desktop" "$ROOT_DIR/files/local/share/kio/servicemenus/open-in-editor.desktop" 0755
copy_file "$HOME/.local/share/kio/servicemenus/open-as-root.desktop" "$ROOT_DIR/files/local/share/kio/servicemenus/open-as-root.desktop" 0755
copy_file "$HOME/.local/bin/dolphin-open-terminal" "$ROOT_DIR/files/local/bin/dolphin-open-terminal" 0755
copy_file "$HOME/.local/bin/dolphin-copy-path" "$ROOT_DIR/files/local/bin/dolphin-copy-path" 0755
copy_file "$HOME/.local/bin/dolphin-extract" "$ROOT_DIR/files/local/bin/dolphin-extract" 0755
copy_file "$HOME/.local/bin/dolphin-run-in-terminal" "$ROOT_DIR/files/local/bin/dolphin-run-in-terminal" 0755
copy_file "$HOME/.local/bin/dolphin-compress" "$ROOT_DIR/files/local/bin/dolphin-compress" 0755
copy_file "$HOME/.local/bin/dolphin-chmod" "$ROOT_DIR/files/local/bin/dolphin-chmod" 0755
copy_file "$HOME/.local/bin/dolphin-sha256-copy" "$ROOT_DIR/files/local/bin/dolphin-sha256-copy" 0755
copy_file "$HOME/.local/bin/dolphin-open-editor" "$ROOT_DIR/files/local/bin/dolphin-open-editor" 0755
copy_file "$HOME/.local/bin/dolphin-duplicate-timestamp" "$ROOT_DIR/files/local/bin/dolphin-duplicate-timestamp" 0755
copy_file "$HOME/.local/bin/dolphin-open-as-root" "$ROOT_DIR/files/local/bin/dolphin-open-as-root" 0755

# Keep templates portable in the repository.
home_escaped="$(printf '%s\n' "$HOME" | sed 's/[&]/\\&/g')"
for desktop in \
  "$ROOT_DIR/files/local/share/kio/servicemenus/open-in-kitty.desktop" \
  "$ROOT_DIR/files/local/share/kio/servicemenus/extract-archives.desktop" \
  "$ROOT_DIR/files/local/share/kio/servicemenus/run-in-terminal.desktop" \
  "$ROOT_DIR/files/local/share/kio/servicemenus/compress-items.desktop" \
  "$ROOT_DIR/files/local/share/kio/servicemenus/file-tools.desktop" \
  "$ROOT_DIR/files/local/share/kio/servicemenus/open-in-editor.desktop" \
  "$ROOT_DIR/files/local/share/kio/servicemenus/open-as-root.desktop"; do
  sed -i "s|$home_escaped|@HOME@|g" "$desktop"
done

echo "Export complete. Review with: git status"
