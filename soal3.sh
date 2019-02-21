#!/bin/bash

x=1;

while test -e "/home/arisatox/soal3/password$x.txt";
do
	(( ++ x ))
done

fname="password$x.txt"
< /dev/urandom tr -dc A-Za-z0-9 | head -c12 > /home/arisatox/soal3/password$x.txt
