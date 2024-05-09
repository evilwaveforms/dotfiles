export EDITOR=nvim

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e

autoload -Uz compinit
compinit

# Use menu completion
zstyle ':completion:*' menu select

# Group matches and describe groups
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes' 
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}%d%{\e[0m%}'

PROMPT='%F{8}%n@%m:%F{172}%~ # %f'

export PATH=$PATH:$HOME/.npm-global/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

scripts_dir=~/dotfiles/scripts
if [ -d "$scripts_dir" ]; then
  for file in "$scripts_dir"/*.sh; do
    if [ -r "$file" ]; then
      source "$file"
    fi
  done
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias rm="rm -i"
alias mv="mv -i"
alias untar="tar xvzf"
alias ls="ls --color=auto"
alias grep="grep --color"
alias ip="ip -c"
alias date="date '+%a %d %b %Y %T %Z (%z)'"
alias np="mpc current && mpc current | xclip -sel clip"
alias fehbg="feh --bg-fill --randomize ~/dotfiles/wallpapers/*"

autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
