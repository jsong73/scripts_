#!/bin/bash
N=$1
SRCtemp=$(find /c/Documents/GT-TA/Curriculum/fullstack-ground/01-Class-Content -mindepth 1 -maxdepth 1 -name "*${N}*")
SRC="${SRCtemp}/01-Activities/*/"
TARGETDIRtemp=$(find /c/Documents/GT-TA/GT-VIRT-FSF-FT-12-2022-U-LOLC -mindepth 1 -maxdepth 1 -name "*${N}*")
TARGETDIR="${TARGETDIRtemp}/01-Activities/"

for dir in $SRC
do
	current=$(basename $dir)
	sliced=${current:0:2}
	check=$(expr $sliced % 2)
	if [[ $check = 1 || ${sliced#0} -lt $2 || ${sliced#0} -gt $3 ]]
	then
		continue
	else
		solved=$(find $dir -maxdepth 1 -name "*Solved*")
		targetsub=$(find $TARGETDIR -maxdepth 1 -name "*${sliced}*")
		cp -r $solved $targetsub
	fi
done
cd /c/Documents/GT-TA/GT-VIRT-FSF-FT-12-2022-U-LOLC
~/commitMain.sh "Solutions for unit ${N}, activites ${2}-${3}"

