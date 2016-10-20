#!/bin/bash
 # this script prompts the user for a count of dice and then rolls them
 # done by Ritesh panchal 
 
 #variables
 declare -i count 
 count=0 #number of dice to roll
 declare -i sides
 sides=0 number of sides per die , must between 4 and 20 inclusive
 
 ### Functions
 function usage {
     echo "Usage: $0 [-h] [-c numberofdice] [-snumberofsideperdie] [-s 4-20]"
 }
 function error-message {
     echo "$@"  >&2
     
 }
 ## command line processing 
while [ $# -gt 0 ];do
 case "$1" in
 
  -h)
  
    echo "Usage: $0 [-h] [-c numberofdice] [-snumberofsideperdie] [-s 4-20]  "
    exit 0
    ;;
    -c)
        if [["$2" =~ ^[1-9][0-9]*$ ]];then 
        count=$2
        shift
        else
            error-message "you gave me '$2' as the number of dice to roll , bad plan muchcho" >&2
            exit 1
        fi
    ;;
    -s)
        if [["$2" =~ ^[1-9][0-9]*$ ]]; then
        if [$2 -lt 4 o $2 -gt 20]; then
        echo "Number of sides must be between 4 and 20 ,inclusive ,fool" >$2
               
                sides=$2
             shift
        fi
        else
            error-message "you gave me '$2' as the number of sides  per die  , no way that happening " >&2
            exit 1
        fi
    ;;
    * )
    
    error-message "i dont understand '$1'" >&2
    echo "Usage: $0 [-h] [-c numberofdice] [s- 4-20]"
  exit 1
  ;;
  
  esac
  shift
 done
 
 ### user input volidation
 
  # get a valid roll count from the user
 
 until [ $count -gt 0]; do
   read -p "How many dice shall I roll[1-5]? " count
   #ignore empty guesses
   
   [ -n "$count" ] || continue
 
done 
until [ $sides -gt 3 -a $sides -lt 21 ]; do
read -p "How many sides each have [4-20]" sides 


done
### main 

 # do the dice roll as many times as the user asked for
 for (( rolls=0 ; rolls < count ; rolls++ )); do
 # roll the dice
die1=$(($RANDOM % $sides +1))
 echo "Rolled $die1"
  done
  