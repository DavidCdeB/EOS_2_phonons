#


source ~/.profile

run='/home/gmallia/CRYSTAL17_cx1/v1/qcry'

ScriptDir=`pwd`

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


SCANMODE_1_FILES="117.743646  
116.184030  
114.632273  
113.087568  
111.593876"

FUNCTIONAL="B3LYP"

SCALING_FOLDER="scaling_volumes_from_117.743646"

# SCANMODE 1
for i in ${SCANMODE_1_FILES}
do

cp  Extract_E_and_V_from_cvolopt_run.py  /work/dcarrasc/pob_TZVP/Calcite_I/${FUNCTIONAL}/SHRINK_8_8__bipolar_18_18__TOLINTEG_8_18__XXLGRID_TOLDEE_8/EOS/0.87_0.98_10/DISPERSI/${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_*displacement/Findsym/${i}_findsym_numbers_0_1/CVOLOPT_indicating_SG
cd /work/dcarrasc/pob_TZVP/Calcite_I/${FUNCTIONAL}/SHRINK_8_8__bipolar_18_18__TOLINTEG_8_18__XXLGRID_TOLDEE_8/EOS/0.87_0.98_10/DISPERSI/${i}/SCELPHONO_Landau/Freqcalc_Supercell_Landau/SCANMODE_1/cry14v4/At_*displacement/Findsym/${i}_findsym_numbers_0_1/CVOLOPT_indicating_SG
python Extract_E_and_V_from_cvolopt_run.py
cd $ScriptDir
done

cd $ScriptDir

# FOLDERS
for i in ${FOLDERS}
do

cp  Extract_E_and_V_from_cvolopt_run.py  /work/dcarrasc/pob_TZVP/Calcite_I/${FUNCTIONAL}/SHRINK_8_8__bipolar_18_18__TOLINTEG_8_18__XXLGRID_TOLDEE_8/EOS/${SCALING_FOLDER}/${i}

cd /work/dcarrasc/pob_TZVP/Calcite_I/${FUNCTIONAL}/SHRINK_8_8__bipolar_18_18__TOLINTEG_8_18__XXLGRID_TOLDEE_8/EOS/${SCALING_FOLDER}/${i}

python Extract_E_and_V_from_cvolopt_run.py

cd $ScriptDir
done 



