#!/usr/bin/env bash

dotfiles_dir="$HOME/dotfiles"
theme_link="$dotfiles_dir/themes/i3-current.conf"
theme_script="$dotfiles_dir/scripts/theme.sh"

detect_mode() {
    local target=""
    if [ -L "$theme_link" ]; then
        target="$(readlink "$theme_link" 2>/dev/null || true)"
        case "$target" in
            *light*) echo "light"; return 0 ;;
            *dark*) echo "dark"; return 0 ;;
        esac
    fi
    echo "dark"
}

if [ "${BLOCK_BUTTON:-}" = "1" ] && [ -f "$theme_script" ]; then
    # shellcheck source=/dev/null
    . "$theme_script"
    theme toggle >/dev/null 2>&1 || true
fi

mode="$(detect_mode)"
if [ "$mode" = "dark" ]; then
    echo "☾"
else
    echo "🌣"
fi
