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


declare -A phonebook=(["Fire"]="555-0001" ["Police"]="555-0002" ["Hospital"]="555-0003" )

phonebook() {
	cat <<EOF
Fire
Police
Hospital
Stop
EOF
}

PS3="please select your department or select stop to exit: "
select department in Fire Police Hospital Stop

# while	read -p "please select your department or select stop to exit: " choice 
do
	case $department in

	Fire) echo "Phone number for Fire: ${phonebook[Fire]}" 
	;;

	Police) echo "Phone number for police: ${phonebook[Police]}" 
	;;

	Hospital) echo "Phone number for Hospital: ${phonebook[Hospital]}"
	;;

	Stop) break
	;;

	*) echo "No phone number found for "${department}""
		
	esac
done
	
exit 0
		



