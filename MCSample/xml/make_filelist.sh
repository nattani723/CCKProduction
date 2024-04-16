#!/bin/bash

defname=defname:taniuchi_make_kaon_events_numi_fhc_run1_singlek_overlay_7Jan_gen_singlek

for file in $(samweb list-files -e uboone ${defname})
do
  dir=$(samweb locate-file -e uboone ${file})
  if [[ ${dir} == "dcache:"* ]]; then
    echo ${dir#"dcache:"}/$file >> files.list 
  fi
  if [[ ${dir} == "enstore:"* ]]; then
    dir1=${dir#"enstore:"}
    dir2=${dir1%(*}
    echo ${dir2}/$file >> files.list 
  fi
done
