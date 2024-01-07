#!/bin/bash


sudo strace -Tfp $$ 2>&1 | grep -E 'execve' &
