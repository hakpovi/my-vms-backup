#!/usr/bin/env bash 

set -e 
set -o pipefail

set -o noclobber 




# IFS=','

args_at="$@"

args_star="$*"

echo "Here we have the output of \$*: ${args_star} "


echo "Here we have the output of \$@:  ${args_at} " 


echo "here we have the output of \$* for for-loop:"

for element in ${args_star}
do
	echo "${element}"
done 


echo "=========================================="

echo "*                                        *"

echo "=========================================="

echo "here we have the output of \$@ for for-loop:"

for element in ${args_at}
do
        echo "${element}"
done

echo the name of the script being executed is: "${0##*/}"

echo the path of the script being executed is: "${0}"

readonly WORK_DIR=$(dirname $(readlink -f "$0"))

readonly SCRPIT_NAME="${0##*/}"

cd "${WORK_DIR}/.."

exit 0 