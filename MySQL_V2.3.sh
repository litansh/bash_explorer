#!/bin/bash
#!/bin/sh -
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
#PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
mkdir -p /tmp/mysql-tmp
chmod 777 /tmp/mysql-tmp
#Tmp for pass
TMP=/tmp/mysql-tmp/mysql-tmp23455.log
#Tmp for user
TMP0=/tmp/mysql-tmp/mysql-tmp-validator.log
TMP1=/tmp/mysql-tmp/mysql-tmp455.log
TMP2=/tmp/mysql-tmp
HISTORY=/tmp/mysql-tmp/script_history
#TMPPASSWD="$(cat $TMP)" 
#TMPUSR="$(cat $TMP1)"
#TIMER="/tmp/mysql-tmp/timer-tmp23455.sh"
normal=`echo "\033[m"`
menu=`echo "\033[36m"` #Blue
number=`echo "\033[33m"` #yellow
bgred=`echo "\033[41m"`
fgred=`echo "\033[31m"`
green=`echo "\033[32m"`
blink=`echo "\033[5m" `
whoami=`whoami`
h1=`date +%R:%M%p`
#true > script_history
history -w script_history
hostname=`hostname | cut -d"." -f1`

function help_ () {
echo -e "Commands:"
    echo -e "List Databases:  dbget|getdb|dblist|listdb|dbl|getd|showdb|"show db"|"list db"|"get db"|db|databases|alldb|dbs|showd|listd|dlist "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "
	echo -e " "

}


function baner_  () {
echo
echo -e "${menu}You can connect to database only from this host: ${number}$host ${menu}only!${normal}"
echo
}

#Kill proces on exit for MySQL managment system
function kill_ () {
pkill -9 -P $$ > /dev/null 2>&1
pkill -9 $$ > /dev/null 2>&1
#pkill -9 main_menu.sh
}

#_________Functions for all Start___________
function tmpusr_tmppass_ () {
TMPPASSWD="$(cat $TMP)"
TMPUSR="$(cat $TMP1)"
local CHKUSR="$(ls /tmp/mysql-tmp | grep  "mysql-tmp23455.log" | wc -l)"
local CHKPSSW="$(ls /tmp/mysql-tmp | grep  "mysql-tmp455.log" | wc -l)"
local CHKUSR1="$(cat  /tmp/mysql-tmp/mysql-tmp23455.log | wc -L)"
local CHKPSSW1="$(cat  /tmp/mysql-tmp/mysql-tmp23455.log | wc -L)"
if [ "$CHKUSR" == 0 ] || [ "$CHKPSSW" == 0 ] || [ "$CHKUSR1" -lt 4 ] || [ "$CHKPSSW1" -lt 4 ] ;
then
rm -rf $TMP
rm -rf $TMP1
chk_root_exist_passwd_ && return
else

return
fi
 
}

function border_ () {
tmpusr_tmppass_
userdatabases="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'localhost';" | grep -o -P '(?<=( ON `)).*(?=`.* TO )' ) "
userdatab=$userdatabases
longstr=`(echo "$userdatab" | awk '{if(length>x){x=length;y=$0}}END{print y}')`
longlen=${#longstr}
edge=$(echo "$longstr" | sed 's/./-/g') 
echo -e "+$edge---------------------------+${normal}"
while IFS= read -r line; do
 strlen=${#line}  
 echo -e -n "|${normal} ${green}$line${normal}"
 gap=$((longlen - strlen))
 if [ "$gap" > 0 ]; then
  for i in $(seq 1 $gap); do echo -n " "; done
  echo -e "                          |${normal}"
 else
  echo -e "                          |${normal}"
 fi
done < <(printf '%s\n' "$userdatabases")
echo -e "+$edge---------------------------+${normal}"
}

#Temp password for use MySQL managment system
function back_ () {
if [[ "$dbname" == back ]] || [[ "$dbname" == b ]] || [[ "$dbname" == "^[" ]];
	then
mysql_menu_main_0_
elif [[ "$dbname" == q ]] || [[ "$dbname" == nahuy ]] ;
then
mysql_menu_main_0_
fi

if [[ "$username" == back ]] || [[ "$username" == b ]] || [[ "$username" == "^[" ]];
	then
mysql_menu_main_0_
elif [[ "$username" == q ]] || [[ "$username" == nahuy ]];
then
mysql_menu_main_0_
fi

if [[ "$NEWPASSWD" == back ]] || [[ "$NEWPASSWD" == b ]] || [[ "$NEWPASSWD" == "^[" ]];
	then
mysql_menu_main_0_
elif [[ "$NEWPASSWD" == q ]] || [[ "$NEWPASSWD" == nahuy ]];
then
mysql_menu_main_0_
fi
}

function logo_ () {
clear
cat << "EOF"

     Muuu MMMuuuu :(
 ----------------------
        \   ^__^
         \  (oo)\_______
            (_.)\       )\/\
             ;  ||----??|
             ;  ||     ||



    Vo blya Dmaot!!! :)
 ------------------------
   \
    \
        .--.
       |o_o |
       |:_/ |
      //   \ \
     (|     | )
    /'\_   _/`\
    \___)=(___/
	
	

 Hi Litan! Look on Slava :)
 ------------------------
   \
    \
        .--.
       |o_o |
       |:_/ |
      //   \ \
     (|     | )
    /'\_   _/`\
    \___)=(___/
	
	

EOF
sleep 10
mysql_menu_main_0_
exit 
}

function logo1_ () {
cat << "EOF"

    .-"^`\                                        /`^"-.
  .'   ___\                                      /___   `.
 /    /.---.                                    .---.\    \
|    //     '-.  ___________________________ .-'     \\    |
|   ;|         \/--------------------------//         |;   |
\   ||       |\_)     Linux Managment      (_/|       ||   /
 \  | \  . \ ;  |         System           || ; / .  / |  /
  '\_\ \\ \ \ \ |                          ||/ / / // /_/'
        \\ \ \ \|    Server Release 5.3    |/ / / //
         `'-\_\_\     Codename Tikanga     /_/_/-'`

EOF
}

