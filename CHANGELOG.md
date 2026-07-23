# Changelog

## Unreleased

- `fd <exact-name> [path]` — recursively find exact-name files/directories and delete after confirmation
- `f` now calls the underlying `fd` binary explicitly to avoid the new function override

## 0.1.0

- `f <pattern> [path]` — fd-based fuzzy file finder (zsh function)
- `aliases/git.zsh` — git aliases bundle
- `index.zsh` — hot-loading entry point for `functions/` and `aliases/`
- `install.sh` — appends a single `source` line to `~/.zshrc`
