#


source ~/.profile

run='/home/gmallia/CRYSTAL17_cx1/v1/qcry'

ScriptDir=`pwd`

SCANMODE_1_FILES="113.896849 
115.432482 
118.551116 
116.974380 
120.133809 
121.725312"

SCANMODE_2_FILES="109.391537
110.840213
112.366531"


# SCANMODE 1
for i in ${SCANMODE_1_FILES}
do

cp  Extract_E_and_V_from_cvolopt_run.py  ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_*displacement/Findsym/${i}_findsym_numbers_0_1/CVOLOPT_indicating_SG
cd ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_*displacement/Findsym/${i}_findsym_numbers_0_1/CVOLOPT_indicating_SG
python Extract_E_and_V_from_cvolopt_run.py
cd $ScriptDir
done 

cd $ScriptDir


# SCANMODE 2
for i in ${SCANMODE_2_FILES}
do

cp  Extract_E_and_V_from_cvolopt_run.py  ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4/At_*displacement/Findsym/${i}_findsym_numbers_0_1/CVOLOPT_indicating_SG
cd ./${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_2/cry14v4/At_*displacement/Findsym/${i}_findsym_numbers_0_1/CVOLOPT_indicating_SG
python Extract_E_and_V_from_cvolopt_run.py
cd $ScriptDir
done

cd $ScriptDir

