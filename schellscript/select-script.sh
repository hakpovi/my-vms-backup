#!/bin/bash

PS3=" Please select the number of your favorite day: "
select day in mon tue wed thi fri sat sun;

do 

echo " your favorit day is $day"

break

done