function logo2_ () {
cat << "EOF"
          _,.
        ,` -.)
       '( _/'-\\-.               
      /,|`--._,-^|            ,     
      \_| |`-._/||          ,'|       
        |  `-, / |         /  /      
        |     || |        /  /       
         `r-._||/   __   /  /  
     __,-<_     )`-/  `./  /
    '  \   `---'   \   /  / 
   /    |           |./  /  
   \    /  SGLCORE  //  /     
    \_/' \         |/  /         
     |    |   _,^-'/  /              
     |    , ``  (\/  /_        
      \,.->._    \X-=/^         
      (  /   `-._//^`  
       `Y-.____(__}              
        |     {__)           
              ()`     
Your Smart Cyber Assistent

EOF
}

#Exit from MySQL managment system
function exit_ () {
clear
#rm -rf $TMP
#rm -rf $TMP1
kill_ && clear
#pkill -9 main_menu.sh && clear
echo
echo -e "${menu}Thank you ${number}"$whoami" ${menu}for use MySQL managment system${normal}"
logo2_
echo
printf %b '\033[m'
sleep 1 && clear && exit 0
}



# Autologout after 20min
function logout_ () {

TMOUT=1200
readonly TMOUT
export TMOUT

}

#Greet a user differently on the time of day
function greetgusr_ () {
local h=`date +%H`
if [ $h -lt 12 ]; 
 then
    greet="Good morning"
    #echo $greet
elif [ $h -lt 18 ]; 
 then
     greet="Good afternoon"
    # echo $greet
 else
     greet="Good evening"
    # echo $greet
fi

}

function exit2_ () {
case $choice in
		
	x) exit_ ;;
	
esac
}

function timer_ () {
pkill -f "sleep 6000"
clear
local SH=/timer-tmp23455.sh
local TIMER="/tmp/mysql-tmp/timer-tmp23455.sh"
local CHK="$(ls -la /tmp/mysql-tmp | wc -l)"
if [ "$CHK" != 0 ] ;
then
#rm -rf /tmp/mysql-tmp/timer-tmp23455.sh
cat > $TIMER <<- "EOF"
#!/bin/bash
sleep 90000 && rm -rf /tmp/mysql-tmp/*.*
pkill -9 menu-gui.sh
exit 0
EOF
chmod +x $TIMER
cd /tmp/mysql-tmp && .$SH & disown 
else
return 0
fi
clear
}

function choice_ () {
    history -r script_history
	
    local C1="$(printf "${menu}    Enter choice [ ${number}1 ~ X ${menu}]${normal}\n")"
	local C2="$(printf "[$whoami@$hostname $main]# ")"
	echo -e "$C1 "
	echo
	read -e -p "$C2" choice
	history -s "$choice"

}

#_______________User permissions START_______________________
function perm_chk_user_have_passwd_ () {
tmpusr_tmppass_
local CHK="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep "PASSWORD" | wc -l)"
if [ "$CHK" != 0 ];
then
Y="${green}YES${normal}"
else
Y="${fgred}${blink}NO ${normal}"
fi 
}

function perm_echo_su_usr_dtl_ () {
tmpusr_tmppass_
local A="${green}ALL${normal} (Can manage all databases)"
local YES="${green}YES${normal}"
local UDT="Permissions of ${number}$username${normal}@${number}$host${normal} simple view${normal}"
local SUDT="${green}Super User${normal} (With root permissions)"
local CHK="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep "PASSWORD" | wc -l)"
if [ "$CHK" != 0 ];
then
Y="${green}YES${normal}"
else
Y="${fgred}${blink}NO ${normal}"
fi
if [ "$host" == "%" ];
then 
local HOST="From ${fgred}Any${normal} ip address"
elif [ "host" != localhost ];
then
local HOST="Only from ${green}$host${normal}"
else        
local HOST="Only from ${green}localhost${normal}"
fi

echo -e "    $UDT                                 "
echo -e "+------------------------------------------------------+"
echo -e "| User type    : $SUDT    |"
echo -e "| Database     : $A        |"
echo -e "| Password     : $Y                                   |"
echo -e "| Create users : $YES                                   |"
echo -e "| Can connect  : $HOST                   |"
echo -e "+------------------------------------------------------+"
echo

}

function perm_echo_bckp_usr_dtl_ () {
tmpusr_tmppass_
local A="${green}ALL${normal} (read only)"
local YESBU="${green}YES${normal}"
local UDTBU="Permissions of ${number}$username${normal}@${number}$host${normal} simple view${normal}"
local SUDTBU="${green}Backup${normal} (With read only permissions)"
local CHKBU="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep "PASSWORD" | wc -l)" #Check if user have password
local YESBU="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep "WITH GRANT OPTION" | wc -l)"
if [ "$CHKBU" != 0 ];
then
Y="${green}YES${normal}"
else
Y="${fgred}${blink}NO ${normal}"
fi
if [ "$YESBU" != 0 ];
then
X="${green}YES${normal}"
else
X="${fgred}${blink}NO ${normal}"
fi

if [ "$host" == "%" ];
then 
local HOST="From ${fgred}Any${normal} ip address"
elif [ "host" != localhost ];
then
local HOST="Only from ${green}$host${normal}"
else        
local HOST="Only from ${green}localhost${normal}"
fi
echo
echo -e "    $UDTBU                                 "
echo -e "+------------------------------------------------------+"
echo -e "| User type    : $SUDTBU   |"
echo -e "| Database     : $A                       |"
echo -e "| Password     : $Y                                   |"
echo -e "| Create users : $X                                   |"
echo -e "| Can connect  : $HOST                   |"
echo -e "+------------------------------------------------------+"
echo
echo
echo
}

function perm_echo_db_usr_dtl_ () {
tmpusr_tmppass_

local YESBU="${green}YES${normal}"
local UDTB1="Permissions of ${number}$username${normal}@${number}$host${normal} simple view${normal}"
local SUDTBU1="${green}Backup${normal} (With read only permissions)   "
local CHKBU="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep "PASSWORD" | wc -l)" #Check if user have password
local YESBU="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep "WITH GRANT OPTION" | wc -l)"
SPECUS0=1
 
if [ "$SPECUS1" == 1 ] ;
then
local SUDTBU1="${green}User have spesific permissions${normal}        "
local A="| Database     : ${green}ALL${normal} (read write?)                     |"

elif [ "$SPECUS1" == 2 ] ;
then
local SUDTBU1="${green}DB Admin${normal} (With read write permissions)"
local A="| Database     : ${green}Spesific${normal} (read write)                 |"


elif [ "$SPECUS1" == 3 ] ;
then
local SUDTBU1="${green}DB Admin${normal} (With read write permissions)"
local A="| Database     : ${green}ALL${normal} (read write)                     |"

elif [ "$CHKBU" != 0 ] ;
then
local A="| Database     : ${green}ALL${normal} (read only)                       |"

elif [ "$CHKBU" == 0 ] ;
then
local A="| Database     : ${green}ALL${normal} (read only)                       |"

elif [ "$SPECUS0" == 1 ] ;
then
local SUDTBU1="${green}Backup${normal} (With read only permissions)   " 
local A="| Database     : ${green}ALL${normal} (read write?)                     |"

fi

if [ "$CHKBU" != 0 ];
then
Y="${green}YES${normal}"
else
Y="${fgred}${blink}NO ${normal}"
fi


if [ "$YESBU" != 0 ];
then
X="${green}YES${normal}"
else
X="${fgred}${blink}NO ${normal}"
fi

if [ "$host" == "%" ];
then 
local HOST="From ${fgred}Any${normal} ip address"
elif [ "host" != localhost ];
then
local HOST="Only from ${green}$host${normal}"
else        
local HOST="Only from ${green}localhost${normal}"
fi
echo -e "    $UDTB1                                 "
echo -e "+------------------------------------------------------+"
echo -e "| User type    : $SUDTBU1|"
echo -e "$A"
echo -e "| Password     : $Y                                   |"
echo -e "| Create users : $X                                   |"
echo -e "| Can connect  : $HOST                   |"
echo -e "+------------------------------------------------------+"
echo



}

function perm_pause_chk_usr_ () {
tmpusr_tmppass_
local UDT1="Permissions of ${number}$username${normal}@${number}$host${normal} advance view${normal}"
local UDT2=" Permissions on Databases ${normal}"
local C1="$(printf "${menu}Press [ ${fgred}Enter${STD}${menu} ] ${menu}key to continue to Menu or [ ${fgred}B${STD}${menu} ] ${menu}to view advance permissions ${normal}\n")"
local CHKSU122="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep "WITH GRANT OPTION" | wc -l)"
local userdatabases="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep -o -P '(?<=( ON `)).*(?=`.* TO )' ) "
local userdatabasescheck="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep -v "GRANT USAGE ON" | grep -F -o "*.*" | wc -l  )" # Check if user have permissions for all databases
while true
do
    read -p "$C1" fackEnterKey
	
if [ -n "$fackEnterKey" ];
then
echo && clear && echo
    printf "\n${menu}           MySQL Users permisions         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
getdbusrbefore_
echo
echo
if [ "$CHKSU122" != 0 ];
then
perm_echo_su_usr_dtl_ 
elif [ "$SPECUS1" == 1 ];
then
perm_echo_db_usr_dtl_
#echo "BCKP User have admin permissions for all databases + spesial permissions"
elif [ "$SPECUS1" == 2 ];
then
perm_echo_db_usr_dtl_
#echo "user have permisions for spesific databases" 

elif [ "$SPECUS1" == 3 ];
then
perm_echo_db_usr_dtl_
#echo "User have admin permissions for all databases"
elif [ "$SPECUS0" == 1 ];
then
perm_echo_db_usr_dtl_
else
perm_echo_db_usr_dtl_
fi
if [ "$userdatabasescheck" == 0 ];
then
echo -e "    $UDT2                                 "
border_  $userdatabases
else
echo
echo -e "    $UDT2                                 "
echo -e "+-------------------------------+${normal}"
echo -e "|${green}ALL                            ${normal}|${normal}"
echo -e "+-------------------------------+${normal}"
fi
echo
echo -e "    $UDT1                                 "
mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" 
echo
pause
break
else
return 0
fi 
done
}

function perm_valid_usrname_ () {

local C1=`echo -e "${menu}Enter the username to check permissions : ${normal}"`

 getdbusrbefore_
echo
    read -p "$C1" username
back_
    echo
local CHKVAL="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SELECT User,Host FROM mysql.user;" | grep "$username" | wc -l)"
if [[ $username == *['!'@#\;:\ $%^\&*(.)+]* ]] || [[ -z $username ]] || [[ "$CHKVAL" == 0 ]];
then
     clear
     echo
	 echo -e "${menu}Username ${blink}${fgred}$username ${normal}${menu}is invalid${normal}"
	 echo
	 sleep 1
	 echo && clear && echo
     printf "\n${menu}           MySQL Users permisions         ${normal}\n"
	 printf "\n${menu}******************************************${normal}\n"
	 echo
	 perm_valid_usrname_
	clear
	else
	return 0
	
fi
#echo -e "Database name "$username" is valid"
clear

}

function perm_valid_host_ () {
hostn=""
host=""
unset host
unset hostn
local C1="$(printf "${menu}Enter Hostname or press [Enter] for ${fgred}localhost${menu} : ${normal}\n")"

echo
echo 
read -e -p "$C1" hostn
back_
if [ -n "$hostn" ];
then
host=$hostn
#printf "$host"
else
host=localhost
fi
local CHKVAL="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | wc -l)"
back_
if [ "$CHKVAL" != 0 ];
then
return 0
else
echo && clear && echo
    printf "\n${menu}           MySQL Users permisions         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
back_
getdbusrbefore_
echo
echo -e "${menu}Hi ${green}$whoami${menu} please enter valid ${green}hosname ${menu}from list ^${normal}"
echo
back_
perm_valid_host_

fi
}

#_______________User permissions END_________________________

function pause_user_list_ () {
echo
local C1="$(printf "${menu}Press ${menu}[ ${fgred}Enter ${menu}] ${menu}key to continue or ${menu}[ ${fgred}B ${menu}] to check permissions by user ${normal}\n")"
#local C2="$(printf "${number} 1. ${menu}Press ${menu}[ ${fgred}B ${menu}] to check permissions by user${normal}\n")"
 local main="${menu}MySQL-User${normal}" 
  local C2="$(printf "[$whoami@$hostname $main]# ")"
   printf "${menu}Press ${menu}[ ${fgred}Enter ${menu}] ${menu}key to continue... ${normal}\n"
 echo
  read -e -p "$C2" fackEnterKey
  
  if [ "$fackEnterKey" == "p" ] ;
  then
  permission_usr_chk_
  else
  return 0
  fi
}

function pause () {
local main3="${menu}MySQL-User${normal}"
local main2="${menu}MySQL-DB${normal}"
local main1="${menu}MySQL-Main${normal}"
local main0="${menu}MySQL-Start${normal}"
local C1="$(printf "${menu}Press ${menu}[ ${fgred}Enter ${menu}] ${menu}key to continue...${normal}\n")"
    mysqlmenu=2
if [ "$mysqlmenu" == 0 ]; 
then
mysqlmenu=$main0
elif [ "$mysqlmenu" == 1 ]; 
then
mysqlmenu=$main1
elif [ "$mysqlmenu" == 2 ]; 
then
mysqlmenu=$main2
elif [ "$mysqlmenu" == 3 ]; 
then
mysqlmenu=$main3
fi
	local C2="$(printf "[$whoami@$hostname $mysqlmenu]# ")"
	printf "${menu}Press ${menu}[ Enter ${menu}] ${menu}key back to MySQL Menu${menu}...${normal}\n"
	echo
	read -e -p "$C2" userchoice
	#fackEnterKey
	if [ "$userchoice" != ""  ] ;
	then
	case $userchoice in
		
		x|q|quit|nahuy|home|exit|kill|sleep) exit_ ;;
		b) break && mysql_menu_main_0_ ;;
		passwd|pass|password)change_passwd_  ;;
     perm|userperm|chmod|"user permissions"|"show perm"|"show permissions"|privelage|checkp|pcheck|777|getp|"show perm"|P) permission_usr_chk_ ;;
	 udel|delu|usrdel|delusr|dellusr|deleteusr|deluser|userdell|remuser|"remove user"|u-|su-) dlt_usr_ ;;
	 dbdel|removedb|deld|ddel|dbdel|deldb|delldb|dbdell|"drop db"|dbdrop|"drop database"|"rm db"|"rm dbs"|"remove database"|db|D) dlt_db_ ;;
   	 db+usr|createdb+usr|newbd+usr|"create database+"|db+u|u+db|dbww|wwdb|newwwdb|db+u) create_db_and_usr_ ;;
     sglcore) logo_  ;;
     dbget|getdb|dblist|listdb|dbl|getd|showdb|"show db"|"list db"|"get db"|db|databases|alldb|dbs|showd|listd|dlist|db?) lst_db_  ;;
     getuser|getusr|listuser|userlist|"user list"|"list user"|"get users"|"show user"|"list user"|getu|uget|ulist|listu|showu|"show u"|"user show"|"all users"|allu) lst_db_usr_ ;;
     newsu|su|newsu|newroot|createroot|superuser|createsuper|supercreate|"super create"|"create root user"|sucreate|"root create"|"create user root"|createsu|sucreate|su+) create_su_ ;;
	 asignu|asignuser|"asign user"|"new user for db"|createu+|u2db|u4db|asign|"new db user"|+u|user+|addu) creat_new_usr_4_db_ ;;
	 user|users) mysql_menu_4_usr_0_ ;;
	 database|db) mysql_menu_3_db_0_  ;;
	 devu|newdev) create_dev_usr_ ;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
		
	esac
	history -w script_history 
	elif [ "$userchoice" == "p" ] ; then
  permission_usr_chk_
	elif [ "$userchoice" == "d" ] ; then
	dlt_db_
	else
	return
	fi
}


function pause_dlt_usr_ () {
local C1="$(printf "${menu}Press [ ${fgred}Enter${STD}${menu} ] ${menu}key to continue to Menu or [ ${fgred}B${STD}${menu} ] ${menu}to proceed with another user ${normal}\n")"
while true
do
    read -p "$C1" fackEnterKey
	
if [ -n "$fackEnterKey" ];
then
clear
dlt_usr_
break
else
break
fi 
done
}

function pause_dlt_db_ () {
local C1="$(printf "${menu}Press ${menu}[ ${fgred}Enter ${menu}] ${menu}key back to ${green}MySQL Menu${menu}...${normal}\n")"
while true
do
     printf "${menu}Press [ ${fgred}D${STD}${menu} ] ${menu}to delete another Database: ${normal}\n"
	 echo
	 echo
    read -p "$C1" fackEnterKey
	
if [ "$fackEnterKey" == "d" ];
then
clear
dlt_db_
break

else
break
fi 
done

}

function mysqlbckp_ () {
tmpusr_tmppass_
mysqldump -u$TMPUSR -p$TMPPASSWD $dbname > /tmp/mysql-tmp/$dbname.sql
}

function ctrl_ () {
trap '
  trap - INT # restore default INT handler
  kill -s INT "$$"
' INT

}

function getdbusrbefore_ () {
echo
echo "    Users         Hosts"
mysql -u$TMPUSR -p$TMPPASSWD -N -e  'SELECT User,Host FROM mysql.user;'
}

function getdbbefore_ () {
echo
echo "        Databases         "
mysql -u$TMPUSR -p$TMPPASSWD -N -e  'show databases;'

}

function getdbusrafter_ () {
echo
echo "    Users         Hosts"
echo "  _________________________"
mysql -u$TMPUSR -p$TMPPASSWD -N -e  'SELECT User,Host FROM mysql.user;' | GREP_COLOR='01;32' grep --color=always -e "^" -e "^$username" | sed 's/.*/ |- & /' |  sed "s/.$username/&  <<----New User on---->>/"
echo "  _________________________"
}

function getdbusrafter_spesial_ () {
echo
echo "    Users         Hosts"
echo "  _______________________"
mysql -u$TMPUSR -p$TMPPASSWD -N -e  'SELECT User,Host FROM mysql.user;' | GREP_COLOR='01;32' grep --color=always -e "^" -e "^$dbname" | sed 's/.*/ |- & /' |  sed "s/.$dbname/&     <<----New User on---->>/"
echo "  _______________________"
}

function getdbafter_ () {
echo
echo "        Databases         "
echo "  _______________________"
mysql -u$TMPUSR -p$TMPPASSWD -N -e  'show databases;' | GREP_COLOR='01;32' grep --color=always -e "^" -e "^$dbname" | sed 's/.*/ |- & /' |  sed "s/.$dbname/&     <<-----New database /"
echo "  _______________________"
}

# Function used for reset mysql root password
function rootpass_ () {
clear
local C1="$(printf "${menu}Enter new password for ${blink}${number}root ${normal}${menu}user: ${normal}\n")"
read -s -p "$C1" NEWPASSWD

}

function valid_usrname_body_ () {
 echo
    echo -e "${menu}Enter valid username ${blink}without ${normal}${menu}spesial characters ${normal}\n"
	echo -e "${menu}For example:${normal}"
    echo -e	"${green}       user_com ${normal}${menu}=${green}:)" 
	echo -e "${fgred}       user.com ${normal}${menu}= ${fgred}:( ${normal}\n"
    echo
   

}
# Function used to validate name of username if not contain spesials lik ['!'@#\;:\ $%^\&*(.)+]* ]
function valid_usrname_ () {

if [ "$userchangepass" == 1234 ] ;
then
local C1=`echo -e "${menu}Enter the username to change password: ${normal}"`
else
local C1=`echo -e "${menu}Enter the username you wish to create: ${normal}"`
valid_usrname_body1_=valid_usrname_body_
fi
while true;
 do
 getdbusrbefore_
    $valid_usrname_body1_
    read -p "$C1" username
    echo
	back_
if [[ $username == *['!'@#\;:\ $%^\&*(.)+]* ]] || [[ -z $username ]];
then
     echo
	 echo -e "${menu}Username ${blink}${fgred}$username ${normal}${menu}is invalid${normal}"
	 echo
	 sleep 4
	clear
  else 
  
 break
fi
done
#echo -e "Database name "$username" is valid"
clear

}

# Function used to validate name of database if not contain spesials lik ['!'@#\;:\ $%^\&*(.)+]* ]
function valid_dbname_ () {
local C1="$(printf "${menu}Enter Database name: ${normal}\n")"
while true;
 do 
    
	getdbbefore_
    echo -e "${menu}Enter valid Database name ${fgred}without ${normal}${menu}spesial characters ${normal}\n"
	echo -e "${menu}For example:${normal}"
    echo -e	"${green}       domain_com ${normal}${menu}=${green}:)" 
	echo -e "${fgred}       domain.com ${normal}${menu}= ${fgred}:( ${normal}\n"
    echo
    read -e -p "$C1" dbname
	back_
    echo
if [[ $dbname == *['!'@#\;:\ $%^\&*(.)+]* ]] ;
then
     echo
	 echo -e "${menu}Database ${blink}${fgred}$dbname ${normal}${menu}is invalid${normal}"
	 echo
	 sleep 4
	
  else   
 break
fi
done
#echo -e "Database name "$dbname" is valid"
clear
}


# Function to validate password 1.Mininum 8 characters 2.Must contain 2 upper case letter 3.Must contain 2 digits 4.Must contain one non-alphanumeric character (no spaces) 
function valid_passwd_ () {
#local username=huy
local C1="$(printf "${menu}Enter new password for ${blink}${number}"$username" ${normal}${menu}: ${normal}\n")"
ctrl_
while true;
 do 
  getdbusrbefore_
    echo
    echo -e "${menu}Password must contain: ${fgred}2 ${menu}upper case characters, ${fgred}2 ${menu}digits, ${fgred}2 ${menu}numbers and mininum ${fgred}8 ${menu}characters (no spaces)!${normal}"
    read -s -p "$C1" NEWPASSWD
	back_
    echo
    FAIL=no
    # Mininum 8 characters
    [[ ${#NEWPASSWD} -ge 8 ]] || FAIL=yes
    # Must contain 2 upper case letters
    echo $NEWPASSWD | grep -q "[a-z].*[A-Z]" || FAIL=yes
    # Must contain 2 digits
    echo $NEWPASSWD | grep -q "[0-9].*[0-9]" || FAIL=yes
    # Must contain one non-alphanumeric character (no spaces)
    echo $NEWPASSWD | grep -q "[^a-zA-Z0-9 ]" || FAIL=yes
    [[ ${FAIL} == "no" ]] && break
    #echo "Password invalid"
	sleep 3
	clear
done

#echo "Password $NEWPASSWD is valid"
clear
}

# Function to validate password 1.Mininum 8 characters 2.Must contain 2 upper case letter 3.Must contain 2 digits 4.Must contain one non-alphanumeric character (no spaces) 
function valid_passwd_db_usr_ () {
#local username=huy

local C1="$(printf "${menu}Enter new password for ${blink}${number}"$dbname" ${normal}${menu}: ${normal}\n")"
while true;
 do 
  clear
  getdbusrbefore_
    echo
	echo -e "${menu}The user will be created with same name like new database ${number}$dbname${normal}"
	echo
    echo -e "${menu}Password must contain: ${fgred}2 ${menu}upper case characters, ${fgred}2 ${menu}digits, ${fgred}2 ${menu}numbers and mininum ${fgred}8 ${menu}characters ${fgred}(no spaces)!${normal}"
	echo
    read -s -p "$C1" NEWPASSWD
	back_
    echo
    FAIL=no
    # Mininum 8 characters
    [[ ${#NEWPASSWD} -ge 8 ]] || FAIL=yes
    # Must contain 2 upper case letters
    echo $NEWPASSWD | grep -q "[a-z].*[A-Z]" || FAIL=yes
    # Must contain 2 digits
    echo $NEWPASSWD | grep -q "[0-9].*[0-9]" || FAIL=yes
    # Must contain one non-alphanumeric character (no spaces)
    echo $NEWPASSWD | grep -q "[^a-zA-Z0-9 ]" || FAIL=yes
    [[ ${FAIL} == "no" ]] && break
    #echo "Password invalid"
	sleep 3
	clear
done
#echo "Password $NEWPASSWD is valid"
clear
}

#Function validate user password when change
function validate_passwd__with_double_chk_ () {
    local C1="$(printf "\n${menu}Enter new password for ${number}$username${menu} : ${normal}\n")"
    local C2="$(printf "\n${menu}Retype new password for ${number}$username${menu} : ${normal}\n")"
   # echo -e "${menu}Password must contain: ${fgred}2 ${menu}upper case characters, ${fgred}2 ${menu}digits, ${fgred}2 ${menu}numbers and mininum ${fgred}8 ${menu}characters (${fgred}no spaces${menu})!${normal}"
   while true;
 do 
   read -s -p "$C1" NEWPASSWD3
	FAIL=no
    # Mininum 8 characters
    [[ ${#NEWPASSWD3} -ge 8 ]] || FAIL=yes
    # Must contain 2 upper case letters
    echo $NEWPASSWD3 | grep -q "[a-z].*[A-Z]" || FAIL=yes
    # Must contain 2 digits
    echo $NEWPASSWD3 | grep -q "[0-9].*[0-9]" || FAIL=yes
    # Must contain one non-alphanumeric character (no spaces)
    echo $NEWPASSWD3 | grep -q "[^a-zA-Z0-9 ]" || FAIL=yes
    [[ ${FAIL} == "no" ]] && break
   echo "2"
echo "Invalid password please retype"
done
read -s -p "$C2" NEWPASSWD4
echo
if [ "$NEWPASSWD3" != "$NEWPASSWD4" ];
then
validate_passwd__with_double_chk_
else
NEWPASSWD=$NEWPASSWD4

echo "Valid password "
sleep 2 
fi

}



# Function used to add new host to user
function host_ () {
local C1="$(printf "${menu}Enter Hostname or press [Enter] for ${fgred}localhost${menu} : ${normal}\n")"

getdbusrbefore_
echo
echo "** % **        -- User can connect from all ip addresses"
echo "** ip **       -- User can connect from spesific ip address for example: 127.0.0.0 or 192.168.6.250"
echo "** hostname ** -- User can connect only from this hostname for example: localhost or 123.your-domain.com "
echo 
read -e -p "$C1" hostn
back_
if [ -n "$hostn" ];
then
host=$hostn
printf "$host"
clear
else
host=localhost
clear

fi

}

# Function used when you removeuser and host
function host_del_ () {
local C1="$(printf "${menu}Enter Hostname or press [Enter] for ${fgred}localhost${menu} : ${normal}\n")"
echo
echo 
read -e -p "$C1" hostn
back_
if [ -n "$hostn" ];
then
host=$hostn
#printf "$host"
else
host=localhost
fi
}

# Function confirm
function confirm_ () {
local C1="$(printf "${menu}Please Confirm (${fgred}y${menu}/n) or [ ${fgred}Enter${menu} ] ${menu}to ${fgred}y ${menu}: ${normal}\n")"
echo 
read -e -p "$C1 " confirmn
back_
if [ -n "$confirmn" ];
then
confirm=$confirmn
printf "$confirm"
else
confirm=y
fi
}

#Temporary save mysql User and password (will be deleted on exit)
function tmp_save_mysql_root_pass_ () {
clear
stty_orig=$(stty -g)
local C1="$(printf "${menu}Enter MySQL super user: ${normal}\n")"
local C2="$(printf "${menu}Enter MySQL passwd: ${normal}\n")"
read -e -p "$C1" usr
back_
echo $usr > $TMP1
stty -echo
read -e -p "$C2" passwd
back_
echo "$passwd" > $TMP
stty echo
echo "done"
clear
start_ 
}

# 8 Chenge wordpress old site url to new
function eight_ () {
local TMPPASSWD="$(cat $TMP)" 
local TMPUSR="$(cat $TMP1)"
echo "                    "
echo " Databases "
mysql -u$TMPUSR -p$TMPPASSWD -N -e  'show databases;' 
echo "                    "
echo "                    "
read -e -p "Please enter the DataBase to change Site URL: " dbname
local CHK="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e  'show databases;' | grep $dbname | wc -l)"
if [ "$CHK" == 0  ] ;
then 
eight_
else
clear
fi
echo "                    "
echo "                    "
clear
mysql -u$TMPUSR -p$TMPPASSWD $dbname -e "SELECT * FROM wp_options WHERE option_name = 'home' OR option_name = 'siteurl;'"
echo "Please enter valid old site url from list "
read -e -p "Please Enter *Old* Site Value : " OLDDOMAIN
read -e -p "Please Enter *New* Site Value : " NEWDOMAIN
confirm_
if [ "$confirm" == 'y'  ]; 
then
echo "Creating Backup for database $dbname /tmp/mysql-tmp only for 15 min"
mysqlbckp_
echo "Please enter root password if needed: "
mysql -u$TMPUSR -p$TMPPASSWD $dbname  <<MYSQL_SCRIPT
UPDATE wp_options SET option_value = replace(option_value, '$OLDDOMAIN', '$NEWDOMAIN') WHERE option_name = 'home' OR option_name = 'siteurl';
UPDATE wp_posts SET guid = replace(guid, '$OLDDOMAIN','$NEWDOMAIN');
UPDATE wp_posts SET post_content = replace(post_content, '$OLDDOMAIN', '$NEWDOMAIN');
UPDATE wp_posts SET post_excerpt = replace(post_excerpt, '$OLDDOMAIN', '$NEWDOMAIN');
UPDATE wp_postmeta SET meta_value = replace(meta_value, '$OLDDOMAIN', '$NEWDOMAIN');
UPDATE wp_usermeta SET meta_value = replace(meta_value, '$OLDDOMAIN', '$NEWDOMAIN');
UPDATE wp_links SET link_url = replace(link_url, '$OLDDOMAIN', '$NEWDOMAIN');
UPDATE wp_comments SET comment_content = replace(comment_content, '$OLDDOMAIN', '$NEWDOMAIN');
UPDATE wp_links SET link_image = replace(link_image, '$OLDDOMAIN', '$NEWDOMAIN');

MYSQL_SCRIPT
echo "New Site URL Value"
mysql -u$TMPUSR -p$TMPPASSWD $dbname -e "SELECT * FROM wp_options WHERE option_name = 'siteurl;'"
echo "                    "
pause
fi
}

#Roll back database 
function nine_ () {
LS="$(ls /tmp/mysql-tmp/ | grep .sql | sed 's/.\{4\}$//')"
mysql -u$TMPUSR -p$TMPPASSWD $LS < /tmp/mysql-tmp/$LS.sql
}

function zeropasschk_ () {
clear
local arr=( rootpass_ )
while true [ -z "$(rootpass_)" ] ;
do
clear
echo
echo -e "${blink}Password cannot be empty. Please enter strong Password${normal}\n"
sleep 5
reset_root_passwd_
clear
exit 0
done
}


#5#________________________ SUB-1 MySQL -DataBase- Managment Start ________________#5#



#5# OPTION-1. Get Database list
function lst_db_ () {
local mysqlmenu=2
local menudb=1
tmpusr_tmppass_
clear
echo
echo 
clear
echo
    printf "\n${menu}              Database list         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
getdbbefore_
echo
printf "${menu}Press [ ${fgred}D${STD}${menu} ] ${menu}to select Database to delete: ${normal}\n"
echo
#pause_dlt_db_ 
pause
}

#5# OPTION-2. Create new Database and User (Title)
function create_db_and_usr_title_ () {
echo && clear && echo
    printf "\n${menu}       Create New Database and User         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n" 

}

#5# OPTION-2. Create new Database and User
function create_db_and_usr_ (){
local mysqlmenu=2
menudb=2
tmpusr_tmppass_
clear
create_db_and_usr_title_
valid_dbname_
create_db_and_usr_title_
valid_passwd_db_usr_
clear
create_db_and_usr_title_
host_
clear
create_db_and_usr_title_
echo
#echo -e "${menu}New database and new user will be created${normal}"
echo  
echo -e "${menu}Database: ${green}$dbname${normal}"
echo -e "${menu}User:     ${green}$dbname${normal}"
echo -e "${menu}Pass:     ${green}$NEWPASSWD${normal}"
echo -e "${menu}Host:     ${green}$host${normal}"
echo
confirm_
	if [ "$confirm" == 'y' ]; 
   then
mysql -u$TMPUSR -p$TMPPASSWD -N <<MYSQL_SCRIPT
CREATE DATABASE $dbname;
CREATE USER '$dbname'@'$host' IDENTIFIED BY '$NEWPASSWD';
GRANT ALL PRIVILEGES ON $dbname.* TO '$dbname'@'$host';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
echo
clear
create_db_and_usr_title_
getdbusrafter_spesial_
getdbafter_
echo 
echo -e "${menu}MySQL database and user created:"
echo "                    "
echo -e "${menu}Database: ${green}$dbname${normal}"
echo -e "${menu}User:     ${green}$dbname${normal}"
echo -e "${menu}Pass:     ${green}$NEWPASSWD${normal}"
echo -e "${menu}Host:     ${green}$host${normal}"
echo "                    "
echo "                    "
pause
fi
}


#5# OPTION-3. Create new Database
function create_new_db_title_ () {
clear
echo
    printf "\n${menu}      Create New Database without user         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
	}
	
function create_new_db_ () {
local mysqlmenu=2
menudb=3
tmpusr_tmppass_
echo 
create_new_db_title_
valid_dbname_
create_new_db_title_
echo
getdbbefore_
echo
echo -e "${menu}New Database ${green}$dbname ${menu}will be created.${normal} "
echo
confirm_
if [ "$confirm" == 'y' ]; 
then
mysql -u$TMPUSR -p$TMPPASSWD -N  <<MYSQL_SCRIPT
CREATE DATABASE $dbname;
FLUSH PRIVILEGES;
MYSQL_SCRIPT
clear
echo 
create_new_db_title_
getdbafter_
echo
echo -e "${menu}New database ${green}$dbname ${menu}created${normal}"
echo
echo
pause       
fi
} 
 
#5# OPTION-3. Delete Database
function dlt_db_ () {
local mysqlmenu=2
menudb=4
tmpusr_tmppass_
local C1="$(printf "\n${menu}Please enter the DataBase name you wish to ${fgred}DELETE ${menu}: ${normal}\n") "
clear
	printf "\n${menu}           MySQL ${fgred}Delete ${menu}Database          ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
getdbbefore_
read -e -p" $C1" dbname
back_
echo
echo
echo -e "${menu}Database -->${number}$dbname${menu}<-- will be ${fgred}DELETED!${normal}"
echo
confirm_
if [ "$confirm" == 'y' ]; 
then
echo "Creating Backup for database $dbname /tmp/mysql-tmp only for 15 min"
mysqlbckp_
echo 
mysql -u$TMPUSR -p$TMPPASSWD -N <<MYSQL_SCRIPT
DROP DATABASE $dbname;
FLUSH PRIVILEGES;
MYSQL_SCRIPT
clear
echo 
getdbbefore_
echo
printf "${menu}Press [ ${fgred}D${STD}${menu} ] ${menu}to select Database to delete: ${normal}\n"
echo
pause
fi
}

#5# MENU-1- MYSQL DATABASE QUERY LIST FUNCTION
function mysql_menu_5_db_query_2_list_1_() {  
    clear
	echo -e "$h1"
	printf "\n${menu}           MySQL ${green}-DataBase- ${menu}Managment    ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
	printf " ${number}1. ${menu}Get all Database list ${normal}\n"
	printf " ${number}2. ${menu}Create new Database with user${normal}\n"
	printf " ${number}3. ${menu}Create new database without user ${normal}\n"
	printf " ${number}4. ${fgred}Delete ${menu}Database ${normal}\n"
	printf " ${number}X. ${menu}Press [ ${fgred}X ${menu}] exit or [ ${fgred}B${menu} ] back to Main Menu ${normal}\n"
}

#4# MENU-2- MYSQL DATABASE QUERY READ FUNCTION
function mysql_menu_5_db_query_1_read_opt_ (){
local mysqlmenu=2
local main="${menu}MySQL-DB${normal}"
choice_
	case $choice in
		1) lst_db_ ;;
		2) create_db_and_usr_ ;;
		3) create_new_db_ ;;
		4) dlt_db_ ;;
		5) exit_ ;;
		x|q|quit|nahuy|home|exit|kill|sleep) exit_ ;;
		b) break && mysql_menu_main_0_ ;;
		passwd|pass|password)change_passwd_  ;;
     perm|userperm|chmod|"user permissions"|"show perm"|"show permissions"|privelage|checkp|pcheck|777|getp|"show perm") permission_usr_chk_ ;;
	 udel|delu|usrdel|delusr|dellusr|deleteusr|deluser|userdell|remuser|"remove user"|u-|su-) dlt_usr_ ;;
	 dbdel|removedb|deld|ddel|dbdel|deldb|delldb|dbdell|"drop db"|dbdrop|"drop database"|"rm db"|"rm dbs"|"remove database"|db-|d-) dlt_db_ ;;
   	 db+usr|createdb+usr|newbd+usr|"create database+"|db+u|u+db|dbww|wwdb|newwwdb|db+u) create_db_and_usr_ ;;
     sglcore) logo_  ;;
     dbget|getdb|dblist|listdb|dbl|getd|showdb|"show db"|"list db"|"get db"|db|databases|alldb|dbs|showd|listd|dlist|db?) lst_db_  ;;
     getuser|getusr|listuser|userlist|"user list"|"list user"|"get users"|"show user"|"list user"|getu|uget|ulist|listu|showu|"show u"|"user show"|"all users"|allu) lst_db_usr_ ;;
     newsu|su|newsu|newroot|createroot|superuser|createsuper|supercreate|"super create"|"create root user"|sucreate|"root create"|"create user root"|createsu|sucreate|su+) create_su_ ;;
	 asignu|asignuser|"asign user"|"new user for db"|createu+|u2db|u4db|asign|"new db user"|+u|user+|addu) creat_new_usr_4_db_ ;;
	 user|users) mysql_menu_4_usr_0_ ;;
	 database|db) mysql_menu_3_db_0_  ;;
	 devu|newdev) create_dev_usr_ ;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
		
	esac
	history -w script_history
}

