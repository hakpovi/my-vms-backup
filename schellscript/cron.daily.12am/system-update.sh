#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
if [ -f /var/run/reboot-required ]
then
    reboot
fi
