#!/bin/bash

for i in $(seq 1 100)
do
    num=$(($i % 2))
	if [ "$num" -eq "0" ]; then
		echo $i
	fi
done
