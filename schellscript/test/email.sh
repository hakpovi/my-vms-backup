#!/usr/bin/env bash
set -e

workdir=$(dirname "$(readlink -f "${0}")")

readonly INVALID_CL_ARG_NUM="155"

terminate() {
    local -r msg="${1}"
    local -r code="${2:-150}"
    echo "${msg}" >&2
    exit "${code}"
}

declare -A email_address=(
 ["Mark"]="mark@kodekloud.com"
 ["Kriti"]="kriti@kodekloud.com"
 ["Enrique"]="enrique@kodekloud.com"
 ["Feng"]="feng@kodekloud.com"
)

for employee in "${!email_address[@]}"
do
	echo " "${employee}"'s email is: "${email_address[$employee]}""

done
