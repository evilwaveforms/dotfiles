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

# PROMPT='%F{8}%n@%m:%F{172}%~ # %f'

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '[%b]'
zstyle ':vcs_info:git:*' actionformats '[%i|%a]'
zstyle ':vcs_info:git:*' check-for-changes true

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT='%F{purple}%~%f '
PROMPT+='%F{white}${vcs_info_msg_0_}'
PROMPT+='%f'$'\n'
PROMPT+='%F{red}ᛣ%f '

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
if [ -f ~/dotfiles/.aliases ]; then
    . ~/dotfiles/.aliases
fi

autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
