#!/usr/bin/env bash
# Idempotent installer. Adds a single source line to ~/.zshrc.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENTRY="$REPO_DIR/index.zsh"
MARKER="# >>> lovstudio-shell-tools >>>"
END_MARKER="# <<< lovstudio-shell-tools <<<"
ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"

if grep -qF "$MARKER" "$ZSHRC" 2>/dev/null; then
  echo "[skip] already installed in $ZSHRC"
  exit 0
fi

{
  echo ""
  echo "$MARKER"
  echo "[ -f \"$ENTRY\" ] && source \"$ENTRY\""
  echo "$END_MARKER"
} >> "$ZSHRC"

echo "[ok] installed. run: exec zsh   (or open a new terminal)"
