#

# Check first with these two commands if the files have been generated:
# on ./DISPERSI folder, do:
ls -d ./*/*/*/*/
grep -r --include=*SCANMO*.out "EEEEEEEEEE TERMINATION  DATE" */SC*/Fre*/SC*/cr*/


grep -r "_symmetry_Int"  109*/SCELP*/Freq*/SCANM*1/cry*/At*/Finds*/1*.cif | grep -v "0.cif" > scheme.txt
echo -e "\n" >> scheme.txt
grep -r "_symmetry_Int"  109*/SCELP*/Freq*/SCANM*2/cry*/At*/Finds*/1*.cif | grep -v "0.cif" | sed 's/109.*\/SCELPHONO_Landau\/Freqcalc_Supercell_Landau/                                                     /' >> scheme.txt
echo -e "\n" >> scheme.txt

grep -r "_symmetry_Int"  110*/SCELP*/Freq*/SCANM*1/cry*/At*/Finds*/1*.cif | grep -v "0.cif" >> scheme.txt
echo -e "\n" >> scheme.txt
grep -r "_symmetry_Int"  110*/SCELP*/Freq*/SCANM*2/cry*/At*/Finds*/1*.cif | grep -v "0.cif" | sed 's/110.*\/SCELPHONO_Landau\/Freqcalc_Supercell_Landau/                                                     /' >> scheme.txt
echo -e "\n" >> scheme.txt

grep -r "_symmetry_Int"  112*/SCELP*/Freq*/SCANM*1/cry*/At*/Finds*/1*.cif | grep -v "0.cif" >> scheme.txt
echo -e "\n" >> scheme.txt
grep -r "_symmetry_Int"  112*/SCELP*/Freq*/SCANM*2/cry*/At*/Finds*/1*.cif | grep -v "0.cif" | sed 's/112.*\/SCELPHONO_Landau\/Freqcalc_Supercell_Landau/                                                     /' >> scheme.txt
echo -e "\n" >> scheme.txt

grep -r "_symmetry_Int"  113*/SCELP*/Freq*/SCANM*1/cry*/At*/Finds*/1*.cif | grep -v "0.cif" >> scheme.txt
echo -e "\n" >> scheme.txt
grep -r "_symmetry_Int"  113*/SCELP*/Freq*/SCANM*2/cry*/At*/Finds*/1*.cif | grep -v "0.cif" | sed 's/113.*\/SCELPHONO_Landau\/Freqcalc_Supercell_Landau/                                                     /' >> scheme.txt
echo -e "\n" >> scheme.txt

grep -r "_symmetry_Int"  115*/SCELP*/Freq*/SCANM*1/cry*/At*/Finds*/1*.cif | grep -v "0.cif" >> scheme.txt
echo -e "\n" >> scheme.txt
grep -r "_symmetry_Int"  115*/SCELP*/Freq*/SCANM*2/cry*/At*/Finds*/1*.cif | grep -v "0.cif" | sed 's/115.*\/SCELPHONO_Landau\/Freqcalc_Supercell_Landau/                                                     /' >> scheme.txt
echo -e "\n" >> scheme.txt


grep -r "_symmetry_Int"  118*/SCELP*/Freq*/SCANM*1/cry*/At*/Finds*/1*.cif | grep -v "0.cif" >> scheme.txt
echo -e "\n" >> scheme.txt

grep -r "_symmetry_Int"  116*/SCELP*/Freq*/SCANM*1/cry*/At*/Finds*/1*.cif | grep -v "0.cif" >> scheme.txt
echo -e "\n" >> scheme.txt

grep -r "_symmetry_Int"  120*/SCELP*/Freq*/SCANM*1/cry*/At*/Finds*/1*.cif | grep -v "0.cif" >> scheme.txt
echo -e "\n" >> scheme.txt

grep -r "_symmetry_Int"  121*/SCELP*/Freq*/SCANM*1/cry*/At*/Finds*/1*.cif | grep -v "0.cif" >> scheme.txt
echo -e "\n" >> scheme.txt


