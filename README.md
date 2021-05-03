# 
<!-- Attempt of improved/general code:
~/Trabajo/structures/Explanation_of_Scripts/Eos_2_Phonons/trials_Eos_2_Phonons/trial_calcite_III
-->


# Table of Contents

1. [What is the `EOS_2_phonons` program ?](#example)
2. [Data flow](#example2)
3. [Test](#example3)
4. [How to cite](#example4)
5. [Contributing](#example5)
6. [References](#example6)


<a name="example"></a>
## What is the `EOS_2_phonons` program ?

 `EOS_2_phonons` is a program for computational chemistry and physics that allows to automate the runs for frequency calculations, and breaking symmetry over different volumes.
The programs on this repository allow to obtain the needed outputs in order to further perform a quasi-harmonic approximation analyisis with the [`QHA_2D` program](https://github.com/DavidCdeB/QHA_2D)

The program was developed as part of [David Carrasco de Busturia PhD project](https://www.imperial.ac.uk/people/d.carrasco-de-busturia/) at [Prof. Nicholas Harrison's Computational Materials Science Group](http://www.imperial.ac.uk/computational-materials-science/), Imperial College London. The program was used to investigate the phase diagram and phase transitions mechanisms on the calcium carbonate system.

<a name="example2"></a>
## Data flow

* Get the code: `git clone https://github.com/DavidCdeB/EOS_2_phonons`

* Copy to the folder `EOS_2_phonons` created, the `*.out` output from the `EOS` calulation: 
 
 ```
 EOS
 [Optional sub-keywords]
 END 
 ```

which contains the constant-volume optimization for
several geometries.

* Run the program `Eos_2_Phonons.py`. This will prepare a frequency calculation input for each geometry.
Before running this program, you should edit it and substitute `[supercell expansion matrix here]`, `[basis set here]` and `[functional here]`
by, respectively,
the adequate supercell for the phonon calculation, the proper basis set
and the DFT functional.

* Run `ONE.sh`. This will create the directories corresponding to each volume, and will send the jobs to run.

* At this point, we need to detect negative phonons found at certain volumes.
These can be detected by running the programs inside the repository
[search_neg_freqs](https://github.com/DavidCdeB/search_neg_freqs).
Read the instructions in this repository, so that then you can identify
which volumes contain a imaginary (negative) frequency.
 
* The next step is to distort the atomic coordinates along
the eigenvectors. It is first necessary to bring these phonons back to the Gamma point.
In order words, perform `FREQCALC + SUPERCELL` type of
calculations.
Edit 
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

or additionally by this line, if there is a second negative phonon mode: 

```
    with open(VOLUMES[vol_i] + '_SCANMODE_2.d12', 'w') as f:
```


This will prepare the input files for the `SCANMODE` runs.

* Run `THREE.sh`. This will run the scanmodes.
Provide the list of volumes under the variable `SCANMODE_1_FILES`
or `SCANMODE_2_FILES`.

* Run `FOUR.sh`. This will extract the geometry of the minimum
energy displacement of the scanmode. In addition, it will prepare a "findsym"
input file for CRYSTAL. This will allow you to obtain a `.FINDSYM` file,
ready to be read by the `findsym` program [1].

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

* Run `SIX.sh`. This will run the `cif2cell` program [2] over
each of these `cif` files previously generated. An input file
for a constant volume optimization run will be created for the
most common tolerance used, 0.1.
You would have to change the `CVOLOPT_fragment`, which is the
tail for the input file, specifying the basis set you are using.

* Run `SEVEN.sh`. This will run the constant volume optimization. 

* At this point, if the space group of the broken symmetry structure starts
with `P`, then the primitve cell is equivalent to the crystalographic. In this case,
you should run `EIGHT.sh`.
If the broken symmetry structure contains a crystallographic cell
different from a primitve, you should run `EIGHT.sh` by
changing every instance of `Eos_2_Phonons_when_threre_is_no_crystallographic_cell.py`
by `Eos_2_Phonons.py`.

<p align="center">
  <img src="https://github.com/DavidCdeB/EOS_2_phonons/blob/master/Images_for_README_md/ONE_TWO.svg">
</p>


<a name="example3"></a>
## Test

Under the `TEST` folder, you will find all the programs
needed, together with a `*out` folder
with the frequency output.


<a name="example4"></a>
## How to cite

Please cite the following reference when using this code:

D. Carrasco-Busturia, "The temperature - pressure phase diagram of the calcite I - calcite II
phase transition: A first-principles investigation", Journal of Physics and Chemistry of Solids, vol. 154,
p. 110 045, 2021. D O I: https://doi.org/10.1016/j.jpcs.2021.110045.

<a name="example5"></a>
## Contributing

`QHA` is free software released under the Gnu Public Licence version 3.
All contributions to improve this code are more than welcome.

* Have a look at GitHub's ["How to contribute"](https://guides.github.com/activities/contributing-to-open-source/#contributing).

* If you are familiar with `git`: fork this repository and submit a pull request.

* If you are not familiar with `git`:

    * If something should be improved, open an issue here on GitHub
    * If you think a new feature would be interesting, open an issue
    * If you need a particular feature for your project contact me directly.


<a name="example6"></a>
## References

[1] Stokes, Harold T. and Hatch, Dorian M., Journal of Applied Crystallography 2005, 38, 237-238

[2] Björkman, T., Computer Physics Communications 182, 1183–1186 (2011)