#4# MENU-3- MYSQL DATABASE QUERY LOOP FUNCTION
function mysql_menu_5_db_query_0_ () {
while true
do
mysql_menu_5_db_query_2_list_1
mysql_menu_5_db_query_1_read_opt_
done
}
#5#________________________ SUB-1 MySQL -DataBase- Managment End ________________#5#



#4#________________________ SUB-2 MySQL -User- Managment Start _____________________#4#
#List of menus: 5 selection
#OPTION-1. Get user list  ------------------------------------->  lst_db_usr_
#OPTION-2. Create new super user with Grant Options ----------->  create_su_
#OPTION-3. Create new user for backup ------------------------->  create_bckp_usr_
#OPTION-4. Create new User and asign to existing Database ----->  creat_new_usr_4_db_
#OPTION-5. To Delete User ------------------------------------->  dlt_usr_

#4# OPTION-1 - Get user list
function lst_db_usr_ () {
tmpusr_tmppass_
local mysqlmenu=3  #add menu title to cmd
local menuusr=1

tmpusr_tmppass_
clear
echo && clear && echo
    printf "\n${menu}               Users list         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
echo 
getdbusrbefore_
echo
echo
printf "${menu}Press ${menu}[ ${fgred}P ${menu}] to check permissions by user... ${normal}\n"
echo
#pause_user_list_
pause
}

