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
alias k=kubectl
complete -F __start_kubectl k

eval $(minikube -p minikube docker-env)

export PATH="$PATH:$HOME/flutter/bin"

# ReactNative
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/30.0.3
export PATH=$PATH:$HOME/Downloads/Android/android-studio/bin

# MacMini zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Android for Mac Mini
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# git auto complete
if [ -f $HOME/.git-completion.bash ]; then
 source $HOME/.git-completion.bash
fi

# Joplin
export PATH=$PATH:$HOME/.joplin-bin/bin
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"  # gsed as default --^

bind -f ~/.inputrc

export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export PATH=$PATH:$JAVA_HOME/bin
