#!/bin/bash

function eou_show_stack()
{
	stack_pos=0
	for dir in $(dirs); do
		echo "[$stack_pos] $dir"
		stack_pos=$((stack_pos+1))
	done
}

function eou_pushd()
{
	local dir
	if [[ $# -eq 0 ]]; then
		dir="${HOME}"
	else
		dir="${1}"
	fi

	builtin pushd "${dir}" > /dev/null
}

function eou_popd()
{
	local count=$1
	if [[ $# -eq 0 ]]; then
		count=1
	fi
	for ((i = 0; i < $count; i++)); do
		builtin popd >/dev/null
	done
}

function eou_pushd_builtin()
{
	builtin pushd > /dev/null
}

function eou_up()
{
	local count=$1
	if [[ $# -eq 0 ]]; then
		count=1
	fi
	local command
	for ((i = 0; i < $count; i++)); do
		command+="../"
	done
	eou_pushd $command
}

alias up='eou_up'
alias cd='eou_pushd'
alias back='eou_popd'
alias flip='eou_pushd_builtin'
alias stack='eou_show_stack'
