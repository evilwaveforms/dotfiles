# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
export EDITOR=vim

# history
HISTSIZE=1000
HISTFILESIZE=2000
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# prevents terminals getting messed up when resizing
shopt -s checkwinsize

# export TERM=rxvt-unicode-256color
# force_color_prompt=yes

export PS1='\[\e[2;31m\]\u@\h:\[\e[0m\]\[\e[0;36m\]\w\[\e[0m\] \[\e[0;37m\]#\[\e[0m\] '

export PATH=$PATH:$HOME/.npm-global/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.config/emacs/bin

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias rm='rm -i'
alias mv='mv -i'
alias untar='tar xvzf'
alias ls='ls --color=auto'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source /usr/share/doc/fzf/examples/key-bindings.bash