#4# OPTION-2 - Create new super user with Grant Options
function create_su_ () {
local mysqlmenu=3  #add menu title to cmd
local menuusr=2
local C1="$(printf "${menu}Enter Username for Super User ${menu}you wish to create : ${normal}\n")"
tmpusr_tmppass_
echo && clear && echo
    printf "\n${menu}           MySQL Create Super User         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
valid_usrname_
valid_passwd_
    echo && clear && echo
    printf "\n${menu}           MySQL Create Super User         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
host_
clear
echo
echo -e "${menu}New super user will be created: ${normal} "
echo -e "${menu}User : ${number}$username${normal}@${normal}$host "
echo -e "${menu}Pass : ${number}$NEWPASSWD ${normal}\n"
confirm_
if [ "$confirm" == 'y' ];
then
mysql -u$TMPUSR -p$TMPPASSWD -N  <<MYSQL_SCRIPT
CREATE USER '$username'@'$host' IDENTIFIED BY '$NEWPASSWD';
GRANT ALL ON *.* TO '$username'@'$host' WITH GRANT OPTION;
FLUSH PRIVILEGES;
MYSQL_SCRIPT
    echo && clear && echo
    printf "\n${menu}           MySQL Create ${green}Super User         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
getdbusrafter_
echo
echo -e "${menu}MySQL User Super User created:${normal}"
echo 
echo -e "${menu}User: ${number}$username${normal}@${normal}$host "
echo -e "${menu}Pass:${number} $NEWPASSWD ${normal}\n"
baner_
echo
pause
fi
}

