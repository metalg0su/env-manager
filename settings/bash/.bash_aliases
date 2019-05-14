# aliases
alias mv='mv -i'
alias tmux-k="tmux kill-server"
alias C=clear
alias p='cd ..'

alias S='source venv/bin/activate'

# python for ctags. https://rampart81.github.io/post/python-ctags/
alias python_ctags="ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags . $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")"
alias ipython="ipython --TerminalInteractiveShell.editing_mode=vi"
