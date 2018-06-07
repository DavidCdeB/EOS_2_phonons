#


source ~/.profile

run='/home/gmallia/CRYSTAL17_cx1/v1/qcry'

ScriptDir=`pwd`

SCANMODE_1_FILES="
[copy here the volumes you need for scanning negative phonon 1]
"

SCANMODE_2_FILES="
[copy here the volumes you need for scanning negative phonon 2]
"

# SCANMODE 1
for i in ${SCANMODE_1_FILES}; do

cd ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4

MinEdisplace=`awk '/SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS/{flag=1;next}/TTTTTTTTTTTTTTTTTTTTTTTTTTTTTT SCANMODE/{flag=0}flag' ${i}_SCANMODE_1.out   | grep  "^            "  | sort -k2 -n | awk 'NR==1{print $1}'`

echo $MinEdisplace

rm -Rf At_*displacement
mkdir  At_${MinEdisplace}_displacement

cp ./${i}_SCANMODE_1.scans/*DISP_${MinEdisplace} ./At_${MinEdisplace}_displacement
cd ./At_${MinEdisplace}_displacement
cp *DISP_${MinEdisplace} ${i}.gui

cd $ScriptDir
done 

cd $ScriptDir
# SCANMODE 1 Running:
for i in ${SCANMODE_1_FILES}
do 
pwd

cp FINDSYM_key_in_CRYSTAL.d12 ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_*displacement

cd ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_*displacement

cp FINDSYM_key_in_CRYSTAL.d12 ${i}.d12

$run ${i} 64 01:00

sed -i s/select=3:ncpus=24/select=1:ncpus=24/ ${i}.qsub

qsub -q pqnmh ${i}.qsub

pwd
cd $ScriptDir

done

cd $ScriptDir

# SACNMODE 2:
for i in ${SCANMODE_2_FILES}; do

cd ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4

MinEdisplace=`awk '/SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS/{flag=1;next}/TTTTTTTTTTTTTTTTTTTTTTTTTTTTTT SCANMODE/{flag=0}flag' ${i}_SCANMODE_2.out   | grep  "^            "  | sort -k2 -n | awk 'NR==1{print $1}'`

echo $MinEdisplace

rm -Rf At_*displacement
mkdir  At_${MinEdisplace}_displacement

cp ./${i}_SCANMODE_2.scans/*DISP_${MinEdisplace} ./At_${MinEdisplace}_displacement
cd ./At_${MinEdisplace}_displacement
cp *DISP_${MinEdisplace} ${i}.gui

cd $ScriptDir
done 

cd $ScriptDir

# SCANMODE 2 Running:
for i in ${SCANMODE_2_FILES}; do 

cp FINDSYM_key_in_CRYSTAL.d12 ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4/At_*displacement

cd ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4/At_*displacement

cp FINDSYM_key_in_CRYSTAL.d12 ${i}.d12

$run ${i} 64 01:00

sed -i s/select=3:ncpus=24/select=1:ncpus=24/ ${i}.qsub

qsub -q pqnmh ${i}.qsub

pwd
cd $ScriptDir

done

cd $ScriptDir

