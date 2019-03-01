export GIT_PREFIX=/Library/Developer/CommandLineTools/usr/share/git-core
if [ -f $GIT_PREFIX/git-completion.bash ]; then
    . $GIT_PREFIX/git-completion.bash
fi

if [ -f $GIT_PREFIX/git-prompt.sh ]; then
    . $GIT_PREFIX/git-prompt.sh

    export PS1='\h:\W \u\[\e[1;34m\]$(__git_ps1)\[\e[0m\] \$ '

    # for git PROMPT
    GIT_PS1_STATESEPARATOR=""
    GIT_PS1_SHOWDIRTYSTATE=1
fi

# bash-completion
BREW_PREFIX=`brew --prefix`
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
    . $BREW_PREFIX/etc/bash_completion
fi

export PATH=$PATH:$BREW_PREFIX/sbin

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ll command
alias ll='ls -al'

eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# python virtualenv settings
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON="$(which python)"  # Usage of python3
# source /usr/local/bin/virtualenvwrapper.sh

# gnu sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# tmuxinator EDITOR setting
export EDITOR=vim

# Go lang settings
export GOROOT=~/projects/goRoot

# grep higlight
alias grep='grep -n --color'


