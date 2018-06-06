#

source ~/.profile

run='/home/gmallia/CRYSTAL17_cx1/v1/qcry'

SCANMODE_1_FILES="109.391537 xx
110.840213  xx
112.366531  xx
113.896849  xx
115.432482" xx
118.551116
116.974380
120.133809
121.725312

SCANMODE_2_FILES="109.391537 xx
110.840213  xx
112.366531  xx
113.896849  xx
115.432482  xx
118.551116--
116.974380--
120.133809--
121.725312"

ScriptDir=`pwd`

# SACNMODE 1 :
for i in ${SCANMODE_1_FILES}
do 
pwd
echo $i
cd $i
pwd
cd SCELPHONO_Landau
pwd
cd Freqcalc_Supercell_Landau

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
for i in ${SCANMODE_2_FILES}
do 
pwd
echo $i
cd $i
pwd
cd SCELPHONO_Landau
pwd
cd Freqcalc_Supercell_Landau

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

for i in ${SCANMODE_1_FILES}
do 

cp ${i}_SCANMODE_1.d12  ./$i/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4
cd ./$i/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4

$run ${i}_SCANMODE_1  ${i}  64 10:00 

sed -i s/select=3:ncpus=24/select=3:ncpus=24/ ${i}_SCANMODE_1.qsub

qsub -q pqnmh ${i}_SCANMODE_1.qsub

cd $ScriptDir

done 

# SCANMODE 2 running:
cd $ScriptDir

for i in ${SCANMODE_2_FILES}
do 

cp ${i}_SCANMODE_2.d12  ./$i/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4
cd ./$i/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4

$run ${i}_SCANMODE_2  ${i}  64 10:00 

sed -i s/select=3:ncpus=24/select=3:ncpus=24/ ${i}_SCANMODE_2.qsub

qsub -q pqnmh ${i}_SCANMODE_2.qsub

cd $ScriptDir

done 


