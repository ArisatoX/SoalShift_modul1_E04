#!bin/bash

x=1;
for x in `ls /home/arisatox/Downloads/nature/`
do
`base64 -d /home/arisatox/Downloads/nature/$x | xxd -r > /home/arisatox/Downloads/tes/$x`
done
