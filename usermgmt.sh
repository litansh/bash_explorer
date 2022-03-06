#!/bin/bash
#-- Variables
USERC="$(sed -n '1p' /var/www/admin/usermgmtdir/usermgmtparam)" 
PASS="$(sed -n '2p' /var/www/admin/usermgmtdir/usermgmtparam)" 
PERM="$(sed -n '3p' /var/www/admin/usermgmtdir/usermgmtparam)"

HN="$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep 192.168)"

HIP="$(sed -n '1p' /var/www/it/restarthttpd/restarthttpddir/restarthttpdparam)"
USER="$(sed -n '1p' /var/www/it/restarthttpd/loggeduserdir/loggeduser)"
FILE="${USER}.txt"
STAT="stat.txt"

#-- admins email
SM="litansh@gmail.com"

#-- Editing function for users
function edit_ () {

sed "/$USERC/d" -i /etc/httpd/.htpasswd_$PERM
printf "${USERC}:$(openssl passwd -crypt $PASS)\n" >> /etc/httpd/.htpasswd_$PERM
if [ "$PERM" == "admin" ];
 then
 sed "/$USERC/d" -i /etc/httpd/.htpasswd_it /etc/httpd/.htpasswd_dev
 echo /etc/httpd/.htpasswd_amdin | grep ${USERC} | tee /etc/httpd/.htpasswd_it /etc/httpd/.htpasswd_dev
fi
}
#-- Run function edit_
edit_

#-- Mail to admins
echo "Details: Username: $USERC Password: $PASS" | mail -s "User $USERC has been edited on CM ($HN)!" $SM

#-- if both logs exists
function both_ () {
echo -e " ${USER} :    " >> /var/www/it/restarthttpd/${FILE}
cat /var/weblogs/${HIP}/stat/${STAT} >> /var/www/it/restarthttpd/${FILE}
LL="$(awk 'END{print}' /var/www/it/restarthttpd/${FILE})"
echo -e "${LL}" >> /var/www/it/${STAT}
}

#-- if only stat log exists
function stat_ () {
echo -e " ${USER} :    " >> /var/www/it/${STAT}
cat /var/weblogs/${HIP}/stat/${STAT} >> /var/www/it/${STAT}
cat >/var/www/it/restarthttpd/${FILE}  <<-"EOF"
LOG:
START >> 
EOF
echo -e " ${USER} :    " >> /var/www/it/${FILE}
cat /var/weblogs/${HIP}/stat/${STAT} >> /var/www/it/restarthttpd/${FILE}
}

#-- if only user log exists
function user_ () {
cat >/var/www/it/restarthttpd/${FILE}  <<-"EOF"
LOG:
START >> 
EOF
echo -e " ${USER} :    " >> /var/www/it/restarthttpd/${FILE}
cat /var/weblogs/${HIP}/stat/${STAT} >> /var/www/it/restarthttpd/${FILE}
cat /var/www/it/restarthttpd/${FILE} >> /var/www/it/${STAT}
}

#-- Permissions
chmod -R 777 /var/www/it/restarthttpd
chmod +x /var/www/it/restarthttpd/restarthttpd.sh
sed -i -e 's/\r$//' /var/www/it/restarthttpd/restarthttpd.sh

#-- check which log exists
CHECKF="$(cat /var/www/it/restarthttpd/$FILE | wc -l)"
CHECKS="$(cat /var/www/it/$STAT | wc -l)"
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
LL="$(awk 'END{print}' /var/www/it/restarthttpd/${FILE})"
if [ "$CHECKM" == "0" ];
then
mkdir /var/weblogs/${HIP}/logs/${MONTH}
mkdir /var/weblogs/${HIP}/logs/${MONTH}/${DATE}
echo -e "${LL}" >> /var/weblogs/${HIP}/logs/${MONTH}/${DATE}/${FILE}
elif [ "$CHECKM" != "0" ] && [ "$CHECKL" == "0" ];
then
mkdir /var/weblogs/${HIP}/logs/${MONTH}/${DATE}
echo -e "${LL}" >> /var/weblogs/${HIP}/logs/${MONTH}/${DATE}/${FILE}
else

fi 
echo -e "${LL}" >> /var/weblogs/${HIP}/logs/${MONTH}/${DATE}/${FILE}
#-- Remove editing scraps
rm -rf /var/www/admin/usermgmtdir/usermgmtdir

#-- remove all logs file and dir
rm -rf /var/weblogs/${FILE}
rm -rf /var/weblogs/${HIP}/stat/${STAT}
rm -rf /var/www/it/restarthttpd/${FILE}
rm -rf /var/www/it/restarthttpd/restarthttpddir
rm -rf /var/www/it/restarthttpd/loggeduserdir
rm -rf /var/www/it/loggeduserdir
rm -rf /var/www/it/${FILE}

echo "Done"
exit 0
