#!/bin/bash
user=get user from php
host=lcms

function checkinstall_ (){
if [ $checkepel == 0 ]; then
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
elif [ $checkgoogle == 0 ]; then
sudo yum install google-authenticator -y
fi
}

checkepel="$(history | grep epel-release-latest-7.noarch.rpm | wc -l)"
checkgoogle="$(google-authenticator --help | grep "--time-based" | wc -l)"

checkinstall_

google-authenticator
y
y
y
n
y

https://www.google.com/chart?chs=200x200&chld=M|0&cht=qr&chl=otpauth://totp/${user}@${host}%3Fsecret%3${sercretkey}%26issuer%3D${host}

sercretkey="$(head -n 1 ~/.google_authenticator)"

cp ~/.google_authenticator /etc/httpd/ga_auth/$user
rm -rf ~/.google_authenticator

   <Directory />
     Options FollowSymLinks ExecCGI
     AllowOverride All
     Order deny,allow
     Allow from all

     AuthType Basic
     AuthName "Shhhhh, secret."
     AuthBasicProvider "google_authenticator"
     Require valid-user
     GoogleAuthUserPath ga_auth
     GoogleAuthCookieLife 3600
     GoogleAuthEntryWindow 2
   </Directory>

   tail -f /var/log/htttpd/error_log