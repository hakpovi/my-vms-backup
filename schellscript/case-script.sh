#!/bin/bash
PS3="Please select a city in the list above: "
select city in Tokyo London "Los Angeles" Moscow Dubai Manchester "New York" Paris Bangalore Johannesburg Istanbul Milan "Abu Dhabi" Pune Nairobi Berlin Karachi ; do
case "$city" in 
Tokyo) echo "You will visit JAPAN" ;;
Manchester | London) echo "You will visit ENGLAND" ;;
"New York" | "Los Angeles" ) echo "You will visit USA" ;;
Moscow) echo "You will visit RUSSIA" ;;
"Abu Dhabi" | Dubai ) echo "You will visit United Arabe Emirate" ;;
Paris ) echo "You will visit FRANCE" ;;
Bangalore) echo "You will visit JAPAN" ;;
Johannesburg) echo "You will visit SOUTH AFRICA" ;;
Istanbul ) echo "You will visit TURKISH" ;;
Milan ) echo "You will visit ITALIA" ;;
Pune ) echo "You will visit JAPAN" ;;
Nairobi) echo "You will visit KENIA ";;
Berlin) echo "You will visit GERMANY" ;;
Karachi) echo "You will visit PAKISTAN" ;;
\?) echo "invalid option provided" ;;

esac
break
done
