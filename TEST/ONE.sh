#
source ~/.profile

run='/home/gmallia/CRYSTAL17_cx1/v1/qcry'

ScriptDir=`pwd`

#ARRAY=()
#for i in `ls *_FREQCALC.d12`; do 
#echo $i 
#j=`echo $i | cut -f 1 -d '_'`
#echo $j
#ARRAY+=($j)
#echo ^^^^ $ARRAY
#done

#echo 'fine'
#echo $ARRAY

#exit

rm -Rf DISPERSI
mkdir DISPERSI

VOLUMES=" [copy here the volumes you need]
"

cd $ScriptDir
for i in ${VOLUMES}; do 

cd DISPERSI
rm -Rf $i
mkdir $i

cd $i 
rm -Rf SCELPHONO_Landau
mkdir SCELPHONO_Landau
cd SCELPHONO_Landau
cd $ScriptDir
done

cd $ScriptDir

# RUNNING:
for i in ${VOLUMES}; do
cp ${i}.d12  ./DISPERSI/$i/SCELPHONO_Landau
cd ./DISPERSI/$i/SCELPHONO_Landau

$run $i 64 72:00 

sed -i s/select=3:ncpus=24/select=4:ncpus=24/ ${i}.qsub

qsub -q pqnmh ${i}.qsub

cd $ScriptDir

done 
