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
copy_file "$HOME/.local/share/kio/servicemenus/open-in-kitty.desktop" "$ROOT_DIR/files/local/share/kio/servicemenus/open-in-kitty.desktop" 0644
copy_file "$HOME/.local/share/kio/servicemenus/extract-archives.desktop" "$ROOT_DIR/files/local/share/kio/servicemenus/extract-archives.desktop" 0644
copy_file "$HOME/.local/share/kio/servicemenus/run-in-terminal.desktop" "$ROOT_DIR/files/local/share/kio/servicemenus/run-in-terminal.desktop" 0644
copy_file "$HOME/.local/bin/dolphin-open-terminal" "$ROOT_DIR/files/local/bin/dolphin-open-terminal" 0755
copy_file "$HOME/.local/bin/dolphin-copy-path" "$ROOT_DIR/files/local/bin/dolphin-copy-path" 0755
copy_file "$HOME/.local/bin/dolphin-extract" "$ROOT_DIR/files/local/bin/dolphin-extract" 0755
copy_file "$HOME/.local/bin/dolphin-run-in-terminal" "$ROOT_DIR/files/local/bin/dolphin-run-in-terminal" 0755

echo "Export complete. Review with: git status"
