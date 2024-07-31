# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
export EDITOR=nvim
export RUST_BACKTRACE=1

# history
HISTSIZE=1000
HISTFILESIZE=2000
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# prevents terminals getting messed up when resizing
shopt -s checkwinsize

# export TERM=rxvt-unicode-256color
# force_color_prompt=yes

# export PS1="\[\033[38;5;1m\]\u@\h:\[$(tput sgr0)\]\[\033[0;34m\]\w\[$(tput sgr0)\] # \[$(tput sgr0)\]"
# export PS1="\[\033[38;5;8m\]\u@\h:\w # \[$(tput sgr0)\]"
export PS1="\[\033[38;5;8m\]\u@\h:\[\033[38;5;172m\]\w # \[$(tput sgr0)\]"

export PATH=$PATH:$HOME/.npm-global/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.config/emacs/bin

export TIME_STYLE="+%d-%m-%Y %H:%M:%S"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/dotfiles/.aliases ]; then
    . ~/dotfiles/.aliases
fi

scripts_dir=~/dotfiles/scripts
if [ -d "$scripts_dir" ]; then
  for file in "$scripts_dir"/*.sh; do
    if [ -r "$file" ]; then
      source "$file"
    fi
  done
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

source /usr/share/doc/fzf/examples/key-bindings.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
