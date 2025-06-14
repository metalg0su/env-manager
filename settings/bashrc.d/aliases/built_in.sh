#!/usr/bin/env bash
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias mv='mv -i'
alias p='cd ..'
alias h='history | fzf --reverse'
alias vi='vim'
alias fzf="fzf --color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104"

alias 'P=$(poetry env activate)'
