#!/bin/bash
store_lct_save="/data/data/com.termux/files/home/sls"
echo "enter name file :"
read fl
echo "enter file for search :"
read flnm
for lct in $(cat "$store_lct_save")
do
    find $lct -type f -name $fl
    if [ "$fl" == "$flnm" ]
    then
        echo "found $fl in $lct";
    else 
        echo "not found $lct"
    fi
done


