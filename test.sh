#!/bin/bash

file="perm_5"

test_perm ()
{
	resf="res"
	rm -f $resf
	touch $resf
	while IFS= read -r line
	do
    	n=`../push_swap $line | wc -l | sed "s/ //g"`
		echo "$line=$n" >> $resf
	done < "$1"
	max=`cat $resf | sort -n -k 2 -t '=' | tail -1`
	echo $max
}

test_adv ()
{
	resf="res"
	rm -f $resf
	touch $resf
	i="0"
	n=$1
	iter=$2
	while [ "$i" !=  "$iter" ]
	do
		push=$(../push_swap `seq 1 $n | sort -R` | wc -l | sed "s/ //g")
		echo $push
		echo $push >> $resf
		i=$((i+1))
	done
	max=`cat $resf | sort -n | tail -1`
	echo $max
}

#test_perm $file

test_adv 500 10