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

export PS1='\e[2;31m\u@\h:\e[0m\e[0;36m\w\e[0m \e[0;37m#\e[0m '

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

