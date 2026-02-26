#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for f in "$ROOT_DIR"/files/local/bin/dolphin-*; do
  bash -n "$f"
done

echo "All shell scripts passed syntax check."