#4# OPTION-3 - Create new user for backup
function create_bckp_usr_title_ () {
echo && clear && echo
    printf "\n${menu}         MySQL Create Backup User         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
}

function create_bckp_usr_ () {
local mysqlmenu=3  #add menu title to cmd
local menuusr=3
local C1="$(printf "${menu}Enter password for backup user or press ${number}[ Enter ]${menu} to leave it blank : ${normal}\n")"
local C2="$(printf "${menu}If you want create backup user for specific DB please specify for all DB's press ${number}[ Enter ]${menu} : ${normal}\n")"
tmpusr_tmppass_
echo
clear
create_bckp_usr_title_
getdbbefore_
read -e -p "$C2" dbnamen
if [ -n "$dbnamen" ];
then
dbname=$dbnamen
else
dbname="*.*"
fi

valid_usrname_
create_bckp_usr_title_
echo
echo
echo -e "+--------------------------------------------------------------------------------------+"
echo -e "+--------------------------------------------------------------------------------------+"
echo -e "|  For my opinion you can leave blank if you use user only on localhost for backups.   |"
echo -e "|  1.Hacker can reset your MySQL root pass any time if your system is hacked           |"
echo -e "|  2.Hacker can find backup password in backup script                                  |"
echo -e "+--------------------------------------------------------------------------------------+"
echo -e "+--------------------------------------------------------------------------------------+"
echo
echo
read -e -p "$C1" NEWPASSWD
echo
create_bckp_usr_title_

host_
clear
create_bckp_usr_title_
echo
if [ "$NEWPASSWD" == "" ];
then
local NEWPASSWD1="$(echo -e "${blink}NO${normal}")"
else
local NEWPASSWD1=$NEWPASSWD
fi

if [ "$dbname" == "*.*" ];
then
local dbname1="$(echo -e "${number}ALL${normal}")"
else
local dbname1=$dbname
fi

echo
echo -e "${menu}New Backup user will be created: ${normal} "
echo -e "${menu}Database : ${number}$dbname1 ${menu} ${normal} "
echo -e "${menu}User     : ${number}$username${normal}@${normal}$host "
echo -e "${menu}Pass     : ${number}$NEWPASSWD1${normal}\n"
confirm_
if [ "$confirm" == 'y' ];
then
mysql -u$TMPUSR -p$TMPPASSWD -N  <<MYSQL_SCRIPT
CREATE USER '$username'@'$host' IDENTIFIED BY '$NEWPASSWD';
GRANT SELECT, SHOW VIEW, LOCK TABLES, RELOAD ON $dbname TO '$username'@'$host';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
clear && echo && clear
create_bckp_usr_title_
getdbusrafter_
echo
echo -e "${menu}MySQL Backup User created:${normal}"
echo 
echo -e "${menu}Database : ${number}$dbname1 ${menu} ${normal} "
echo -e "${menu}User     : ${number}$username${normal}@${normal}$host "
echo -e "${menu}Pass     : ${number}$NEWPASSWD1${normal}\n"
baner_
echo
pause
fi
}

#4# OPTION-4 - Create new User and asign to existing Database
function creat_new_usr_4_db_ () {
local mysqlmenu=3 #add menu title to cmd
local menuusr=4
local C1=`echo -e "${menu}Enter the username you wish to create : ${normal}"`
tmpusr_tmppass_
echo && clear && echo
    printf "\n${menu}   MySQL Create ${green}New User ${menu}and asign to        ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
getdbusrbefore_
valid_usrname_
echo && clear && echo
    printf "\n${menu}   MySQL Create ${green}New User ${menu}and asign to        ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
getdbbefore_
valid_dbname_
valid_passwd_
clear
host_
clear
    echo && clear && echo
    printf "\n${menu}   MySQL Create ${green}New User ${menu}and asign to        ${normal}\n" 
	printf "\n${menu}******************************************${normal}\n"
echo "  ---------------------------------------"
echo "         New User will be created     "
echo "  ---------------------------------------"
echo -e " |-${menu}User:               ${green}$username ${normal}"
echo -e " |-${menu}Pass:               ${green}$NEWPASSWD ${normal}"
echo -e " |-${menu}Host:               ${green}$host ${normal}"
echo -e " |-${menu}Assign to Database: ${green}$dbname ${normal}"
echo "  ---------------------------------------"
confirm_
	if [ "$confirm" == 'y' ]; 
   then
mysql -u$TMPUSR -p$TMPPASSWD -N <<MYSQL_SCRIPT
CREATE USER '$username'@'$host' IDENTIFIED BY '$NEWPASSWD';
GRANT ALL PRIVILEGES ON $dbname.* TO '$username'@'$host';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
clear
    echo && clear && echo
    printf "\n${menu}   MySQL Create ${green}New User ${menu}and asign to        ${normal}\n" 
	printf "\n${menu}******************************************${normal}\n"
getdbusrafter_
echo
echo "            User created     "
echo "  ---------------------------------------"
echo -e " |-${menu}New MySQL user asigned to ${green}$dbname${normal}"
echo -e " |-${menu}User: ${green}$username ${normal}"
echo -e " |-${menu}Pass: ${green}$NEWPASSWD${normal}"
echo -e " |-${menu}Host: ${green}$host${normal}"
echo "  ---------------------------------------"
baner_
echo
pause
fi
}

#4# OPTION-5 - Create new User for Developer with permision manage all databases
function create_dev_usr_title_ () {
    echo && clear && echo && clear
    printf "\n${menu}           MySQL Create Dev User         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
} 

