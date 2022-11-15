#!/usr/bin/env bash
export EDITOR=vim
export TERM=xterm-256color
set -o vi  # vi mode
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32;40m\]\h\[\e[m\]:\[\e[31m\]\w\[\e[m\]\[\e[36m\]\$(parse_git_branch)\\$\[\e[m\] "
export CLICOLOR=1
export LSCOLORS=ExGxFxdxCxDxDxhbadExEx

###########
# History #
###########
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=2000
HISTTIMEFORMAT="%Y/%m/%d %H:%M |  "
