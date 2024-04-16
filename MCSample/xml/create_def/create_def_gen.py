#!/usr/bin/env python
import os

#project="make_kaon_events_numi_fhc_run1_overlay_test_20dec"
project="make_kaon_events_numi_fhc_run1_singlek_overlay_7Jan"
#make_kaon_events_numi_fhc_run1_assok_overlay_deftest2_19dec"
#"make_kaon_events_numi_fhc_run1_assok_overlay_26May2023"
#"make_kaon_events_numi_fhc_run1_singlek_overlay_10May2023"
stage="gen"
stage_name=stage

common="file_type mc and ub_project.version prod_v08_00_00_51 and ub_project.name "
#common="ub_project.name "

#defname    = [  "assok" ]
defname    = [  "singlek" ]
fileformat = [ "artroot" ]


for i in range(len(defname)):
    thisdefname = "taniuchi_" + project+"_"+stage_name+"_"+ defname[i]
    print thisdefname
    cmd1 = "samweb delete-definition " + thisdefname
    os.system(cmd1)
    cmd = "samweb create-definition " + thisdefname
    cmd = cmd + " '" + common + project + " and file_format " +fileformat[i] + " and ub_project.stage " + stage
    #cmd = cmd + "'"
    cmd = cmd + " with availability physical'"
    #cmd = cmd + " with availability anylocation'"
    #cmd = cmd + " with availability virtual'"
    print cmd
    os.system(cmd)
    count_cmd = "samweb count-definition-files " + thisdefname
    os.system(count_cmd)
    #print thisdefname

for i in range(len(defname)):
    thisdefname = "taniuchi_" + project+ "_" +stage_name+"_" + defname[i]
    print thisdefname

print "Done!"
