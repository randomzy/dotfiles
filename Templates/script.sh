#!/usr/bin/env bash

script_dir="$(dirname -- "$(realpath -e -- ${BASH_SOURCE[0]})")"

red_color="\u001b[31m"
green_color="\u001b[32m"
yellow_color="\u001b[33m"
blue_color="\u001b[34m"
clear_format="\u001b[0m"
bold_decorator="\u001b[1m"

usage()
{
# this construct is called heredoc, allows to pass multiline block
# of text to command
    cat << EOF
Usage: $(basename "${BASH_SOURCE[0]}") [OPTION]...
Options:
    -h      help
EOF
}

# colon at the beginning of getopts string enables silent
# error mode, errors are handled in the default case
# colon after the option letter requires option argument
# the option argument is written in the OPTARG variable
while getopts ":h" option; do
    case $option in
        h)  usage
            exit
            ;; # break
        *) # default: handle errors here
            usage
            exit
            ;;
    esac
done
shift $((OPTIND - 1))

