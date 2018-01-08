#!/bin/bash
j=0
for i in `grep -n "image_name" .env`; do
if [[ $i != *"robot"* ]]; then
Images[$j]=`cut -d '=' -f2 <<<$i`
j=`expr $j+1`
fi
done
for z in "${Images[@]}"; do
echo $z
done
