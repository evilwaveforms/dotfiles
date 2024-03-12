#!/bin/bash
# Pipe `git diff` output into fzf, show preview for changes.
# Jump to first line on diff on enter.
gd() {
  local git_root=$(git rev-parse --show-toplevel)
  if [ -z "$git_root" ]; then
    return 1
  fi

  pushd "$git_root" > /dev/null

  local file=$(git diff "$@" --name-only | fzf -m --ansi --preview 'git diff --color=always {} | delta' --preview-window=up:70%)
  if [ -z "$file" ]; then
    popd > /dev/null
    return 1
  fi

  # Find the line number of the first diff in the selected file
  local line=$(git diff "$file" | grep -m1 -Po '^@@ -\d+,\d+ \+\K\d+' 2> /dev/null)
  if [ -z "$line" ]; then
    echo "No changes found in the selected file."
    popd > /dev/null
    return 1
  fi

  case "${EDITOR}" in
    nvim)
      nvim +"$line" "$file"
      ;;
    vim)
      vim +"$line" "$file"
      ;;
    *)
      echo "Unsupported editor: $EDITOR. Opening without line specification."
      $EDITOR "$file"
      ;;
  esac
  popd > /dev/null
}
