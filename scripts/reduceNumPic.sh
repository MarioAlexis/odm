#!/bin/bash

srcpath=$1
dstpath=$2
factor=$3
counter=0

if [ $srcpath == "--help" ]
then
	echo
	echo -e "1.- Source Path"
	echo -e "2.- Destination Path"
	echo -e "3.- Dividor Factor"
	echo
	echo "If destination path do not exist, this script will create it"
	echo "accordly the folder tree need it for ODM"
	exit
fi

if [ ! -d "$dstpath" ]
then
	mkdir -p $dstpath/images
fi

for i in $srcpath/*
do
	filename=$(basename "$i")
	if [ $counter == $(($factor)) ]
	then
		cp $srcpath/$filename $dstpath/
		counter=0
	fi
	counter=$(($counter+1))
done
