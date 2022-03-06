#!/bin/bash
#--Variables
user=root
pass=" "
host=localhost
dbcurrent=finito
orig=http
nvalue=https
#--Permanent Variables
sqlcommand="mysql --user="$user" --password="$pass" --host="$host" --database="$dbcurrent" -e"
dbtables="$($sqlcommand "show tables;")" #--List all tables
dbtables="$(printf '%s\n' "${dbtables//Tables_in_$dbcurrent/}")" #--Remove the Tables_in_finito from list
dbtablescount="$(echo "$dbtables" | wc -w)" #--Count all tables

function replace_ (){
for i in $(seq 1 $dbtablescount);do #--Go to each table
currenttable="$(echo $dbtables | head -n1 | awk '{print $1;}')" 
tablefields="$($sqlcommand  "SHOW COLUMNS FROM $currenttable;" | awk '{print $1}')" #--Save the current field
tablefields="$(printf '%s\n' "${tablefields//'Field'/}")" #--Remove the Field from list
secreplace_
done
}

function secreplace_ (){
countfield="$(echo "$tablefields" | wc -w)" #--Count all fields
for i in $(seq 1 $countfield);do #--Go to each table
currentfield="$(echo $tablefields | head -n1 | awk '{print $1;}')" 
$sqlcommand "UPDATE $dbcurrent SET $currentfield = REPLACE('$orig', '$orig', '$nvalue')" #--Replace original value with new value
tablefields="$(printf '%s\n' "${tablefields//$currentfield/}")" #--Remove the table_field from list
done
}

$sqlcommand "show tables;"

function press_ (){
table=3
while [[ $table > [2] ]];do
read -p 'Press:
1. Replace in all tables
2. Replace in a specific table
' table
done
}
press_

function main_ (){
if [ "$table" == 2 ];then
read -p 'Insert table name:
' tablefields
secreplace_
else
replace_
fi
}
main_