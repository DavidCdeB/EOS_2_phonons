#
source ~/.profile

run='/home/gmallia/CRYSTAL17_cx1/v1/qcry'

ScriptDir=`pwd`

VOLUMES="109.391537
110.840213
112.366531
113.896849
115.432482
118.551116
116.974380
120.133809
121.725312
123.325636
125.845303"

cd $ScriptDir
for i in ${VOLUMES}

do 
pwd
echo $i
cd DISPERSI
cd $i 
pwd
cd SCELPHONO_Landau
rm -Rf Freqcalc_Supercell_Landau
mkdir Freqcalc_Supercell_Landau
cd $ScriptDir
pwd
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
