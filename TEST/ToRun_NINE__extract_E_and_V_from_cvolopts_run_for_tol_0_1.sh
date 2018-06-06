#
# copy 
# EIGHT__extract_E_and_V_from_cvolopts_run_for_tol_0_1.sh 
# and 
# Extract*.py 
# to the working directory


bash NINE__extract_E_and_V_from_cvolopts_run_for_tol_0_1.sh > E_vs_V_Calcite_II_including_additional_vols.dat

sed -i '1i\#Volume    Energy' E_vs_V_Calcite_II_including_additional_vols.dat

sort -k1 -n E_vs_V_Calcite_II_including_additional_vols.dat -o E_vs_V_Calcite_II_including_additional_vols.dat


