#!/bin/bash
fcman() {
    local symbols selected
    while true; do
        # -s 2,3 for syscalls + library calls (C, pthread, etc.)
        symbols=$(apropos -s 2,3 . 2>/dev/null | awk '{print $1}')
        selected=$(echo "$symbols" | fzf \
            --exact --sort \
            --preview='man -P "cat" {} 2>/dev/null' \
            --preview-window='right:60%' \
            --prompt "Search C funcs: ")
        [ -z "$selected" ] && return 0
        man "$selected"
    done
}
