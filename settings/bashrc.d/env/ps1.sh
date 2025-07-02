#!/usr/bin/env bash

##### SYMBOLS #####
_SYMBOL_REBASE="↺"
_SYMBOL_UNSTAGED="*"
_SYMBOL_STAGED="+"
_SYMBOL_DETACHED="✖ "
_SYMBOL_AHEAD="↑"
_SYMBOL_BEFORE="↓"
 
get_status_symbols() {
	local status_output
	status_output=$(git status --porcelain 2>/dev/null)
	
	local unstaged_count=0
	local staged_count=0
	
	if [[ -n "${status_output}" ]]; then
		while IFS= read -r line; do
			[[ "${line:0:1}" != " " ]] && ((staged_count++))
			[[ "${line:1:1}" != " " ]] && ((unstaged_count++))
		done <<< "${status_output}"
	fi
	
	local result=""
	[[ "${unstaged_count}" -ne 0 ]] && result+="${_SYMBOL_UNSTAGED}${unstaged_count} "
	[[ "${staged_count}" -ne 0 ]] && result+="${_SYMBOL_STAGED}${staged_count} "
	
	echo "${result}"
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
		echo "${_SYMBOL_REBASE}"
		return;
	fi

	is_detached
	if [[ $? -eq "1" ]]; then
		echo "${_SYMBOL_DETACHED}$(git rev-parse --short HEAD)"
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
	local remote_name
	remote_name=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
	
	if [[ -n "${remote_name}" ]]; then
		local counts
		counts=$(git rev-list --left-right --count HEAD...${remote_name} 2>/dev/null)
		if [[ -n "${counts}" ]]; then
			local ahead=$(echo "${counts}" | cut -d$'\t' -f1)
			local behind=$(echo "${counts}" | cut -d$'\t' -f2)
			
			if [[ "${ahead}" -ne "0" ]]; then
				result+="${_SYMBOL_AHEAD}${ahead}"
			fi
			if [[ "${behind}" -ne "0" ]]; then
				result+="${_SYMBOL_BEFORE}${behind}"
			fi
		fi
	fi

	echo "${result}"
}

get_stash_symbol() {
	local count
	count=$(git stash list 2>/dev/null | wc -l)
	count=${count// /}
	
	if [[ "${count}" -eq "0" ]]; then
		return;
	fi

	echo "★${count}"
}

parse_git_branch() {
	git rev-parse --is-inside-work-tree &>/dev/null || return 0

	local result=""

	##### Branch Info #####
	result+="($(get_current_branch_symbol)) "

	##### Remote Info #####
	local remote_diff=$(get_commit_diff_counts)
	if [[ -n "${remote_diff}" ]]; then
		result+="${remote_diff} "
	fi

	##### Stash Info #####
	local stashed="$(get_stash_symbol)"
	if [[ -n "${stashed}" ]]; then
		result+="${stashed} "
	fi

	##### Stage Info #####
	local status_symbols=$(get_status_symbols)
	if [[ -n "${status_symbols}" ]]; then
		result+="${status_symbols}"
	fi

	echo "${result}"
}

export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32;40m\]\h\[\e[m\]:\[\e[31m\]\w\[\e[m\]\[\e[36m\] \$(parse_git_branch)\\$\[\e[m\] "
export CLICOLOR=1
export LSCOLORS=ExGxFxdxCxDxDxhbadExEx
