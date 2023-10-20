#!/bin/bash

sum=0
for number in {1000..2000};
do
    if [[ $number =~ [0,1][0,1][0,1][0,1]$ ]]; then
	sum=$((sum + number))
    fi
done
echo $sum