#4# OPTION-5 - Create new User for Developer with permision manage all databases
function create_dev_usr_ () {
local mysqlmenu=3
local menuusr=5
local C1="$(printf "${menu}Enter Username for Super User ${menu}you wish to create : ${normal}\n")"
tmpusr_tmppass_
create_dev_usr_title_
valid_usrname_
create_dev_usr_title_
valid_passwd_
create_dev_usr_title_
host_
create_dev_usr_title_
echo
if [ "$NEWPASSWD" == "" ];
then
local NEWPASSWD1="$(echo -e "${blink}NO${normal}")"
else
local NEWPASSWD1=$NEWPASSWD
fi

if [ "$dbname" == "" ];
then
local dbname1="$(echo -e "${number}ALL${normal}")"
else
local dbname1=$dbname
fi

echo
echo -e "${menu}New Dev user will be created: ${normal} "
echo -e "${menu}Database : ${number}$dbname1 ${menu} ${normal} "
echo -e "${menu}User     : ${number}$username${normal}@${normal}$host "
echo -e "${menu}Pass     : ${number}$NEWPASSWD1${normal}\n"
echo

confirm_
if [ "$confirm" == 'y' ];
then
mysql -u$TMPUSR -p$TMPPASSWD -N  <<MYSQL_SCRIPT
CREATE USER '$username'@'$host' IDENTIFIED BY '$NEWPASSWD';
GRANT ALL ON *.* TO '$username'@'$host';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
create_dev_usr_title_
getdbusrafter_
echo
echo -e "${menu}MySQL Dev User created:${normal}"
echo 
echo -e "${menu}Database : ${number}$dbname1 ${menu} ${normal} "
echo -e "${menu}User     : ${number}$username${normal}@${normal}$host "
echo -e "${menu}Pass     : ${number}$NEWPASSWD1${normal}\n"
echo
baner_
echo
pause
fi
}

#4# OPTION-6 - assign existing user to manage spesific database
function asignuser_ () {
    echo && clear && echo
    printf "\n${menu}      MySQL Asign ${green}existing {menu}User to DB         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
} 

#4# OPTION-6 - assign existing user to manage spesific database
function asign_usr_to_db_ () {
local mysqlmenu=3
local menuusr=5
local C1="$(printf "${menu}Enter database name you wish ${fgred}assign${menu} to user${menu} : ${normal}\n")"

tmpusr_tmppass_
asignuser_
getdbbefore_

read -e -p "$C1" dbname
back_
clear
asignuser_
getdbusrbefore_
echo

local C2="$(printf "${menu}Enter username you wish ${fgred}assign${menu} to database${fgred} $dbname${menu} : ${normal}\n")"
read -e -p "$C2" username
back_
asignuser_
host_
back_
asignuser_
echo
#echo -e "${menu}New Dev user will be created: ${normal} "
echo -e "${menu}${fgred}$username${normal}@${fgred}$host${menu} will be assign to database: ${fgred}$dbname${menu} with read write permissions${normal}"
echo
confirm_
if [ "$confirm" == 'y' ];
then
mysql -u$TMPUSR -p$TMPPASSWD -N  <<MYSQL_SCRIPT
GRANT ALL PRIVILEGES ON $dbname.* TO '$username'@'$host';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
asignuser_
getdbusrafter_
echo
echo -e "${menu}Congratulations${fgred}$username${normal}@${fgred}$host${menu} assigned to database: ${fgred}$dbname${menu} with read write permissions${normal}"
echo
pause && clear
fi
}

#4# OPTION-7 - To Delete User
function dlt_usr_ () {
local mysqlmenu=3
local menuusr=6
tmpusr_tmppass_
local C1="$(printf "\n${menu}Please enter the username you wish to ${fgred}DELETE ${menu}: ${normal}\n") "
    echo && clear && echo
    printf "\n${menu}           MySQL ${fgred}Delete ${menu}Users          ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
getdbusrbefore_ 
read -e -p "$C1" username
back_
host_del_
echo
echo -e "${blink}The following user will be deleted!${normal} "
echo "User: $username"
echo "Host: $host "
echo
confirm_
if [ "$confirm" == 'y' ]; 
then
echo 
mysql -u$TMPUSR -p$TMPPASSWD -N  <<MYSQL_SCRIPT
DROP USER '$username'@'$host';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
    echo && clear && echo
    printf "\n${menu}           MySQL ${fgred}Delete ${menu}Users          ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
getdbusrbefore_ 
echo
echo -e "${blink}${green}The following user successfully deleted${normal} "
echo "User: $username"
echo "Host: $host "
echo
pause_dlt_usr_
fi
}

#4# OPTION-8 - Check user permissions (show title )
function permission_usr_chk_title_ () {
echo && clear && echo
    printf "\n${menu}           MySQL Users permisions         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n" 

}

#4# OPTION-8 - Check user permissions
function permission_usr_chk_ () {
local mysqlmenu=3
tmpusr_tmppass_

permission_usr_chk_title_
perm_valid_usrname_
permission_usr_chk_title_
getdbusrbefore_
perm_valid_host_
local userdatabases="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e  "SHOW GRANTS FOR '$username'@'$host';" | grep -o -P '(?<=( ON `)).*(?=`.* TO )' ) "
#chk_for super user
local CHKSU1="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep "WITH GRANT OPTION" | wc -l)"
local CHKSU2="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep -o -P  '`%`' | wc -l)"
local CHKSU3="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep "PASSWORD" | wc -l)"
#check for backup user
local CHKBU1="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep -v "GRANT USAGE ON" | grep -F -o "*.*"  )" # Check if user have permissions for all databases
local CHKBU2="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep -P -o "GRANT SELECT,|RELOAD,|LOCK TABLES,|SHOW VIEW " | wc -w )" #Check if user have permissions read only
local CHKBU3="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep -o -P '(?<=( ON `)).*(?=`.* TO )'  )"  
#Check root user (if user is root and have password or no )
if [[ $( echo "$CHKSU1" ) != 0 ]] && [[ $( echo "$CHKSU2" ) != 0 ]];
then
clear
permission_usr_chk_title_
perm_echo_su_usr_dtl_ 
perm_pause_chk_usr_
# If user is Super user with password or no and if have spesific permisions
elif [[ $( echo "$CHKSU1" ) != 0 ]] && [[ $( echo "$CHKSU2" ) == 0 ]];
then
permission_usr_chk_title_
perm_echo_su_usr_dtl_            #Show table with user details
perm_pause_chk_usr_              #Show table with advance user permissions
fi
# Check Backup user for all databases
if [[ $( echo "$CHKBU1" ) != 0 ]] && [[ $( echo "$CHKBU2" ) == 7 ]];
then
local SPECUS0=1
permission_usr_chk_title_ 

perm_echo_db_usr_dtl_
perm_pause_chk_usr_
# This user have spesial permitions
echo
else
echo 
fi
#Get user databases
local CHKSDU1="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep -o -P '(?<=(ON `)).*(?=`.* TO)' | wc -l )"
local CHKSDU2="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep -o -P  '`%`' | wc -l )"
local CHKSDU3="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep "WITH GRANT OPTION" | wc -l )"
local CHKSDU4="$(mysql -u$TMPUSR -p$TMPPASSWD -N -e "SHOW GRANTS FOR '$username'@'$host';" | grep -o -P '(?<=(GRANT )).*(?= ON *.* TO )'  | grep -v USAGE | grep -v "ALL PRIVILEGES" | wc -w )"
#get database user with permissions for all databases + spesials
if [[ $( echo "$CHKSDU1" ) -gt 1 ]] && [[ $( echo "$CHKSDU2" ) == 1 ]] && [[ $( echo "$CHKSDU3" ) == 0 ]] && [[ $( echo "$CHKSDU4" ) -gt 10 ]] ;
then
local SPECUS1=1
permission_usr_chk_title_
#echo "BCKP User have admin permissions for all databases + spesial permissions 11111111"
perm_echo_db_usr_dtl_
perm_pause_chk_usr_
elif [ "$CHKSDU1" -ge 1 ] && [[ $( echo "$CHKSDU2" ) == 0 ]] && [[ $( echo "$CHKSDU3" ) == 0 ]] ;
then
local SPECUS1=2
permission_usr_chk_title_
#echo "user have permisions for spesific databases 22222222222222222"
perm_echo_db_usr_dtl_
perm_pause_chk_usr_
elif [ "$CHKSDU1" -gt 1 ] && [[ $( echo "$CHKSDU2" ) == 1 ]] && [[ $( echo "$CHKSDU3" ) == 0 ]] ;
then
local SPECUS1=3
permission_usr_chk_title_
#echo "User have admin permissions for all databases 333333333"
perm_echo_db_usr_dtl_
perm_pause_chk_usr_
else
permission_usr_chk_title_
#echo "nahuy"
#perm_pause_chk_usr_
fi
}

function change_passwd_title_ () {
    echo && clear && echo
    printf "\n${menu}           MySQL Change ${green}Password        ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
} 

#4# OPTION-9 - Chenge user password
function change_passwd_ () {
local mysqlmenu=3
local userchangepass=1234
NEWPASSWD=$NEWPASSWD4
#local C1="$(printf "${menu}Enter Username for Super User ${menu}you wish to create : ${normal}\n")"
tmpusr_tmppass_
change_passwd_title_
valid_usrname_
change_passwd_title_
validate_passwd__with_double_chk_
change_passwd_title_
host_
change_passwd_title_
echo
confirm_
if [ "$confirm" == 'y' ];
then
printf "${blink}${number}Resetting password... ${menu}hold on${normal}\n"
sleep 5
mysql -u$TMPUSR -p$TMPPASSWD -N -e "UPDATE mysql.user SET Password=PASSWORD('$NEWPASSWD') WHERE User='$username' AND host='$host';FLUSH PRIVILEGES;"
change_passwd_title_
echo 
printf "${menu}Password reset for --> ${fgred}${blink}$username${normal}${menu} <-- has been completed ${normal}\n"

sleep 5
fi

}

#4# MENU-1- MYSQL USER LIST FUNCTION
function mysql_menu_4_usr_1_() 
{
    clear
  #	printf "\n${menu}************************************${normal}\n"
	printf "\n${menu}           MySQL ${green}-User- ${menu}Managment    ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
	printf " ${number}1. ${menu}Get User list ${normal}\n"
	printf " ${number}2. ${green}Create${menu} new Super User with grant options ${normal}\n"
	printf " ${number}3. ${green}Create${menu} backup User for all databases ${normal}\n"
	printf " ${number}4. ${green}Create${menu} new User and assign to existing Database ${normal}\n"
	printf " ${number}5. ${green}Create${menu} new User for Developer with permision manage all databases  ${normal}\n"
	printf " ${number}6. ${menu}Asign existing user to manage spesific database  ${normal}\n"
	printf " ${number}7. ${fgred}Delete ${menu}User ${normal}\n"
	printf " ${number}8. ${menu}Check permissions per user${normal}\n"
	printf " ${number}9. ${menu}Change User password${normal}\n"
	printf " ${number}X. ${menu}Press [ ${fgred}X ${menu}] exit or [ ${fgred}B${menu} ] back to Main Menu ${normal}\n"
}

