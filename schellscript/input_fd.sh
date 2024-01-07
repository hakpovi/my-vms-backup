#!/usr/bin/env bash

if [[  -t 0   ]] 
then
	echo "Input passed through Keyboard"
	read
else
	echo "Input entered from a file or a pipeline"
	read
fi
