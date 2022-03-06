#!/bin/bash

HIP="$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep 192.168)"
NFSP="/var"

rm -rf /var/paramfile
rm -rf ${NFSP}/stat.txt 

echo "Deleted"
exit 0


