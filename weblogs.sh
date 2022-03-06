#!/bin/bash
DAY="$(date | awk '{print $2 $3}')"
MY="$(date | awk '{print $2 $6}')"
input="/tmp.txt"
find /var/weblogs -name "$DAY" | grep "$MY" >> /tmp.txt

if [ -s /tmp.txt ];
then

while read line; do
ONEL="$(echo $line | sed 's|./*||')"
cp direct/direct1/*.txt /alert.txt

done < "$input"

fi

tar -zcvfP lcmslogs$DA$MY.tar.gz --absolute-names /alert.txt

DAY="$(date | awk '{print $2 $3}')"
MY="$(date | awk '{print $2 $6}')"
echo -e "Weblogs of today attached to mail" | mail -a cmslogs$DA$MY.tar.gz -s "lcms Weblogs of $DA$MY" litansh@gmail.com

#rm -rf /tmp.txt
#rm -rf /lcmslogs$DA$MY.tar.gz
