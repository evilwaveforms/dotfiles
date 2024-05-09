HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e

autoload -Uz compinit
compinit
PROMPT='%F{8}%n@%m:%F{172}%~ # %f'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
