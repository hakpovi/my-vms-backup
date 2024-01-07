#!/bin/bash

set -o pipefail

# This is the log file we're interested in
logfile="/etc/logs/error.log"

echo "Number of times each error message appears:"

cat "${logfile}" | grep "DB_CONN_FAILURE" | sort | uniq -c ||  { echo "Error encountered in pipe commands" >&2; exit 1; }
