#!/bin/bash
N=$1
SRCtemp=$(find /c/Documents/GT-TA/Curriculum/fullstack-ground/01-Class-Content -maxdepth 1 -name "*${N}*")
SRC="${SRCtemp}/01-Activities/*/"
TARGETDIRtemp=$(find /c/Documents/GT-TA/GT-VIRT-FSF-FT-09-2022-U-LOLC -maxdepth 1 -name "*${N}*")
TARGETDIR="${TARGETDIRtemp}/01-Activities/"

i=0
for dir in $SRC
do
	((i++))
	current=$(basename $dir)
	sliced=${current:0:2}
	check=$(expr $sliced % 2)
	if [[ $check = 1 || $i -lt $2 ]]
	then
		continue
	elif [[ $i -ge $3 ]]
	then
		break
	else
		solved=$(find $dir -maxdepth 1 -name "*Solved*")
		targetsub=$(find $TARGETDIR -maxdepth 1 -name "*${sliced}*")
		cp -r $solved $targetsub
	fi
done


