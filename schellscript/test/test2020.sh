Create a script called phonebook.sh in /home/bob/script directory. Also remember to make it executable. Once you are done creating the script try to execute the same to ensure your changes work fine.


Using the declare -Amodifier, create an associative array variable called phonebook.


Initialise the associative array with the following Phone Numbers:


Fire Department -    555-0001
Police Department -555-0002
Hospital -                 555-0003

The script should request the user for input, and should return the phone number depending upon the input passed by the user.


To finish passing inputs, type stop.


Note: Remember that associative arrays are case-sensitive. If an element that doesn’t exist is passed, return No phone number found for ${department}.




#!/bin/bash
declare -A phonebook
# Populate the phonebook
phonebook=(
  ["Fire Department"]="555-0001"
  ["Police Department"]="555-0002"
  ["Hospital"]="555-0003"
)
while read -p "Enter the department name (or 'stop' to exit): " department; do
  if [[ "${department}" == "stop" ]]; then
    break
  fi
  if [[ ! -n "${phonebook[${department}]}" ]]; then
      echo "No phone number found for ${department}."
  fi
  echo "Phone number for ${department}: ${phonebook[${department}]}"
done









=====================================================================================


There is a script called email.sh in /home/bob/script directory. Update this script as below:


Create a for loop that iterates the array.


The for loop should print the key and the value for each element in the array in the following format:


Kriti's email is kriti@kodekloud.com
Mark's email is mark@kodekloud.com
Enrique's email is enrique@kodekloud.com
Feng's email is feng@kodekloud.com




solution:




#!/bin/bash
declare -A email_address=(
 ["Mark"]="mark@kodekloud.com"
 ["Kriti"]="kriti@kodekloud.com"
 ["Enrique"]="enrique@kodekloud.com"
 ["Feng"]="feng@kodekloud.com"
)
for key in "${!email_address[@]}"; do
  echo "${key}'s email is ${email_address[${key}]}"
done
