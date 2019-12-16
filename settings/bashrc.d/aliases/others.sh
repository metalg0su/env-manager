# ----- tmux
alias tmux-k="tmux kill-server"

# ----- python
alias S='source venv/bin/activate'
alias ipython="ipython --TerminalInteractiveShell.editing_mode=vi"
# ref: https://rampart81.github.io/post/python-ctags/
alias python_ctags="ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags . $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

