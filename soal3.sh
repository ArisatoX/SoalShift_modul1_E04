#!/bin/bash

x=1;

fname="password$x.txt"

pass=`cat /dev/urandom | tr -dc A-Za-z0-9 | head -c12`

while test -e $fname;
do
	if [ "$pass" = "`cat $fname`" ]; then
		pass=`cat /dev/urandom | tr -dc A-Za-z0-9 | head -c12`
		x=1
		fname="password$x.txt"
		continue
	fi
	(( ++ x ))
	fname="password$x.txt"
done

echo $pass > $fname
