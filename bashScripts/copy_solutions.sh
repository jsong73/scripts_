#!/bin/bash
CWD=$(basename $PWD)
TARGETDIR=$(find ../../../GT-VIRT-FSF-FT-09-2022-U-LOLC -maxdepth 1 -name "*${CWD}*")
echo $CWD
echo $TARGETDIR

echo "What activity did they start on?"
read START
echo "What activity are they stopping on?"
read STOP

i=$START

while [ $i -le $STOP ]
do
	if [[ $i -lt 10 ]]
	then
		SOURCE=$(find -maxdepth 1 -name "*0${i}*")
		TARGETSUB=$(find "${TARGETDIR}/01-Activities" -maxdepth 1 -name "*0${i}*")
	else
		SOURCE=$(find -maxdepth 1 -name "*${i}*")
		TARGETSUB=$( find "${TARGETDIR}/01-Activities" -maxdepth 1 -name "*${i}*")
	fi

	cp -r "${SOURCE}/Solved" $TARGETSUB
	(( i+=2 ))
done



