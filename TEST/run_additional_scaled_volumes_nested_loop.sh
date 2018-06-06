#

source ~/.profile

run='/home/gmallia/CRYSTAL17_cx1/v1/qcry'

DIRS="
B3LYP
PBE-D3
PBE
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

 cd /work/dcarrasc/pob_TZVP/Calcite_I/$i/SHRINK_8_8__bipolar_18_18__TOLINTEG_8_18__XXLGRID_TOLDEE_8/EOS

 rm -Rf scaling_volumes_from_117.743646
 mkdir scaling_volumes_from_117.743646

 cd scaling_volumes_from_117.743646
  
 scaling=`pwd`

 for j in ${FOLDERS}; do
  rm -Rf ${j}
  mkdir ${j}
  cd  $ScriptDir

  cp -avr  ${j}_TOP_FRAGMENT.d12  /work/dcarrasc/pob_TZVP/Calcite_I/$i/SHRINK_8_8__bipolar_18_18__TOLINTEG_8_18__XXLGRID_TOLDEE_8/EOS/scaling_volumes_from_117.743646/${j}

  cp -avr ${i}_BOTTOM_FRAGMENT /work/dcarrasc/pob_TZVP/Calcite_I/$i/SHRINK_8_8__bipolar_18_18__TOLINTEG_8_18__XXLGRID_TOLDEE_8/EOS/scaling_volumes_from_117.743646/${j}

  cd /work/dcarrasc/pob_TZVP/Calcite_I/$i/SHRINK_8_8__bipolar_18_18__TOLINTEG_8_18__XXLGRID_TOLDEE_8/EOS/scaling_volumes_from_117.743646/${j}

  cat ${j}_TOP_FRAGMENT.d12 ${i}_BOTTOM_FRAGMENT > ${j}.d12

  $run ${j}  64 72:00

  sed -i s/select=3:ncpus=24/select=8:ncpus=24/ ${j}.qsub

  qsub -q pqnmh ${j}.qsub

  cd  $scaling

  done

done

