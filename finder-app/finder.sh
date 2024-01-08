#!/bin/sh

#this script accepts 2 input argumnets
#$1 - filesdir - path to a directory on file system
#$2 - searchst - string to search within files in filesdir/*

#if either of arguments are invalid then script will exit with value 1
#if both arguments are valid then script will search for the searchstr within filesdir

if [ $# -lt 2 ];then
	echo "insufficient number of arguments for finder.sh"
	exit 1
fi

if [ ! -d $1 ] ;then
	echo $1" is not a directory in filesystem"
	exit 1
else
	filesdir=$1
fi
if [ $2 = "" -o $2 = " " ]; then
	echo $2" is empty"
	exit 1
else
	searchstr=$2
fi

#find all files under filesdir/* and input to search of searchstr
matchfiles="$(grep -r -l $searchstr "$filesdir")" #return only files with matches

filecount=0
matchcount=0
increment=1
for file in $matchfiles
	do	
	filecount="$(($filecount+$increment))"
	count="$(grep -c $searchstr "$file")"
	matchcount="$(($matchcount+$count))"	
	done
echo "The number of files are "$filecount" and the number of matching lines are "$matchcount
exit 0


