#!/bin/bash

vkvmhost=$1

vkvmuser=$2

echo -n 'Password: '
read -s vkvmpwd
echo

./jre/bin/java -cp avctVM.jar -Djava.library.path=./lib com.avocent.vm.VirtualMedia ip=$vkvmhost port=2068 user=$vkvmuser passwd=$vkvmpwd title="$vkvmhost Virtual Media" language="en"
