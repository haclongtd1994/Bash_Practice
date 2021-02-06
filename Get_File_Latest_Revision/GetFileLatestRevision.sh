#!/bin/bash

i=1

for arg in "$@"
do
	echo "Get svn info File $i: \"$arg\""
	svn info $arg | awk '{if($1=="Name:"){print "File" $0;}; if($3=="Rev:"){print "Latest " $3 " " $4;};}' >> 'D:\SVN_Revision.temp'
	i=$(($i+1))
done

cat "D:\SVN_Revision.temp" | grep -E '.*' | clip
rm 'D:\SVN_Revision.temp'
