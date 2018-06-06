#

DIRS="
PBE-D3
PBE
B3LYP
B3LYP-D3
PBE0
PBE0-DC
LDA
"

FOLDERS="
237.467646
239.554134
241.581529
243.644688
245.699603
247.812353
249.921810
252.050453
254.186305
235.473555
"

ScriptDir=`pwd`

for i in ${DIRS}; do

 cd /work/dcarrasc/pob_TZVP/Calcite_I/$i/SHRINK_8_8__bipolar_18_18__TOLINTEG_8_18__XXLGRID_TOLDEE_8/EOS/scaling_volumes_from_117.743646

 scaling=`pwd`

 for j in ${FOLDERS}; do
  cd  $ScriptDir

  cd /work/dcarrasc/pob_TZVP/Calcite_I/$i/SHRINK_8_8__bipolar_18_18__TOLINTEG_8_18__XXLGRID_TOLDEE_8/EOS/scaling_volumes_from_117.743646/${j}
  pwd
  grep "OPT EN" *.out

  cd  $scaling

  done

done


