HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e

autoload -Uz compinit
compinit
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
