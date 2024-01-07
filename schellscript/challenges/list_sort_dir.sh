#!/bin/bash

set -o pipefail


path=$1

directory=$(echo $1 | awk  -F'/' '{print $NF}')

display() {

   echo '================='
   echo   "${directory^^}"
   echo '================='

}
PS3="Plese choose type of sort or type 3 to exit ? " 
select order in ascending_order descending_order exit
do 
if [[ $order == ascending_order ]]
  then  
    display
    ls -l $1 | sort -k9 

elif [[ $order == descending_order ]]
    then 
    display
    ls -l $1 | sort -r -k9 
elif [[ $order == exit ]]
then
    exit

fi
done

            
         
         

           
        


        










