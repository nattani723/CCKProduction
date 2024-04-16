#!/bin/bash

# Get the file(s) with the kaons
filestouse=20
#filestouse=3

# Count the number of files 
GenFiles=$(wc -l gen_assok.list | awk '{ print $1 }')

touch genfiles.list

i=1
while [ "$i" -le "$filestouse" ]; do
LINE=$((1 + $RANDOM % $GenFiles))
FILE=$(sed "${LINE}q;d" gen_assok.list)
#Copy that file onto the node
ifdh cp $FILE kaons_gen_$i.root

#echo hyperons_gen_$i.root >> genfiles.list
lar -c wirecell_g4_uboone.fcl -s kaons_gen_$i.root -o kaons_g4_$i.root -n -1
#lar -c run_HyperonFilterG4.fcl -s  hyperons_g4_$i.root -o hyperons_filtered_$i.root -n -1
echo kaons_g4_$i.root >> genfiles.list
rm kaons_gen_$i.root
#rm hyperons_g4_$i.root
i=$(($i + 1))
done

lar -c standard_overlay_gen_SubRunPOTInEvent.fcl -S genfiles.list -o genfile.root.local -n -1
#lar -c standard_overlay_gen_SubRunPOTInEvent.fcl -S genfiles.list -o genfile_filtered.root.local -n -1

i=1
while [ "$i" -le "$filestouse" ]; do
echo REMOVING kaons_g4_$i.root
rm kaons_g4_$i.root
i=$(($i + 1))
done
