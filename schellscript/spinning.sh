#!/usr/bin/env bash

spin='-\|/'

i=0
while [[ true ]]; do
  printf "\r${spin:$((i%4)):1}"
  sleep 0.1
  ((i++))
done

exit 0



Below is the explanation of spinning.sh script:


a. The spin variable contains a string composed of four characters: -, \, |, and /. When printed sequentially in a loop, these characters create a console animation that resembles a spinning line or wheel. This effect is achieved through the illusion of motion created by the sequence and orientation of these characters.


b The line while [[ true ]]; do signifies an infinite loop. The code block declared inside the loop repeats from top to bottom infinitely.


c. printf prints the \r character, causing the text to print at the same position each time.


d. The script uses printf to expand the ${spin} variable with a specific technique that involves an arithmetic expansion calculating the modulo of i % 4. This calculation determines the position of each character in the spin variable. Here’s how it works:


(i) 0 modulo 4 asks, “What is the remainder when 0 is divided by 4?” Since 0 divided by any number is 0, the remainder is also 0. So, 0 modulo 4 equals 0.


(ii) 1 modulo 4 asks, “What is the remainder when 1 is divided by 4?” Since 1 is less than 4, it can’t be divided by 4 without a remainder. Therefore, the entire number 1 is the remainder. So, 1 modulo 4 equals 1.


Continuing this pattern:


2 modulo 4 equals 2 (2 divided by 4 leaves a remainder of 2).


3 modulo 4 equals 3 (3 divided by 4 leaves a remainder of 3).


4 modulo 4 equals 0 (4 divided by 4 leaves a remainder of 0, as 4 is evenly divisible by 4).


Finally, we have a colon : and a number 1, which extracts a substring to print one character at a time.


This technique is quite common in Bash and is often used to create the popular spinning wheel animation. Feel free to use this script in your future endeavours.

s/^/#