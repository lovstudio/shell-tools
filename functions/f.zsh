#!/usr/bin/env zsh
# f <pattern> [path] — fuzzy file/dir finder backed by fd.
# Pattern is matched as substring (fd default smart-case regex).
# Examples:
#   f 微信公众号           # search current dir
#   f config.ts ~/projects # search a specific path

f() {
  if (( $# == 0 )); then
    echo "usage: f <pattern> [path]" >&2
    return 2
  fi
  local pattern="$1"; shift
  command fd "$pattern" "$@"
}
