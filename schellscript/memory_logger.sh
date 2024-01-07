#!/bin/bash


if [  -d $HOME/performance ] ; then
        echo "The directory $HOME/performance exists"
else
        mkdir $HOME/performance
        
fi
free > $HOME/performance/memory.log

cat ~/performance/memory.log