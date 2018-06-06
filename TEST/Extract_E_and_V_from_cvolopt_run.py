#

import glob
import sys
#VOLUMES = []
filename = glob.glob('*.out')
#print filename
#sys.exit()

with open(filename[0]) as gout:
    final_optimized_geometry = False
    for line in gout:
        if 'OPT END ' in line:
#           print line
            energy = line.split()[7]
#           print energy
        if 'FINAL OPTIMIZED GEOMETRY' in line:
            final_optimized_geometry = True
        elif 'PRIMITIVE CELL - CENTRING CODE' in line:
            if final_optimized_geometry:
                volume = line.split()
#               print volume
#               print volume[7]
                volume = line.split()[7]
#               VOLUMES.append(volume)
  
print  volume , energy
