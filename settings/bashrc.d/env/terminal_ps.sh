#!/usr/bin/env bash
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32;40m\]\h\[\e[m\]:\[\e[31m\]\w\[\e[m\]\[\e[36m\]\$(parse_git_branch)\\$\[\e[m\] "

export CLICOLOR=1
export LSCOLORS=ExGxFxdxCxDxDxhbadExEx
# 출처: https://gnuteam.tistory.com/93 [소프트웨어 견습생의 필살 로그]
