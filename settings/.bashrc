# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ---- shopt
shopt -s checkwinsize  # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s histappend  # append to the history file, don't overwrite it
shopt -s globstar  # If set, the pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# ----- Load sub files
for file in `find ${HOME}/bashrc.d/* -name "*.sh"`;
    do source ${file} 
done;

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export PATH="$PATH:$HOME/development/flutter/bin"

# MacMini zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# git auto complete
if [ -f $HOME/.git-completion.bash ]; then
 source $HOME/.git-completion.bash
fi

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"  # gsed as default --^

# history search with arrows
bind -f ~/.inputrc

source $HOME/.bash_completion
export JAVA_HOME=$HOME/Library/Java/JavaVirtualMachines/corretto-17.0.7/Contents/Home
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:$HOME/.local/bin

export PATH="$(brew --prefix)/opt/arm-gcc-embedded/bin:$PATH"
