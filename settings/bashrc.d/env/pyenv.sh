#!/usr/bin/env bash

export PATH="$PATH:$HOME/.pyenv/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VERSION=3.9.1
pyenv virtualenvwrapper_lazy
