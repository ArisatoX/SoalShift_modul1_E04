#!/bin/bash

dir="/home/anantadwi13/SISOP/modul1"

unzip -o "$dir/nature.zip" > /dev/null

mkdir -p "$dir/nature-extracted"

for x in `ls $dir/nature`
do
	`base64 -d "$dir/nature/$x" | xxd -r > "$dir/nature-extracted/$x"`
done
