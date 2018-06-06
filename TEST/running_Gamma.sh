#

source ~/.profile

run='/home/gmallia/CRYSTAL17_cx1/v1/qcry'

ScriptDir=`pwd`

DIRS="
121.491735/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_-0.8000_displacement/Findsym/121.491735_findsym_numbers_0_1/CVOLOPT_indicating_SG
119.881407/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_-1.6000_displacement/Findsym/119.881407_findsym_numbers_0_1/CVOLOPT_indicating_SG
118.293364/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_-2.4000_displacement/Findsym/118.293364_findsym_numbers_0_1/CVOLOPT_indicating_SG
116.724991/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_3.2000_displacement/Findsym/116.724991_findsym_numbers_0_1/CVOLOPT_indicating_SG
115.163979/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_-4.0000_displacement/Findsym/115.163979_findsym_numbers_0_1/CVOLOPT_indicating_SG
113.609038/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_4.4000_displacement/Findsym/113.609038_findsym_numbers_0_1/CVOLOPT_indicating_SG
112.114272/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4/At_-5.2000_displacement/Findsym/112.114272_findsym_numbers_0_1/CVOLOPT_indicating_SG
"

for i in ${DIRS}; do

cd $i

rm -Rf FREQCALC
mkdir FREQCALC 

cd $ScriptDir

cp  Eos_2_Phonons_when_threre_is_no_crystallographic_cell.py final_part.txt ./$i/FREQCALC

cd $i/FREQCALC

cp ../*.out .
python Eos_2_Phonons_when_threre_is_no_crystallographic_cell.py 

INPUT=`basename  *FREQCALC.d12 .d12`
cat *FREQCALC.d12 final_part.txt > ${INPUT}_Gamma.d12

INPUT_RUN=`basename  *Gamma.d12 .d12`

$run $INPUT_RUN 96 72:00 

qsub -q pqnmh *.qsub

cd $ScriptDir

done
