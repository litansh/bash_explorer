#!/bin/sh -
curl -s -X GET "https://api.Cloudflare.com/client/v4/zones/?per_page=100" -H "X-Auth-Email: litansh@gmail.com" -H "X-Auth-Key: 000ff94c063a8ad911ac223ea230dfd44aff1" -H "Content-Type: application/json" | jq -r '.result[] | "\(.id) \(.name)"' | grep -w "litanshamir.com" >>  /var/www/lcms/tmpaa.txt
while read line; do
ALL="$(echo $line)"
DM=${ALL:33:70}
cat >/var/www/lcms/tmpaaa.txt <<-"EOF"
<option value="aaa">bbb</option>
###
EOF
BUTTON=$(</var/www/lcms/tmpaaa.txt)
TBC="###"
awk -v X="$TBC" -v Y="$BUTTON" '{sub(X, Y)}1' /var/www/lcms/modules/sitetodev/sitetodev.php > /var/www/lcms/modules/sitetodev/sitetodev_tmp.php && mv -f /var/www/lcms/modules/sitetodev/sitetodev_tmp.php /var/www/lcms/modules/sitetodev/sitetodev.php
TMPA="aaa"
TMPB="bbb"
sed -i "s/${TMPA}/$DM/g" /var/www/lcms/modules/sitetodev/sitetodev.php
sed -i "s/${TMPB}/$DM/g" /var/www/lcms/modules/sitetodev/sitetodev.php
rm -rf /var/www/lcms/tmpaaa.txt
done < /var/www/lcms/tmpaa.txt

rm -rf /var/www/lcms/tmpaaa.txt
