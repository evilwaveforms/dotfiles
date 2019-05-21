# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# history
HISTSIZE=1000
HISTFILESIZE=2000
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# prevents terminals getting messed up when resizing
shopt -s checkwinsize

# export TERM=rxvt-unicode-256color
# force_color_prompt=yes

# export PS1='\e[1;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1='\e[1;32m\]\u@\h:\[\e[01;34m\w\] \[\e[0;37m\]$\[\e[0m\] '
# Alias definitions. might do this in the future

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

