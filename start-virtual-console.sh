#!/bin/bash

vkvmhost=$1

vkvmuser=$2

echo -n 'Password: '
read -s vkvmpwd
echo

./jre/bin/java -cp avctKVM.jar -Djava.library.path=./lib com.avocent.kvm.client.Main ip=$vkvmhost kmport=2068 vport=2068 user=$vkvmuser passwd=$vkvmpwd apcp=1 version=2 vmprivilege=true "helpurl=https://$vkvmhost:443/help/contents.html"
