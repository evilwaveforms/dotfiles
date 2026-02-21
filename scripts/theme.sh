#!/usr/bin/env bash

_theme_detect_mode() {
    local target="$1"
    local link_target

    if [ -L "$target" ]; then
        link_target="$(readlink "$target" 2>/dev/null || true)"
        case "$link_target" in
            *light*) echo "light"; return 0 ;;
            *dark*) echo "dark"; return 0 ;;
        esac
    fi

    echo "dark"
}

theme() {
    local requested_mode="$1"
    local dotfiles_dir="$HOME/dotfiles"
    local themes_dir="$dotfiles_dir/themes"
    local alacritty_source=""
    local alacritty_target="$themes_dir/alacritty-current.toml"
    local tmux_target="$themes_dir/tmux-current.conf"
    local nvim_target="$themes_dir/nvim-current.lua"
    local i3_target="$themes_dir/i3-current.conf"
    local mode="$requested_mode"
    local current_mode

    current_mode="$(_theme_detect_mode "$i3_target")"

    if [ -z "$mode" ] || [ "$mode" = "toggle" ]; then
        if [ "$current_mode" = "dark" ]; then
            mode="light"
        else
            mode="dark"
        fi
    fi

    case "$mode" in
        dark|light) ;;
        *)
            echo "Usage: theme [dark|light|toggle]"
            return 1
            ;;
    esac

    alacritty_source="$themes_dir/alacritty-$mode.toml"

    if [ ! -f "$alacritty_source" ] || [ ! -f "$themes_dir/tmux-$mode.conf" ] || [ ! -f "$themes_dir/nvim-$mode.lua" ] || [ ! -f "$themes_dir/i3-$mode.conf" ]; then
        echo "Missing theme files in $themes_dir for mode: $mode" >&2
        return 1
    fi

    ln -sfn "alacritty-$mode.toml" "$alacritty_target" || {
        echo "Failed to link $alacritty_target" >&2
        return 1
    }
    ln -sfn "tmux-$mode.conf" "$tmux_target" || {
        echo "Failed to link $tmux_target" >&2
        return 1
    }
    ln -sfn "nvim-$mode.lua" "$nvim_target" || {
        echo "Failed to link $nvim_target" >&2
        return 1
    }

    ln -sfn "i3-$mode.conf" "$i3_target" || {
        echo "Failed to link $i3_target" >&2
        return 1
    }

    if command -v tmux >/dev/null 2>&1; then
        tmux source-file "$HOME/.tmux.conf" >/dev/null 2>&1 || true
    fi
    if command -v i3-msg >/dev/null 2>&1; then
        if ! i3-msg -q 'reload, restart' >/dev/null 2>&1; then
            echo "Warning: i3 reload/restart failed. Run 'i3-msg reload, restart' manually." >&2
        fi
    fi

    echo "Theme set to $mode."
}
