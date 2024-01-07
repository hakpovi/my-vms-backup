#!/bin/bash

# nbr=$((RANDOM))

nbr=$( awk 'BEGIN {print int(rand() * 10)}' )
read -p "Hello what is your name? " name
read -p "Ok tks $name, please guess a number between 0 and 10: " guess
while [ $guess -ne $nbr ]

do 

    if [  $guess -ne $nbr  ]

    then 

    read -p "wrong answer, try again: " guess

    else  
    break

    fi
    

done
#echo " Hum bien Nina, tu as trouvé le bon nombre. Tu mérites une bonne partie de jambe en ..."
echo "well done $name, you guessed the right number which is $nbr"

#echo " tu veux jouer encore ?"
echo "Do you wanna try again?"

read -r -p "Yes or no? " response

if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]

then 

#echo "hum tu aimes trop baiser."
echo "Hum $name, you liked it, go play other game"

else

echo "Ok $name bye bye!"

fi



