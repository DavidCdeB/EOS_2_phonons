#
# copy 
# EIGHT__extract_E_and_V_from_cvolopts_run_for_tol_0_1.sh 
# and 
# Extract*.py 
# to the working directory

bash EIGHT__extract_E_and_V_from_cvolopts_run_for_tol_0_1.sh > E_vs_V_Calcite_II.dat

sed -i '1i\#Volume    Energy' E_vs_V_Calcite_II.dat

sort -k1 -n E_vs_V_Calcite_II.dat -o E_vs_V_Calcite_II.dat


