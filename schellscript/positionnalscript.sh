#!/bin/bash

 # echo "please choose the kind of calculation you'd like to perform: + or - $1: \n" 

# echo "please,  provide all numbers you wanna perform the calculation on, each separated with a space: $2 $3 $4 $5 $6 $7 $8 $9 \n"


echo "The result of this operation is: $(( ${2:-0} $1 ${3:-0} $1 ${4:-0} $1  ${5:-0} $1 ${6:-0} $1  ${7:-0} $1 ${8:-0} $1 ${9:-0} ))"

echo " Hi, the number of paramaters you have applied the calculation is  $(( $# -1 ))"

echo $0

echo "$@"

# touch $@