#4# MENU-2- MYSQL USER READ FUNCTION
function mysql_menu_4_usr_1_read_opt_ (){
local mysqlmenu=3
local main="${menu}MySQL-User${normal}"
choice_
	case $choice in
		1) lst_db_usr_ ;;
		2) create_su_ ;;
		3) create_bckp_usr_ ;;
		4) creat_new_usr_4_db_ ;;
		5) create_dev_usr_  ;;
		6) asign_usr_to_db_ ;;
		7) dlt_usr_ ;;
		8) permission_usr_chk_ ;;
		9)change_passwd_  ;;
		x|q|quit|nahuy|home) exit_ ;;
		b) break && mysql_menu_main_0_ ;;
		 passwd|pass|password)change_passwd_  ;;
     perm|userperm|chmod|"user permissions"|"show perm"|"show permissions"|privelage|checkp|pcheck|777|getp|"show perm") permission_usr_chk_ ;;
	 udel|delu|usrdel|delusr|dellusr|deleteusr|deluser|userdell|remuser|"remove user"|u-|su-) dlt_usr_ ;;
	 dbdel|removedb|deld|ddel|dbdel|deldb|delldb|dbdell|"drop db"|dbdrop|"drop database"|"rm db"|"rm dbs"|"remove database"|db-|d-) dlt_db_ ;;
   	 db+usr|createdb+usr|newbd+usr|"create database+"|db+u|u+db|dbww|wwdb|newwwdb|db+u) create_db_and_usr_ ;;
     sglcore) logo_  ;;
     dbget|getdb|dblist|listdb|dbl|getd|showdb|"show db"|"list db"|"get db"|db|databases|alldb|dbs|showd|listd|dlist|db?) lst_db_  ;;
     getuser|getusr|listuser|userlist|"user list"|"list user"|"get users"|"show user"|"list user"|getu|uget|ulist|listu|showu|"show u"|"user show"|"all users"|allu) lst_db_usr_ ;;
     newsu|su|newsu|newroot|createroot|superuser|createsuper|supercreate|"super create"|"create root user"|sucreate|"root create"|"create user root"|createsu|sucreate|su+) create_su_ ;;
	 asignu|asignuser|"asign user"|"new user for db"|createu+|u2db|u4db|asign|"new db user"|+u|user+|addu) creat_new_usr_4_db_ ;;
	 user|users) mysql_menu_4_usr_0_ ;;
	 database|db) mysql_menu_3_db_0_  ;;
	 devu|newdev) create_dev_usr_ ;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
		
	esac
	history -w script_history
}

#4# MENU-3- MYSQL USER LOOP FUNCTION
function mysql_menu_4_usr_0_ () {
while true
do
mysql_menu_4_usr_1_
mysql_menu_4_usr_1_read_opt_
done
}

#4#________________________ SUB-2 MySQL -User- Managment End ______________________#4#


#3#________________________ SUB-1 MySQL -DataBase- Managment Start ________________#3#



#3# OPTION-1. Get Database list
function lst_db_ () {
local mysqlmenu=2
local menudb=1
tmpusr_tmppass_
clear
echo
echo 
clear
echo
    printf "\n${menu}              Database list         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
getdbbefore_
echo
printf "${menu}Press [ ${fgred}D${STD}${menu} ] ${menu}to select Database to delete: ${normal}\n"
echo
#pause_dlt_db_ 
pause
}

#3# OPTION-2. Create new Database and User (Title)
function create_db_and_usr_title_ () {
echo && clear && echo
    printf "\n${menu}       Create New Database and User         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n" 

}

#3# OPTION-2. Create new Database and User
function create_db_and_usr_ (){
local mysqlmenu=2
menudb=2
tmpusr_tmppass_
clear
create_db_and_usr_title_
valid_dbname_
create_db_and_usr_title_
valid_passwd_db_usr_
clear
create_db_and_usr_title_
host_
clear
create_db_and_usr_title_
echo
#echo -e "${menu}New database and new user will be created${normal}"
echo  
echo -e "${menu}Database: ${green}$dbname${normal}"
echo -e "${menu}User:     ${green}$dbname${normal}"
echo -e "${menu}Pass:     ${green}$NEWPASSWD${normal}"
echo -e "${menu}Host:     ${green}$host${normal}"
echo
confirm_
	if [ "$confirm" == 'y' ]; 
   then
mysql -u$TMPUSR -p$TMPPASSWD -N <<MYSQL_SCRIPT
CREATE DATABASE $dbname;
CREATE USER '$dbname'@'$host' IDENTIFIED BY '$NEWPASSWD';
GRANT ALL PRIVILEGES ON $dbname.* TO '$dbname'@'$host';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
echo
clear
create_db_and_usr_title_
getdbusrafter_spesial_
getdbafter_
echo 
echo -e "${menu}MySQL database and user created:"
echo "                    "
echo -e "${menu}Database: ${green}$dbname${normal}"
echo -e "${menu}User:     ${green}$dbname${normal}"
echo -e "${menu}Pass:     ${green}$NEWPASSWD${normal}"
echo -e "${menu}Host:     ${green}$host${normal}"
echo "                    "
echo "                    "
pause
fi
}


#3# OPTION-3. Create new Database
function create_new_db_title_ () {
clear
echo
    printf "\n${menu}      Create New Database without user         ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
	}
	
function create_new_db_ () {
local mysqlmenu=2
menudb=3
tmpusr_tmppass_
echo 
create_new_db_title_
valid_dbname_
create_new_db_title_
echo
getdbbefore_
echo
echo -e "${menu}New Database ${green}$dbname ${menu}will be created.${normal} "
echo
confirm_
if [ "$confirm" == 'y' ]; 
then
mysql -u$TMPUSR -p$TMPPASSWD -N  <<MYSQL_SCRIPT
CREATE DATABASE $dbname;
FLUSH PRIVILEGES;
MYSQL_SCRIPT
clear
echo 
create_new_db_title_
getdbafter_
echo
echo -e "${menu}New database ${green}$dbname ${menu}created${normal}"
echo
echo
pause       
fi
} 
 
#3# OPTION-3. Delete Database
function dlt_db_ () {
local mysqlmenu=2
menudb=4
tmpusr_tmppass_
local C1="$(printf "\n${menu}Please enter the DataBase name you wish to ${fgred}DELETE ${menu}: ${normal}\n") "
clear
	printf "\n${menu}           MySQL ${fgred}Delete ${menu}Database          ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
getdbbefore_
read -e -p" $C1" dbname
back_
echo
echo
echo -e "${menu}Database -->${number}$dbname${menu}<-- will be ${fgred}DELETED!${normal}"
echo
confirm_
if [ "$confirm" == 'y' ]; 
then
echo "Creating Backup for database $dbname /tmp/mysql-tmp only for 15 min"
mysqlbckp_
echo 
mysql -u$TMPUSR -p$TMPPASSWD -N <<MYSQL_SCRIPT
DROP DATABASE $dbname;
FLUSH PRIVILEGES;
MYSQL_SCRIPT
clear
echo 
getdbbefore_
echo
printf "${menu}Press [ ${fgred}D${STD}${menu} ] ${menu}to select Database to delete: ${normal}\n"
echo
pause
fi
}

#3# MENU-1- MYSQL DATABASE LIST FUNCTION
function mysql_menu_3_db_1_() {  
    clear
	echo -e "$h1"
	printf "\n${menu}           MySQL ${green}-DataBase- ${menu}Managment    ${normal}\n"
	printf "\n${menu}******************************************${normal}\n"
	printf " ${number}1. ${menu}Get all Database list ${normal}\n"
	printf " ${number}2. ${menu}Create new Database with user${normal}\n"
	printf " ${number}3. ${menu}Create new database without user ${normal}\n"
	printf " ${number}4. ${fgred}Delete ${menu}Database ${normal}\n"
	printf " ${number}X. ${menu}Press [ ${fgred}X ${menu}] exit or [ ${fgred}B${menu} ] back to Main Menu ${normal}\n"
}

#4# MENU-2- MYSQL DATABASE READ FUNCTION
function mysql_menu_3_db_1_read_opt_ (){
local mysqlmenu=2
local main="${menu}MySQL-DB${normal}"
choice_
	case $choice in
		1) lst_db_ ;;
		2) create_db_and_usr_ ;;
		3) create_new_db_ ;;
		4) dlt_db_ ;;
		5) exit_ ;;
		x|q|quit|nahuy|home|exit|kill|sleep) exit_ ;;
		b) break && mysql_menu_main_0_ ;;
		passwd|pass|password)change_passwd_  ;;
     perm|userperm|chmod|"user permissions"|"show perm"|"show permissions"|privelage|checkp|pcheck|777|getp|"show perm") permission_usr_chk_ ;;
	 udel|delu|usrdel|delusr|dellusr|deleteusr|deluser|userdell|remuser|"remove user"|u-|su-) dlt_usr_ ;;
	 dbdel|removedb|deld|ddel|dbdel|deldb|delldb|dbdell|"drop db"|dbdrop|"drop database"|"rm db"|"rm dbs"|"remove database"|db-|d-) dlt_db_ ;;
   	 db+usr|createdb+usr|newbd+usr|"create database+"|db+u|u+db|dbww|wwdb|newwwdb|db+u) create_db_and_usr_ ;;
     sglcore) logo_  ;;
     dbget|getdb|dblist|listdb|dbl|getd|showdb|"show db"|"list db"|"get db"|db|databases|alldb|dbs|showd|listd|dlist|db?) lst_db_  ;;
     getuser|getusr|listuser|userlist|"user list"|"list user"|"get users"|"show user"|"list user"|getu|uget|ulist|listu|showu|"show u"|"user show"|"all users"|allu) lst_db_usr_ ;;
     newsu|su|newsu|newroot|createroot|superuser|createsuper|supercreate|"super create"|"create root user"|sucreate|"root create"|"create user root"|createsu|sucreate|su+) create_su_ ;;
	 asignu|asignuser|"asign user"|"new user for db"|createu+|u2db|u4db|asign|"new db user"|+u|user+|addu) creat_new_usr_4_db_ ;;
	 user|users) mysql_menu_4_usr_0_ ;;
	 database|db) mysql_menu_3_db_0_  ;;
	 devu|newdev) create_dev_usr_ ;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
		
	esac
	history -w script_history
}

#4# MENU-3- MYSQL DATABASE LOOP FUNCTION
function mysql_menu_3_db_0_ () {
while true
do
mysql_menu_3_db_1_
mysql_menu_3_db_1_read_opt_
done
}
#3#________________________ SUB-1 MySQL -DataBase- Managment End ________________#3#




#2#________________________ MAIN MySQL -Main- Menu Start ________________________#2#

