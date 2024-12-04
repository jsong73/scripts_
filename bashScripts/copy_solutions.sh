#!/bin/bash
N=$1
# class curriculum
SRCtemp=$(find /c/Users/jenni/desktop/2U/software-development-v7/01-Class-Content -mindepth 1 -maxdepth 1 -name "*${N}*")
SRC="${SRCtemp}/01-Activities/*/"
# cohort gitlab repo
TARGETDIRtemp=$(find /c/Users/jenni/desktop/2U/CU-VIRT-FSF-FT-12-2024-U-LOLC -mindepth 1 -maxdepth 1 -name "*${N}*")
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
cd /c/Users/jenni/desktop/2U/CU-VIRT-FSF-FT-12-2024-U-LOLC
/c/Users/jenni/desktop/2U/Solutions/bashScripts/commitMain.sh "Solutions for unit ${N}, activities ${2}-${3}"

# Run script by then below command 
# ./copySolutions.sh 03 01 08
# 03 is the unit #
# 01 is the starting activity 
# 08 is the ending activity
