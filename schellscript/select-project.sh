#!/bin/bash

read -p "What is your first name? : "  first_name
echo 

read -p "What is your surname/family name? : "  surname
echo

read  -N 4 -p "What is your extension number? (must be 4 digits): "  extension_number
echo

read -N 4 -s -p "What access code would you like to use when dialing in? : (must be 4 digits) " access_code
echo 

PS3=" Please chose in the list your phone: "
select phone in headset handheld;

do 
echo "you have chosen the $phone phone."

break

done
echo 

PS3="Please shose in the list your department:  "
select department in finance sales customer_service engineering;

do 

echo " You have chosen $department department."

break

done

echo $first_name,$surname,$extension_number,$access_code,$phone,$department  >> ./extension.scv