#2# MENU-1-  MYSQL MAIN LIST FUNCTION
function mysql_menu_2_main_1_() {
tmpusr_tmppass_
    clear
	#echo -e ""$h1""
  #	printf "\n${menu}************************************${normal}\n"
	printf "\n${menu}          MySQL ${green}-Main- ${menu}Menu    ${normal}\n"
	printf "\n${menu}************************************${normal}\n"
	printf " ${number}1. ${menu}Database Managment ${normal}\n"
	printf " ${number}2. ${menu}User Managment ${normal}\n"
	printf " ${number}3. ${menu}Query + find and raplace ${normal}\n"
	printf " ${number}4. ${menu}Backup and Restore ${normal}\n"
	printf " ${number}5. ${menu}Cluster Managment ${normal}\n"
	printf " ${number}X. ${menu}Press [ ${fgred}X ${menu}] exit or [ ${fgred}B${menu} ] back to Main Menu ${normal}\n"
	}

#2# MENU-2- MYSQL MAIN READ FUNCTION
function mysql_menu_2_main_1_read_opt_ () {

local mysqlmenu=1
    local main="${menu}MySQL-Main${normal}"
	choice_
	case $choice in
		1) mysql_menu_3_db_0_ ;;
		2) mysql_menu_4_usr_0_ ;;
		3) three_ ;;
		4) four_ ;;
		5) five_ ;;
		x|q|quit|nahuy|home|exit|kill|sleep) exit_ ;;
		#b) break && mysql_show_menu_main_ ;;
		passwd|pass|password)change_passwd_  ;;
  perm|userperm|chmod|"user permissions"|"show perm"|"show permissions"|privelage|checkp|pcheck|777|getp|"show perm") permission_usr_chk_ ;;
	 udel|delu|usrdel|delusr|dellusr|deleteusr|deluser|userdell|remuser|"remove user"|u-|su-) dlt_usr_ ;;
	 dbdel|removedb|deld|ddel|dbdel|deldb|delldb|dbdell|"drop db"|dbdrop|"drop database"|"rm db"|"rm dbs"|"remove database"|db-|d-) dlt_db_ ;;
   	 db+usr|createdb+usr|newbd+usr|"create database+"|db+u|u+db|dbww|wwdb|newwwdb|db+u) create_db_and_usr_ ;;
     sglcore) logo_  ;;
     dbget|getdb|dblist|listdb|dbl|getd|showdb|"show db"|"list db"|"get db"|db|databases|alldb|dbs|showd|listd|dlist|db?) lst_db_  ;;
     getuser|getusr|listuser|userlist|"user list"|"list user"|"get users"|"show user"|"list user"|getu|uget|ulist|listu|showu|"show u"|"user show"|"all users"|allu) lst_db_usr_ ;;
     newsu|su|newsu|newroot|createroot|superuser|createsuper|supercreate|"super create"|"create root user"|sucreate|"root create"|"create user root"|createsu|sucreate|su+) create_su_ ;;
	 asignu|asignuser|"asign user"|"new user for db"|createu+|u2db|u4db|asign|"new db user"|+u|user+|addu) creat_new_usr_4_db_ ;;
	 user|users) mysql_menu_4_usr_0_ ;;
	 database|db) mysql_menu_3_db_0_  ;;
	 devu|newdev) create_dev_usr_ ;;
		*) echo -e "${RED}Error...${STD}" && sleep 1
		
	esac
	history -w script_history
}
 
#2# MENU-3- MYSQL MAIN LOOP FUNCTION
function mysql_menu_main_0_ () {
while true
do
mysql_menu_2_main_1_
mysql_menu_2_main_1_read_opt_
done
}
#2#________________________ MAIN MySQL -Main- Menu End _________________________#2#



#1#________________________ START Menu Start ___________________________________#1#
#1# List of menus: 3 selection
#1# OPTION-1. To MySQL Menagmen        ---> chk_root_exist_passwd_ 
#1# OPTION-2. Reset MySQL root passwd  ---> reset_root_passwd_ 

#1# OPTION-1. Save to temorary cach mysql user and password
function chk_root_exist_passwd_ () {
ctrl_
clear
local C1="$(printf "${menu}Enter MySQL super user: ${normal}\n")"
local C2="$(printf "${menu}Enter MySQL passwd: ${normal}\n")"

while true;
 do 
 read -e -p "$C1" usr
     
    read -s -p "$C2" passwd
    local x="$(mysql -u$usr -p"$passwd" -N -e 'SELECT User,Host FROM mysql.user;' | grep localhost | wc -l)"
	clear
    echo
if [ $x == 0 ];
 then
 clear
    echo -e "${menu}You enter ${fgred}${blink}wrong ${normal}${menu}pasword for user${fgred}${blink} "$usr" ${normal}${menu}please enter again${normal}"
    sleep 2
  else
     echo "$usr" > $TMP1
    echo "$passwd" > $TMP
	
	return 0 && break 
	
 fi
done

sleep 1
clear 

}

#1# OPTION-2. Open MySQL shell
function open_mysql_shell_ () {
local mysqlmenu=2
local menudb=1
back_
mysql -u$TMPUSR -p$TMPPASSWD 
}

#1# OPTION-3. Reset MySQL root password
function reset_root_passwd_ () {
local username=root
local C1="$(printf "${menu}Enter new password for ${blink}${number}root ${normal}${menu}user: ${normal}\n")"
local C2="$(printf "Pass: $NEWPASSWD ${normal}\n")"
echo
echo
validate_passwd__with_double_chk_
echo 
echo "User: root@localhost"
echo -e "Pass: ${blink}${number}$NEWPASSWD ${normal}\n"
echo
read -e -p "Please confirm MySQL password reset. Continue?(y/n) : " confirm
if [ "$confirm" == 'y' ];
then
clear
echo
echo 'Shutting down any mysql processes...'
sleep 2
systemctl stop mariadb
pkill -9 mysqld
pkill -9 mariadb
sudo mysqld_safe --skip-grant-tables --skip-networking  >res 2>&1 &
printf "${blink}${number}Resetting password... ${menu}hold on${normal}\n"
sleep 7
mysql mysql -e "UPDATE user SET Password=PASSWORD('$NEWPASSWD') WHERE User='root' AND host='localhost';FLUSH PRIVILEGES;"
systemctl stop mariadb
clear
pkill -9 mysqld
pkill -9 mariadb
clear
sudo systemctl start mariadb
echo 'Cleaning up...' 
sleep 3
pkill -9 mysqld
pkill -9 mariadb
systemctl stop mariadb
sudo systemctl start mariadb
echo 
clear           
echo "Users         Hosts"
mysql -uroot -p$NEWPASSWD -N -e  'SELECT User,Host FROM mysql.user;' | grep --color=always -e "^" -e "^$username\|localhost$" | sed 's/\t/,|,/g' | column -s ',' -t
echo
	printf "${menu}Password reset has been completed and tested ${normal}\n"
	echo 
	echo -e "${menu}MySQL User: ${fgred}root${normal}@${normal}localhost "
    echo -e "${menu}MySQL Pass:${normal} $NEWPASSWD ${normal}\n"
	printf "${menu}Remember to store this password safely! ${normal}\n"
	echo 
pause
fi

}


#1# MENU-1- MYSQL START LIST FUNCTION ( + run 1 time timer_ + greetgusr_ )
function mysql_show_menu_main_() {
timer_
h1=`date +%R:%M%p`
clear
greetgusr_
	clear
	echo -e ""$greet" ${green}"$whoami" ${normal}"
	echo -e ""$h1""
	printf "\n${menu}************************************${normal}\n"
	printf "\n${menu}       MySQL Managment System    ${normal}\n"
	printf "\n${menu}************************************${normal}\n"
	printf " ${number}1. ${menu}To MySQL Menagment ${normal}\n"
	printf " ${number}2. ${menu}Open MySQL shell ${normal}\n"
	printf " ${number}3. ${menu}Reset MySQL root passwd ${normal}\n"
	printf " ${number}X. ${menu}Press [ ${fgred}X ${menu}] ${menu}to exit${normal}\n"
return
}

#1# MENU-2- MYSQL START READ FUNCTION  ( + run ctrl_ )
function mysql_menu_main_start_read_opt_ () {
     local mysqlmenu=0
	 local main="${menu}MySQL-Start${normal}"
	choice_
	case $choice in
		1) mysql_menu_main_0_ ;;
		2) open_mysql_shell_ ;;
		3) reset_root_passwd_ ;;
		4) mysql_menu_main_0_  ;;
		x) exit_ ;;
		passwd|pass|password)change_passwd_  ;;
	 perm|userperm|chmod|"user permissions"|"show perm"|"show permissions"|privelage|checkp|pcheck|777|getp|"show perm") permission_usr_chk_ ;;
	 udel|delu|usrdel|delusr|dellusr|deleteusr|deluser|userdell|remuser|"remove user"|u-|su-) dlt_usr_ ;;
	 dbdel|removedb|deld|ddel|dbdel|deldb|delldb|dbdell|"drop db"|dbdrop|"drop database"|"rm db"|"rm dbs"|"remove database"|db-|d-) dlt_db_ ;;
   	 db+usr|createdb+usr|newbd+usr|"create database+"|db+u|u+db|dbww|wwdb|newwwdb|db+u) create_db_and_usr_ ;;
     sglcore) logo_  ;;
     dbget|getdb|dblist|listdb|dbl|getd|showdb|"show db"|"list db"|"get db"|db|databases|alldb|dbs|showd|listd|dlist|db?) lst_db_  ;;
     getuser|getusr|listuser|userlist|"user list"|"list user"|"get users"|"show user"|"list user"|getu|uget|ulist|listu|showu|"show u"|"user show"|"all users"|allu) lst_db_usr_ ;;
     newsu|su|newsu|newroot|createroot|superuser|createsuper|supercreate|"super create"|"create root user"|sucreate|"root create"|"create user root"|createsu|sucreate|su+) create_su_ ;;
	 asignu|asignuser|"asign user"|"new user for db"|createu+|u2db|u4db|asign|"new db user"|+u|user+|addu) creat_new_usr_4_db_ ;;
	 user|users) mysql_menu_4_usr_0_ ;;
	 database|db) mysql_menu_3_db_0_  ;;
	 devu|newdev) create_dev_usr_ ;;
	 
		*) echo -e "${RED}Error...${STD}" && sleep 1 && ctrl_
	esac
}
 
#1# MENU-3-  MYSQL START LOOP FUNCTION
function mysql_menu_main_start_ () {

trap '' SIGINT SIGQUIT SIGTSTP

while true
do
mysql_show_menu_main_
mysql_menu_main_start_read_opt_

done
}
#1#________________________#1# START Menu End #1#______________________________#1#


mysql_menu_main_start_ 












