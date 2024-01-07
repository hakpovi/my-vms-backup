#!/usr/bin/env bash

set -e 

readonly CONF_FILE="./fqdn.properties"
readonly SERVER_NAMES="server1 server2 server3"
readonly DEFAULT_USER="herve"
readonly ERROR_FILE=150


terminate() {
    local msg="${1}"
    local code="${2:-160}"
    echo "Error: ${msg}" >&2 
    exit "${code}"
}


if [[ -s "${CONF_FILE}" ]]
then
    terminate "FQDN file is empty" "${ERROR_FILE}"
fi

fdqn=$(cat "${CONF_FILE}")

for server in ${SERVER_NAMES}

do
    echo ${DEFAULT_USER}@${server}.${fqdn}
done 

exit 0
