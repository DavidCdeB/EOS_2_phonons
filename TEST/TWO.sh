#
source ~/.profile

run='/home/gmallia/CRYSTAL17_cx1/v1/qcry'

ScriptDir=`pwd`

VOLUMES=" [copy here the volumes you need]
"

cd $ScriptDir
for i in ${VOLUMES}; do 
cd DISPERSI
cd $i 
cd SCELPHONO_Landau
rm -Rf Freqcalc_Supercell_Landau
mkdir Freqcalc_Supercell_Landau
cd $ScriptDir
done
cd $ScriptDir

# RUNNING:
for i in ${VOLUMES}
do
cp ${i}.d12  ./DISPERSI/$i/SCELPHONO_Landau/Freqcalc_Supercell_Landau
cd ./DISPERSI/$i/SCELPHONO_Landau/Freqcalc_Supercell_Landau

$run $i 64 72:00 

sed -i s/select=3:ncpus=24/select=4:ncpus=24/ ${i}.qsub

qsub -q pqnmh ${i}.qsub

cd $ScriptDir

done 
