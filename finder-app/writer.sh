#!/bin/bash

#this script accepts 2 input argumnets
#$1 - filepath - path to a file on file system
#$2 - writestr - string to write in filepath

#if filepath is emmpty then script will exit with value of 1
#if filepath is valid then script write writestr into filepath
if [ ! -f $1 ];then
	if [ $1 = "" -o $1 = " " ]; then
		echo $1" is empty filepath"
		exit 1		
	else
		filepath=$1
		#touch $filepath
	fi
else
	filepath=$1
fi

if [ $2 = "" -o $2 = " " ]; then
	echo $2" is empty write string"
	exit 1
else
	writestr=$2
fi

#write the writestr into filepath
mkdir -p "$(dirname "$filepath")" 
echo $writestr >| "$filepath"
exit 0
