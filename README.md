# 
<!-- Attempt of improved/general code:
~/Trabajo/structures/Explanation_of_Scripts/Eos_2_Phonons/trials_Eos_2_Phonons/trial_calcite_III
-->


# Table of Contents

1. [What is the `EOS_2_phonons` program ?](#example)
2. [Data flow](#example2)
3. [Contributing](#example3)


<a name="example"></a>
## What is the `EOS_2_phonons` program ?

 `EOS_2_phonons` is a program for computational chemistry and physics that allows to automate the runs for frequency calculations, and breaking symmetry over different volumes.
This allows to then perform a quasi-harmonic approximation analyisis with the [`QHA_2D` program](https://github.com/DavidCdeB/QHA_2D)

The program was developed as part of [David Carrasco de Busturia PhD project](https://www.imperial.ac.uk/people/d.carrasco-de-busturia/) at [Prof. Nicholas Harrison's Computational Materials Science Group](http://www.imperial.ac.uk/computational-materials-science/), Imperial College London. The program was used to investigate the phase diagram and phase transitions mechanisms on the calcium carbonate system.

<a name="example2"></a>
## Data flow

* The starting point is the `*.out` output from the `EOS` calulation: 
 
 ```
 EOS
 [Optional sub-keywords]
 END 
 ```

which contains the constant-volume optimization for
several geometries.

* The program `Eos_2_Phonons.py`prepares a frequency calculation input for each geometry.
Before running this program, you should edit it and substitute `[supercell expansion matrix here]`, `[basis set here]` and `[functional here]`
by, respectively,
the adequate supercell for the phonon calculation, the proper basis set
and the DFT functional.

* Run `ONE.sh`. This will create the directories corresponding to each volume, and will send the jobs to run.

* Negative phonons found at certain volumes can be detedted 
by the program [search_neg_freqs](https://github.com/DavidCdeB/search_neg_freqs).
 
* For the imaginary phonon modes, in order to distort the atomic coordinates along
the eigenvectors, it is first necessary to bring these phonons back to the Gamma point.
In order words, perform `FREQCALC + SUPERCELL` type of
calculations.
Once detected which volumes contain negative phonon modes, you can edit 
the `Eos_2_Phonons.py` so that it contains the following:

```
SCELPHONO
[supercell expansion matrix here]
FREQCALC
```

* Edit `TWO.sh`, 
providing the list of volumes under the variable `VOLUMES`. This will run the frequency calculation bringing the phonons to Gamma.

* Edit `Eos_2_Phonons.py` so that it contains the following:

```
SUPERCELL
[supercell expansion matrix here]
FREQCALC
RESTART
SCANMODE
1 -10 10 0.4
1
END
END
```
Edit also the name of the files, i.e., change this line:
```
    with open(VOLUMES[vol_i] + '_FREQCALC.d12', 'w') as f:
```

by this line:
```
    with open(VOLUMES[vol_i] + '_SCANMODE_1.d12', 'w') as f:
```

or this line, if there is a second negative phonon mode: 

```
    with open(VOLUMES[vol_i] + '_SCANMODE_2.d12', 'w') as f:
```


This will prepare the input files for the `SCANMODE` runs.

* Run `THREE.sh`. This will run the scanmodes.
Povide the list of volumes under the variable `SCANMODE_1_FILES`
or `SCANMODE_2_FILES`.

* Run `FOUR.sh`. This will extract the geometry of the minimum
energy displacement of the scanmode. In addition, it will prepare a "findsym"
input file for CRYSTAL. This will allow you to obtain a `.FINDSYM` file,
ready to be read by the `findsym` program [].

* Run `FIVE.sh`. This will modify the tolerances of the `.FINDSYM` file,
creating a set of different files corresponding to different tolerances:

```
0_1.FINDSYM -> 0.1 tolerance
0_01.FINDSYM -> 0.01 tolerance
0_001.FINDSYM -> 0.001 tolerance
0_0001.FINDSYM -> 0.0001 tolerance
0_00001.FINDSYM -> 0.00001 tolerance
0_000001.FINDSYM -> 0.000001 tolerance
0.FINDSYM -> 0 tolerance

```
Once done this, the findsym program will run,
and will generate a `cif` file for each tolerance.

* Run `SIX.sh`. This will run the `cif2cell` program over
each of these `cif` files previously generated. An input file
for a constant volume optimization run will be created for the
most common tolerance used, 0.1.
You would have to change the `CVOLOPT_fragment`, which is the
tail for the input file, specifying the basis set you are using.

* Run `SEVEN.sh`. This will run the constant volume optimization. 


