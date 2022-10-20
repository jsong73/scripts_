#!/bin/bash
CWD=$(basename $PWD)
TARGETDIR=$(find ../../../GT-VIRT-FSF-FT-09-2022-U-LOLC -maxdepth 1 -name "*${CWD}*")

STOP= $2
i=$1

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



