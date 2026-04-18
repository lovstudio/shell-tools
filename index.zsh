#!/usr/bin/env zsh
# Entry point. Sourced from ~/.zshrc.
# Loads everything in functions/ and aliases/ alphabetically.

LOVSTUDIO_SHELL_TOOLS_DIR="${0:A:h}"

for f in "$LOVSTUDIO_SHELL_TOOLS_DIR"/functions/*.zsh(N); do
  source "$f"
done

for f in "$LOVSTUDIO_SHELL_TOOLS_DIR"/aliases/*.zsh(N); do
  source "$f"
done
