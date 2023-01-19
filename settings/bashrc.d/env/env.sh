#!/usr/bin/env bash
export EDITOR=vim
export TERM=xterm-256color
set -o vi  # vi mode

get_unstaged_symbol() {
	count=($(git diff --name-only | wc -l))
	if [[ "${count}" -ne 0 ]]; then
		echo "*${count}"
	fi
}

get_staged_symbol() {
	count=($(git diff --name-only --cached | wc -l))
	if [[ "${count}" -ne 0 ]]; then
		echo "+${count}"
	fi
}

is_detached() {
	branch=$(git branch --show-current)
	if [[ -z "${branch}" ]]; then
		return 1;
	fi
	return 0;
}

get_current_branch_symbol() {
	is_detached
	if [[ $? -eq 0 ]]; then
		echo "$(git branch --show-current)"
	else
		echo "✖ $(git rev-parse --short HEAD)"
	fi
}

get_commit_diff_counts() {
	is_detached
	if [[ $? -eq "1" ]]; then
		return 0;
	fi

	result=""
	remote_name=$(git rev-parse --abbrev-ref --symbolic-full-name @{u})
	after=$(git rev-list --left-right --count  HEAD...${remote_name} | cut -c1)
	if [[ "${after}" -ne "0" ]]; then
		result="${result}↑${after}"
	fi

	before=$(git rev-list --left-right --count  HEAD...${remote_name} | cut -c3)
	if [[ "${before}" -ne "0" ]]; then
		result="${result}↓${before}"
	fi

	echo "${result}"
}

parse_git_branch() {
	git branch &> /dev/null
	if [[ $? -ne "0" ]]; then
		return 0;
	fi

	result="($(get_current_branch_symbol))"

	remote_diff=$(get_commit_diff_counts)
	if [[ -n "${remote_diff}" ]]; then
		result="${result} ${remote_diff}"
	fi

	unstaged=$(get_unstaged_symbol)
	if [[ -n "${unstaged}" ]]; then
		result="${result} ${unstaged}"
	fi

	staged=$(get_staged_symbol)
	if [[ -n "${staged}" ]]; then
		result="${result} ${staged}"
	fi

	echo "${result} "
}

export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32;40m\]\h\[\e[m\]:\[\e[31m\]\w\[\e[m\]\[\e[36m\] \$(parse_git_branch)\\$\[\e[m\] "
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
