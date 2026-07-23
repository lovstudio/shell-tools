#!/usr/bin/env zsh
# fd <name> [path] — find and delete exact-name files/directories recursively.
# Lists every match and asks for confirmation before deleting.

fd() {
  emulate -L zsh
  setopt localoptions pipefail

  if (( $# == 0 || $# > 2 )); then
    echo "usage: fd <exact-name> [path]" >&2
    return 2
  fi

  local name="$1"
  local root="${2:-.}"

  if [[ -z "$name" || "$name" == "." || "$name" == ".." || "$name" == */* ]]; then
    echo "fd: exact-name must be a single file or directory name" >&2
    return 2
  fi

  if [[ "$name" == *[\*\?\[\]\{\}]* ]]; then
    echo "fd: glob characters are not allowed; provide an exact name" >&2
    return 2
  fi

  if [[ ! -d "$root" ]]; then
    echo "fd: search path is not a directory: $root" >&2
    return 2
  fi

  local -a matches
  local match
  while IFS= read -r -d '' match; do
    matches+=("$match")
  done < <(
    command fd \
      --unrestricted \
      --case-sensitive \
      --glob \
      --prune \
      --print0 \
      -- "$name" "$root"
  )

  if (( ${#matches} == 0 )); then
    echo "fd: no matches for '$name' under '$root'"
    return 0
  fi

  echo "fd: found ${#matches} match(es):"
  printf '  %s\n' "${matches[@]}"
  printf "Delete all of them recursively? [y/N] "

  local reply
  read -r reply
  if [[ "$reply" != [yY] ]]; then
    echo "fd: cancelled"
    return 0
  fi

  command fd \
    --unrestricted \
    --case-sensitive \
    --glob \
    --prune \
    --print0 \
    -- "$name" "$root" |
    xargs -0 rm -rf --

  local exit_code=$?
  if (( exit_code != 0 )); then
    echo "fd: deletion failed" >&2
    return "$exit_code"
  fi

  echo "fd: deleted ${#matches} match(es)"
}
