#!/bin/bash

read -p "What is your first name? : "  first_name
echo 

read -p "What is your surname/family name? : "  surname
echo

read  -N 4 -p "What is your extension number? (must be 4 digits): "  extension_number
echo

read -N 4 -s -p "What access code would you like to use when dialing in? : (must be 4 digits) " access_code


echo $first_name,$surname,$extension_number,$access_code  >> ./extension.scv