#!/bin/bash

#-- Permanent Variables
HIP="$(sed -n '1p' /var/www/lcms/modules/$OPT/paramdir/paramfile)"
USER="$(sed -n '1p' /var/www/lcms/modules/$OPT/loggeduserdir/loggeduser)"
OPT="$(sed -n '1p' /var/www/lcms/modules/opt.txt)"
OPTC="$(sed -n '2p' /var/www/lcms/modules/opt.txt)"
OPTD="$(sed -n '3p' /var/www/lcms/modules/opt.txt)"
FILE="${USER}.txt"
STAT="stat.txt"

#-- local server permissions
function perm_ () {
find /var/www/lcms/modules/* -type d -exec chmod 755 '{}' \;
find /var/www/lcms/modules/* -type f -exec chmod 644 '{}' \;
find /var/www/lcms/modules/* -type .sh -exec chmod +x '{}' \;
chown -R apache:apache /var/www/
}

perm_

#-- copy parameter to remote host 
function scp_ () {
sudo -uroot scp -P 22 /var/www/lcms/modules/$OPT/paramdir/* root@${HIP}:/var/
sudo -uroot scp -P 44455 /var/www/lcms/modules/$OPT/paramdir/* root@${HIP}:/var/
sudo -uroot scp -P 44433 /var/www/lcms/modules/$OPT/paramdir/* root@${HIP}:/var/
sudo -uroot scp -P 33333 /var/www/lcms/modules/$OPT/paramdir/* root@${HIP}:/var/
sudo -uroot scp -P 51111 /var/www/lcms/modules/$OPT/paramdir/* root@${HIP}:/var/
}

scp_

#-- run script on remote host ssh
function ssh_ () {
sed -i -e 's/\r$//' /var/www/lcms/modules/$OPT/$OPT2
HIP="$(sed -n '1p' /var/www/lcms/modules/$OPT/paramdir/paramfile)"
sudo -uroot ssh -p'22' root@${HIP} 'bash -s' < /var/www/lcms/modules/$OPT/$OPTC
sudo -uroot ssh -p'44455' root@${HIP} 'bash -s' < /var/www/lcms/modules/$OPT/$OPTC
sudo -uroot ssh -p'44433' root@${HIP} 'bash -s' < /var/www/lcms/modules/$OPT/$OPTC
sudo -uroot ssh -p'33333' root@${HIP} 'bash -s' < /var/www/lcms/modules/$OPT/$OPTC
sudo -uroot ssh -p'51111' root@${HIP} 'bash -s' < /var/www/lcms/modules/$OPT/$OPTC
}

ssh_

#-- copy status from remote host to server
function scps_ () {
sudo -uroot scp -P 22 root@${HIP}:/var/${STAT} /var/weblogs/${HIP}/stat/
sudo -uroot scp -P 44433 root@${HIP}:/var/${STAT} /var/weblogs/${HIP}/stat/
sudo -uroot scp -P 44455 root@${HIP}:/var/${STAT} /var/weblogs/${HIP}/stat/
sudo -uroot scp -P 33333 root@${HIP}:/var/${STAT} /var/weblogs/${HIP}/stat/
sudo -uroot scp -P 51111 root@${HIP}:/var/${STAT} /var/weblogs/${HIP}/stat/
}

scps_

#-- delete file on remote host ssh
function sshdel_ () {
chmod +x /var/www/lcms/modules/$OPT/$OPTD
sed -i -e 's/\r$//' /var/www/lcms/modules/$OPT/$OPTD
HIP="$(sed -n '1p' /var/www/lcms/modules/$OPT/paramdir/paramfile)"
sudo -uroot ssh -p'22' root@${HIP} 'bash -s' < /var/www/lcms/modules/$OPT/$OPTD
sudo -uroot ssh -p'44455' root@${HIP} 'bash -s' < /var/www/lcms/modules/$OPT/$OPTD
sudo -uroot ssh -p'44433' root@${HIP} 'bash -s' < /var/www/lcms/modules/$OPT/$OPTD
sudo -uroot ssh -p'33333' root@${HIP} 'bash -s' < /var/www/lcms/modules/$OPT/$OPTD
sudo -uroot ssh -p'51111' root@${HIP} 'bash -s' < /var/www/lcms/modules/$OPT/$OPTD
}

sshdel_

#-- if both logs exists
function both_ () {
echo -e " ${USER} :    " >> /var/www/lcms/modules/$OPT/${FILE}
cat /var/weblogs/${HIP}/stat/${STAT} >> /var/www/lcms/modules/$OPT/${FILE}
LL="$(awk 'END{print}' /var/www/lcms/modules/$OPT/${FILE})"
echo -e "${LL}" >> /var/www/lcms/modules/${STAT}
}

#-- if only stat log exists
function stat_ () {
echo -e " ${USER} :    " >> /var/www/lcms/modules/${STAT}
cat /var/weblogs/${HIP}/stat/${STAT} >> /var/www/lcms/modules/${STAT}
cat >/var/www/lcms/modules/$OPT/${FILE}  <<-"EOF"
LOG:
START >> 
EOF
echo -e " ${USER} :    " >> /var/www/lcms/modules/${FILE}
cat /var/weblogs/${HIP}/stat/${STAT} >> /var/www/lcms/modules/$OPT/${FILE}
}

#-- if only user log exists
function user_ () {
cat >/var/www/lcms/modules/$OPT/${FILE}  <<-"EOF"
LOG:
START >> 
EOF
echo -e " ${USER} :    " >> /var/www/lcms/modules/$OPT/${FILE}
cat /var/weblogs/${HIP}/stat/${STAT} >> /var/www/lcms/modules/$OPT/${FILE}
cat /var/www/lcms/modules/$OPT/${FILE} >> /var/www/lcms/modules/${STAT}
}

#-- check which log exists
CHECKF="$(cat /var/www/lcms/modules/$OPT/$FILE | wc -l)"
CHECKS="$(cat /var/www/lcms/modules/$STAT | wc -l)"
if [ "$CHECKF" != "0" ] && [ "$CHECKS" != "0" ];
then
both_
elif [ "$CHECKF" == "0" ] && [ "$CHECKS" != "0" ];
then
stat_
else
user_
fi
 
#-- move user log to all history logs
DATE="$(date | awk '{print $2 $3}')"
MONTH="$(date | awk '{print $2 $6}')"
CHECKM="$(cat /var/weblogs/${HIP}/logs/${MONTH} | wc -l)"
CHECKL="$(cat /var/weblogs/${HIP}/logs/${MONTH}/${DATE} | wc -l)"
if [ "$CHECKM" == "0" ];
then
mkdir /var/weblogs/${HIP}/logs/${MONTH}
mkdir /var/weblogs/${HIP}/logs/${MONTH}/${DATE}
elif [ "$CHECKM" != "0" ] && [ "$CHECKL" == "0" ];
then
mkdir /var/weblogs/${HIP}/logs/${MONTH}/${DATE}
fi
LL="$(awk 'END{print}' /var/www/lcms/modules/$OPT/${FILE})"
echo -e "${LL}" >> /var/weblogs/${HIP}/logs/${MONTH}/${DATE}/${FILE}

#-- remove all logs file and dir
#rm -rf /var/weblogs/${FILE}
#rm -rf /var/weblogs/${HIP}/stat/${STAT}
#rm -rf /var/www/lcms/modules/$OPT/${FILE}
#rm -rf /var/www/lcms/modules/$OPT/paramdir
#rm -rf /var/www/lcms/modules/$OPT/loggeduserdir
#rm -rf /var/www/lcms/modules/loggeduserdir
#rm -rf /var/www/lcms/modules/${FILE}

echo "Done"





