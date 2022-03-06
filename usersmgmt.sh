#!/bin/bash
#-- Parameters Variables 
USER="$(sed -n '1p' /var/www/admin/usermgmtdir/usermgmtparam)" 
PASS="$(sed -n '2p' /var/www/admin/usermgmtdir/usermgmtparam)" 
PERM="$(sed -n '3p' /var/www/admin/usermgmtdir/usermgmtparam)" 

function run_ () {
sed "/$USER/d" -i /etc/httpd/.htpasswd_$PERM
printf "${USER}:$(openssl passwd -crypt $PASS)\n" >> /etc/httpd/.htpasswd_$PERM
if [ "$PERM" == "admin" ];
 then
 sed "/$USER/d" -i /etc/httpd/.htpasswd_it
 sed "/$USER/d" -i /etc/httpd/.htpasswd_dev
 printf "${USER}:$(openssl passwd -crypt $PASS)\n" >> /etc/httpd/.htpasswd_admin
 cat /etc/httpd/.htpasswd_amdin | grep ${USER} >> /etc/httpd/.htpasswd_it
 cat /etc/httpd/.htpasswd_amdin | grep ${USER} >> /etc/httpd/.htpasswd_dev
fi
}

run_
echo "Done"
exit 0


