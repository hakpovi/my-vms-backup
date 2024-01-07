#!/usr/bin/env bash

set -e

usage() {
        cat <<EOF
Usage: special-shell.sh [arg]
   This script reads the contents from a file using a filereader binary
   Arguments:
       filename: An existing non-empty file
EOF
}
