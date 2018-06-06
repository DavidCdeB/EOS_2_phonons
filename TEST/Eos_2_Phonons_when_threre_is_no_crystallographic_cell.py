#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import os
import glob
import commands

#global N_atom_irreducible_unit
#N_atom_irreducible_unit = 5

path='./'
filename = os.path.join(path, '*.out')
#filename = glob.glob(name)
for fname in glob.glob(filename):
  print fname

CRYSTAL_word = "CRYSTAL$"
Title_CRYSTAL_IFLAGs  = (commands.getstatusoutput("grep -C 1 '%s' %s"%(CRYSTAL_word, filename)))[1]
Space_Group = (commands.getstatusoutput("cat %s | grep '%s' -A2 | tail -n 1" %(filename, CRYSTAL_word)))[1]

print 'Title_CRYSTAL_IFLAGs = ', Title_CRYSTAL_IFLAGs
print 'Space_Group  = ', Space_Group
N_atom_irreducible_unit = (commands.getstatusoutput("cat %s | grep '%s' -A4 | tail -n 1" %(filename, CRYSTAL_word)))[1]
print 'N_atom_irreducible_unit = ', N_atom_irreducible_unit

VOLUMES = []
P0 = []
P1 = []
P2 = []
P4 = []
ATOMIC_NUMBERS = []
Xs = []
Ys = []
Zs = []

with open(filename[0]) as gout:
    final_optimized_geometry = False
    for line in gout:
        if 'FINAL OPTIMIZED GEOMETRY' in line:
            final_optimized_geometry = True
        elif 'PRIMITIVE CELL - CENTRING CODE' in line:
            if final_optimized_geometry:
                volume = line.split()
                print volume
                print volume[7]
                volume = line.split()[7]
                VOLUMES.append(volume)

#        elif ' CRYSTALLOGRAPHIC CELL (V' in line:
#           if final_optimized_geometry:
                print 'gout.next() =', gout.next()
                done = gout.next()
                print 'done =', done
                p0 = done.split()[0]
                p1 = done.split()[1]
                p2 = done.split()[2]
                p4 = done.split()[4]

                P0.append(p0)
                P1.append(p1)
                P2.append(p2)
                P4.append(p4)

#       elif 'COORDINATES IN THE CRYSTALLOGRAPHIC CELL' in line:
#           if final_optimized_geometry:
                gout.next()
                gout.next()
                gout.next()
                gout.next()
                while True:
                    line = gout.next()
                    print 'line = ', line 
                    atomdata = line.split()
                    if not atomdata:
                        break
                    if atomdata[1] != 'T':
                        continue
                    atomicnumber = atomdata[2]
                    x, y, z = atomdata[4:7]
                    ATOMIC_NUMBERS.append(atomicnumber)
                    Xs.append(x)
                    Ys.append(y)
                    Zs.append(z)
                final_optimized_geometry = False



print 'VOLUMES = ', VOLUMES
print 'P0 = ', P0
print 'P2 = ', P2
print 'Xs = ', Xs
print 'Ys = ', Ys
print 'Zs = ', Zs
print 'ATOMIC_NUMBERS = ', ATOMIC_NUMBERS


headers = list(zip(P0, P1, P2, P4))
print 'headers = ', headers

rows = [row for row in zip(ATOMIC_NUMBERS, Xs, Ys, Zs)]
print 'rows = ', rows

interval = int(len(rows) / len(VOLUMES))
print 'len(rows) = ', len(rows)
print 'len(VOLUMES) = ', len(VOLUMES)
print 'interval = ', interval

for block_i in range(0, len(rows), interval):
 print block_i

for vol_i in range(len(VOLUMES)):
 print vol_i

for block_i, vol_i in zip(range(0, len(rows), interval), range(len(VOLUMES))):

    # Create the lines for the file:
    lines = ['   '.join(headers[vol_i]), str(N_atom_irreducible_unit)]
    lines += ['   '.join(row) for row in rows[block_i : block_i + interval]]

    # Write the file:
    with open(VOLUMES[vol_i] + '_FREQCALC.d12', 'w') as f:

        # Preceding lines:
#       f.write("""Calcite
#CRYSTAL
#0 0 0
#[enter the Space Group number here]\n""")

        # Preceding lines:
        f.write(Title_CRYSTAL_IFLAGs + '\n' + Space_Group + '\n')

        # Lines of data:
        for line in lines:
            f.write(line + '\n')

        # Trailing lines:
        f.write("""FREQCALC
TEMPERAT
100 10 2000
END
END\n""")

