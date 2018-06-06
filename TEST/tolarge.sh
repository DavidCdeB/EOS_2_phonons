#

for i in 43266.cx2\
  43267.cx2\
  43268.cx2\
  43269.cx2\
  43270.cx2\
  43271.cx2\
  43272.cx2\
  43273.cx2\
  43274.cx2\
  43275.cx2\
  43276.cx2\
  43277.cx2\
  43278.cx2\
  43279.cx2\
  43280.cx2\
  43281.cx2\
  43282.cx2\
  43283.cx2\
  43284.cx2\
  43285.cx2\
  43286.cx2\
  43287.cx2\
  43288.cx2




do

goto $i

sed -i s/select=18:ncpus=24:mem=120gb/select=6:ncpus=16:mem=62gb/ *.qsub

sed -i s/walltime=03:00:00/walltime=04:00:00/ *.qsub


qsub -q general *.qsub

cd -

done


