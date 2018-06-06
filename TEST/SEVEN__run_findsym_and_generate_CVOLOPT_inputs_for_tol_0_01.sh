#


source ~/.profile
run='/home/gmallia/CRYSTAL17_cx1/v1/qcry'

ScriptDir=`pwd`

SCANMODE_1_FILES="109.391537 
110.840213 
112.366531
113.896849"

SCANMODE_2_FILES="109.391537 
112.366531 
113.896849   
115.432482"  


# SCANMODE 1
for i in ${SCANMODE_1_FILES}
do
pwd
echo $i

pwd

cd ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_*displacement/Findsym/

rm -Rf ${i}_findsym_numbers_0_01
mkdir ${i}_findsym_numbers_0_01

cp ${i}_findsym_numbers_0_01.cif ./${i}_findsym_numbers_0_01

cd ${i}_findsym_numbers_0_01 
sed -i '/FINDSYM, Version/,/CIF file created by FINDSYM/d' ${i}_findsym_numbers_0_01.cif

cif2cell  ${i}_findsym_numbers_0_01.cif  -p crystal09
mv *.d12 ${i}_findsym_numbers.d12

sed -i '1,6d' ${i}_findsym_numbers.d12

sed  -i "1s/.*/Calcite/" ${i}_findsym_numbers.d12

sed -i 's/\! Ca//g' ${i}_findsym_numbers.d12
sed -i 's/\! O//g' ${i}_findsym_numbers.d12
sed -i 's/\! C//g' ${i}_findsym_numbers.d12
sed -i '$d' ${i}_findsym_numbers.d12

mkdir CVOLOPT_indicating_SG
cp ${i}_findsym_numbers.d12 ./CVOLOPT_indicating_SG
cd CVOLOPT_indicating_SG

WorkingDir=`pwd`

cd $ScriptDir

cp CVOLOPT_fragment  $WorkingDir

cd $WorkingDir

cat ${i}_findsym_numbers.d12  CVOLOPT_fragment > ${i}.d12

cd $ScriptDir
done 

cd $ScriptDir

# SCANMODE 1 Running:
for i in ${SCANMODE_1_FILES}
do 
pwd

cd ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_*displacement/Findsym/${i}_findsym_numbers_0_01/CVOLOPT_indicating_SG

$run  ${i} 64 72:00

sed -i s/select=3:ncpus=24/select=3:ncpus=24/ ${i}.qsub

qsub -q pqnmh ${i}.qsub

pwd  
cd $ScriptDir

done
cd $ScriptDir

# SCANMODE 2
for i in ${SCANMODE_2_FILES}
do
pwd
echo $i

pwd

cd ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4/At_*displacement/Findsym/

rm -Rf ${i}_findsym_numbers_0_01
mkdir ${i}_findsym_numbers_0_01

cp ${i}_findsym_numbers_0_01.cif ./${i}_findsym_numbers_0_01

cd ${i}_findsym_numbers_0_01 
sed -i '/FINDSYM, Version/,/CIF file created by FINDSYM/d' ${i}_findsym_numbers_0_01.cif

cif2cell  ${i}_findsym_numbers_0_01.cif  -p crystal09
mv *.d12 ${i}_findsym_numbers.d12

sed -i '1,6d' ${i}_findsym_numbers.d12

sed  -i "1s/.*/Calcite/" ${i}_findsym_numbers.d12

sed -i 's/\! Ca//g' ${i}_findsym_numbers.d12
sed -i 's/\! O//g' ${i}_findsym_numbers.d12
sed -i 's/\! C//g' ${i}_findsym_numbers.d12
sed -i '$d' ${i}_findsym_numbers.d12

mkdir CVOLOPT_indicating_SG
cp ${i}_findsym_numbers.d12 ./CVOLOPT_indicating_SG
cd CVOLOPT_indicating_SG

WorkingDir=`pwd`

cd $ScriptDir

cp CVOLOPT_fragment  $WorkingDir

cd $WorkingDir

cat ${i}_findsym_numbers.d12  CVOLOPT_fragment > ${i}.d12

cd $ScriptDir
done 

cd $ScriptDir

# SCANMODE 2 Running:
for i in ${SCANMODE_2_FILES}
do 
pwd

cd ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4/At_*displacement/Findsym/${i}_findsym_numbers_0_01/CVOLOPT_indicating_SG

$run  ${i} 64 72:00

sed -i s/select=3:ncpus=24/select=3:ncpus=24/ ${i}.qsub

qsub -q pqnmh ${i}.qsub

pwd  
cd $ScriptDir

done
cd $ScriptDir

