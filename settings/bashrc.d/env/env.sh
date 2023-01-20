#!/usr/bin/env bash
export EDITOR=vim
export TERM=xterm-256color
set -o vi  # vi mode

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
