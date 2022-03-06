#!/bin/bash

#--Insert DB variables
user=root
pass=" "
host=localhost
dbcurrent=finito
orig=http
nvalue=https

#--List all databases
#dbases="$(mysql --user="$user" --password="$pass" --host="$host" -e "show databases;")"
#--Count all databases 
#dbcount="$(echo "$dbases" | wc -w)"

#--Go to each database
#for i in $(seq 1 $dbcount);do
#--Save the current database
#dbcurrent="$(echo $dbases | head -n1 | awk '{print $1;}')"
#--Remove the current database from the list
#dbases="$(printf '%s\n' "${dbases//$dbcurrent/}")"

#--List all tables
dbtables="$(mysql --user="$user" --password="$pass" --host="$host" --database="$dbcurrent" -e "show tables;")"
#--Count all tables
dbtablescount="$(echo "$dbtables" | wc -w)"

#--Go to each table
for i in $(seq 1 $dbtablescount);do
#--Save the current fields
tablefields="$(mysql --user="$user" --password="$pass" --host="$host" --database="$dbcurrent" -e  "SHOW COLUMNS FROM $tablefields;" | awk '{print $1}')"
#--Remove the Field from list
tablefields="$(printf '%s\n' "${tablefields//'Field'/}")"

#--Save the current table
tablefieldscurrent="$(echo $tablefields | head -n1 | awk '{print $1;}')"
#--Count all fields
tablefieldscount="$(echo "$tablefields" | wc -w)"

for i in $(seq 1 $tablefieldscount);do
#--Replace original value with new value
tablefieldscurrent="$(echo $tablefields | head -n1 | awk '{print $1;}')"
mysql --user="$user" --password="$pass" --host="$host" --database="$dbcurrent" -e "UPDATE $tablefieldscurrent SET option_value = REPLACE('$orig', '$orig', '$nvalue')"
tablefieldscurrent="$(printf '%s\n' "${tablefields//$tablefieldscurrent/}")"
done
done
done


