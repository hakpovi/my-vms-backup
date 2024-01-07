#!/bin/bash

IFS="."

name=Simon.Smith

out="output.txt"

echo $name > "$HOME/$out"

cat output.txt