#!/usr/bin/env bash
set -e
set -u 

set -o pipefail


# it is a good practice to set a logging function in order to make tack of the script according to the date
# Do it like following 

log() {
   echo $(date -u +"%Y-%m-%dT%H:%M:%SZ") "${@}"
}

workdir=$(dirname "$(readlink -f "${0}")")

readonly INVALID_CL_ARG_NUM="155"

terminate() {
    local -r msg="${1}"
    local -r code="${2:-150}"
    echo "${msg}" >&2
    exit "${code}"
}

usage() {

cat <<USAGE
Usage: special-shell.sh [arg]
   This script reads the contents from a file using a filereader binary
   Arguments: 
       filename: An existing non-empty file

USAGE
}

# the script bellow is an example to show the usage of handling error_message and usage _message

if [[ $# -ne 1 || ! -s "${1}" ]]; then

    usage
    terminate "Please pass just one command line argument as a file that exists and is non-empty" "${INVALID_CL_ARG_NUM}"
fi

/usr/local/bin/filereader "${1}"

