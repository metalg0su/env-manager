#!/usr/bin/env bash

export PATH="$PATH:$HOME/.pyenv/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VERSION=3.7.3
pyenv virtualenvwrapper_lazy
