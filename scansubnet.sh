#!/bin/bash
function subtofile_ () {
for i in 'seq 1 255'; do ping -c 1 192.168.$sub.$i; done >> /var/www/lcms/temppa.txt
 while read line; do 
 PING="$(echo $line | grep "ttl=" | wc -l)"
  if [ "$PING" -z ];
   then
   echo "192.168.$sub.$i" >> /var/www/lcms/subnet.txt
  fi
 done < /var/www/lcms/temppa.txt
}

function changephp_ () {
cat >/var/www/lcms/tmpppa.txt <<-"EOF"
<option value="aaa">bbb</option>
###
EOF
BUTTON=$(</var/www/lcms/tmpaaa.txt)
TBC="###"
awk -v X="$TBC" -v Y="$BUTTON" '{sub(X, Y)}1' /var/www/lcms/modules/"$OPT"/"$OPT".php > /var/www/lcms/modules/"$OPT"/"$OPT"_tmp.php && mv -f /var/www/lcms/modules/"$OPT"/"$OPT"_tmp.php /var/www/lcms/modules/"$OPT"/"$OPT".php
TMPA="aaa"
TMPB="bbb"
sed -i "s/${TMPA}/$ip/g" /var/www/lcms/modules/$OPT/$OPT.php
sed -i "s/${TMPB}/$ip/g" /var/www/lcms/modules/$OPT/$OPT.php
rm -rf /var/www/lcms/tmpaaa.txt
}

function addtophp_ () {
while read line; do
ip="$(echo $line)"
if [ cat /var/www/lcms/modules/$OPT/$OPT.php | grep "$ip" | wc -l ];
then
echo "exists"
elif [ "$OPT" != "restartasterisk" ];
then
changephp_
else
IPPBX="$(echo $line | grep "60.5" | wc -l)"
IPPBXB="$(echo $line | grep "60.6" | wc -l)"
if [ "$IPPBX" -z ] || [ "$IPPBXB" -z ];
then
changephp_
fi
fi
done < /var/www/lcms/subnet.txt
}

function runsub_ () {
subtofile_
rm -rf /var/www/lcms/temppa.txt
}

sub="13"
runsub_

sub="60"
runsub_

sub="66"
runsub_

OPT="restartasterisk"
addtophp_
OPT="sshoserver"
addtophp_
OPT="changesshport"
addtophp_
OPT="restarthttpd"
addtophp_
OPT="restartmariadb"
addtophp_
OPT="restartvm"
addtophp_

rm -rf /var/www/lcms/temppa.txt
rm -rf /var/www/lcms/tmpppa.txt
rm -rf /var/www/lcms/subnet.txt


