#!/usr/bin/env bash

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

is_rebasing() {
	git rebase --show-current &> /dev/null
	if [[ $? -eq "0" ]]; then
		return 1;
	fi
	return 0;
}

get_current_branch_symbol() {
	is_rebasing
	if [[ $? -eq "1" ]]; then
		echo "↺"
		return;
	fi

	is_detached
	if [[ $? -eq "1" ]]; then
		echo "✖ $(git rev-parse --short HEAD)"
		return;
	fi

	echo "$(git branch --show-current)"
}

get_commit_diff_counts() {
	is_detached
	if [[ $? -eq "1" ]]; then
		return 0;
	fi

	local result=""
	local remote_name=$(git rev-parse --abbrev-ref --symbolic-full-name @{u})
	local after=$(git rev-list --left-right --count  HEAD...${remote_name} | cut -c1)
	if [[ "${after}" -ne "0" ]]; then
		result+="↑${after}"
	fi

	local before=$(git rev-list --left-right --count  HEAD...${remote_name} | cut -c3)
	if [[ "${before}" -ne "0" ]]; then
		result+="↓${before}"
	fi

	echo "${result}"
}

get_stash_symbol() {
	local count=$(git stash list | wc -l | tr -d ' ')
	if [[ "$count" -eq "0" ]]; then
		return;
	fi

	echo "★${count}"
}

parse_git_branch() {
	git branch &> /dev/null
	if [[ $? -ne "0" ]]; then
		return 0;
	fi

	local result=""

	##### Stash Info #####
	local stashed="$(get_stash_symbol)"
	if [[ -n "${stashed}" ]]; then
		result+=" ${stashed}"
	fi

	##### Branch Info #####
	result+=" ($(get_current_branch_symbol))"

	##### Remote Info #####
	local remote_diff=$(get_commit_diff_counts)
	if [[ -n "${remote_diff}" ]]; then
		result+=" ${remote_diff}"
	fi

	##### Stage Info #####
	local unstaged=$(get_unstaged_symbol)
	if [[ -n "${unstaged}" ]]; then
		result+=" ${unstaged}"
	fi
	local staged=$(get_staged_symbol)
	if [[ -n "${staged}" ]]; then
		result+=" ${staged}"
	fi

	echo "${result} "
}

export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32;40m\]\h\[\e[m\]:\[\e[31m\]\w\[\e[m\]\[\e[36m\] \$(parse_git_branch)\\$\[\e[m\] "
export CLICOLOR=1
export LSCOLORS=ExGxFxdxCxDxDxhbadExEx
