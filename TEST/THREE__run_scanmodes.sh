#

source ~/.profile

run='/home/gmallia/CRYSTAL17_cx1/v1/qcry'

SCANMODE_1_FILES="
[copy here the volumes you need for scanning negative phonon 1]
"

SCANMODE_2_FILES="
[copy here the volumes you need for scanning negative phonon 2]
"

ScriptDir=`pwd`

# SACNMODE 1 :
for i in ${SCANMODE_1_FILES}; do 

cd $i/SCELPHONO_Landau/Freqcalc_Supercell_Landau

rm -Rf  SCANMODE_1
mkdir SCANMODE_1
cd SCANMODE_1
rm -Rf cry14v4*
mkdir cry14v4
cp ../*  ./cry14v4

cd $ScriptDir
done

cd $ScriptDir
# SACNMODE 2 :
for i in ${SCANMODE_2_FILES}; do 

cd $i/SCELPHONO_Landau/Freqcalc_Supercell_Landau

rm -Rf  SCANMODE_2
mkdir SCANMODE_2
cd SCANMODE_2
rm -Rf cry14v4*
mkdir cry14v4
cp ../*  ./cry14v4

cd $ScriptDir
done

# SCANMODE 1 running:
cd $ScriptDir

for i in ${SCANMODE_1_FILES}; do 

cp ${i}_SCANMODE_1.d12  ./$i/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4
cd ./$i/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4

$run ${i}_SCANMODE_1  ${i}  64 72:00 

sed -i s/select=3:ncpus=24/select=4:ncpus=24/ ${i}_SCANMODE_1.qsub

qsub -q pqnmh ${i}_SCANMODE_1.qsub

cd $ScriptDir

done 

# SCANMODE 2 running:
cd $ScriptDir

for i in ${SCANMODE_2_FILES}; do 

cp ${i}_SCANMODE_2.d12  ./$i/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4
cd ./$i/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4

$run ${i}_SCANMODE_2  ${i}  64 72:00 

sed -i s/select=3:ncpus=24/select=4:ncpus=24/ ${i}_SCANMODE_2.qsub

qsub -q pqnmh ${i}_SCANMODE_2.qsub

cd $ScriptDir

done 


