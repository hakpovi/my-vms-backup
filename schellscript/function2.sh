#!/bin/bash


function read_numbers(){
  read -p "Enter Number1: " number1
  read -p "Enter Number2: " number2
}

lists=("Add" "Subtract" "Multiply" "Divid" "Quit")

PS3="Enter your choice: "
select  operator in "${lists[@]}"

do
    
    case "$operator" in

    Add) read_numbers
        echo $(( $number1 + $number2 )) ;;
    Subtract)
        read_numbers
        echo $(( $number1 - $number2 )) ;;

    Multiply)
        read_numbers
        echo $(( $number1 * $number2 )) ;;

    Divid)
        read_numbers
        echo $(( $number1 / $number2 )) ;;

    Quit)  break

    esac

done



