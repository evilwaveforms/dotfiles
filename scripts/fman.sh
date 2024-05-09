#!/bin/bash
# fuzzy find man pages
fman() {
    local commands selected
    while true; do
        commands=$(apropos -s 1,8 . | awk '{print $1}')
        selected=$(echo "$commands" | fzf --exact --sort --preview='man -P "cat" {} 2>/dev/null' --preview-window='right:60%' --prompt "Search commands: ")
        [ -z "$selected" ] && return 0
        man "$selected"
    done
}
