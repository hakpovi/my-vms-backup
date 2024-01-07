#!/usr/bin/env bash

 IFS=":"

# my_list=("element1" "element2" "element3")

my_list="element1:element2:element3"

for element in ${my_list}

do
	echo "${element}  is a value"

done 

