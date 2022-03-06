#!/bin/bash

HIP="$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep 192.168)"
NFSP="/var/stat.txt"
PORT="$(sed -n '2p' /var/paramfile)"
STATUS="active (running)"

#function perm_ () {
#find /var/www/* -type d -exec chmod 755 '{}' \;
#find /var/www/* -type f -exec chmod 644 '{}' \;
#}

#perm_

rm -rf ${NFSP}
sed -i "\/Port\s[^0-9]*/c"${PORT}"" /etc/ssh/sshd_config
systemctl restart sshd

CHECK="$(systemctl status sshd | grep "${STATUS}" | wc -l)"
if [ ${CHECK} != 0 ];
then
echo -e " $("date"): Changed SSH Port to ${PORT} on ${HIP} Status: Active Running!! " >> ${NFSP}
else
echo -e " $("date"): Did not change SSH Port on ${HIP}!! Please Check!! " >> ${NFSP}
fi

rm -rf /var/paramfile
echo "Done"
exit 0





