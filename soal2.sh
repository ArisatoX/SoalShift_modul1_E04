#!/bin/bash
`cat /home/arisatox/Downloads/WA_Sales_Products_2012-14.csv| awk 'BEGIN {FS=","} {if($7==2012)arr[$1]+=$10}END{for(a in arr)print arr[a]","a}'| sort -rg | awk 'NR==1'|awk 'BEGIN {FS=","}{print $2}' > soal2a.txt`

x=`cat soal2a.txt`

`cat /home/arisatox/Downloads/WA_Sales_Products_2012-14.csv| awk -v var="$x" '{FS=","}{if($7==2012 && $1==var)print $1","$7","$4","$10}' | awk '{FS=","} {arr[$3]+=$4} END {for(a in arr) print arr[a]","a}' | sort -rg |awk 'NR < 4' |awk 'BEGIN {FS=","}{print $2}' > soal2b.txt`

y1=`cat soal2b.txt | awk NR==1`
y2=`cat soal2b.txt | awk NR==2`
y3=`cat soal2b.txt | awk NR==3`

`cat /home/arisatox/Downloads/WA_Sales_Products_2012-14.csv| awk -v var="$x" -v var1="$y1" -v var2="$y2" -v var3="$y3" 'BEGIN {FS=","}{if($7==2012 && $1==var && ($4 == var1|| $4==var2 || $4 ==var3))print $1","$7","$6","$10}' |  awk 'FS=","{arr[$3]+=$4} END {for(a in arr) print arr[a]","a}' | sort -rg|awk 'NR < 4' |awk 'BEGIN{FS=","}{print $2}' > soal2c.txt`
