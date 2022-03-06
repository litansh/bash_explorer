#!/bin/bash

border()
{
cd /
longstr="$(cat ./dblist.txt | awk '{if(length>x){x=length;y=$0}}END{print y}')"
longlen=${#longstr}
edge=$(echo "$longstr" | sed 's/./-/g') 
echo "+$edge--+"
while read line; do
 strlen=${#line}
 echo -n "| $line"
 gap=$((longlen - strlen))
 if [ "$gap" > 0 ]; then
  for i in $(seq 1 $gap); do echo -n " "; done
  echo " |"
 else
  echo " |"
 fi
done < "dblist.txt"
echo "+$edge--+"
}

border "$x"








