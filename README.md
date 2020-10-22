**BASE** - pronunced  /'baze/ - is a workflow built to allow analyses on selection regimes to integrate ortholog groups (OGs) of non-ubiquitous genes - *i.e.* OGs which do not 
contain the full set of species considered. The vast majority of the litterature on the topic restricts analyses on ubiquitous genes OGs
- *i.e.* OGs which contain all the species considered. BASE workflow leverages several other pieces of software, most notably [codeml](http://abacus.gene.ucl.ac.uk/software/pamlDOC.pdf).

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.001.jpg)

It has been desinged to function in two indipendent steps:

1.   **analyze**	compare which model (out of two) fits best to each OG.

2.   **extract**	retrive metrics of equivalent branches and/or clades, allowing a treshold for missing species.

More information on each mode can be accessed by typing ```--analize```, ```--extract``` followed by ```-h```.

Here is a schematic of BASE workflow.

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.002.jpg)

You can find informations on installation and usage following the relative [tutorials](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md).

A comprehensive list of commands is present [here](https://github.com/for-giobbe/BASE/blob/master/command_list.md).

For troubleshooting or any explanation on BASE functioning and usage write to forni.giobbe@gmail.com.
