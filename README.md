**BASE** - pronunced  /'baze/ - is a tool to test **B**ranch **A**nd **S**ite **E**volution, which is built around [codeml](http://abacus.gene.ucl.ac.uk/software/pamlDOC.pdf).



The focal poin of BASE is to allow analyses on selection regimes to integrate ortholog groups (OGs from now on) of non-ubiquitous genes (*i.e.* OGs which do not 
contain the full set of species considered). The vast majority of the litterature on the topic restricts analyses on ubiquitous genes 
(*i.e.* OGs which contain all the species considered).

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.001.jpeg)

Two approaches are possible, which both can be carried out with BASE:

* the user do not want to allow uncomplete clusters in the group(s) of interest but is willing to integrate the clusters which present missing data for the species which are not part of the group(s) of interest

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.002.jpeg)

* the user wants to allow a specific degree of missing data also for the group of interest, which can be applicable when analyzing big and ancient phylogenies where the orthologs present across all  species are few.

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.003.jpeg)

It has been desinged to function in three indipendent steps:

1.   **analyze**        compare which model (out of two) fits best to each ortholog group(s), by parallel processing.

2.   **annotate**	reformat the internal nodes annotation along with the associated tips in codeml output(s).

3.   **extract**        retrive metrics of equivalent branch(es), allowing a treshold for missing tips.

More information on each mode can be accessed by typing ```--analize```, ```--annotate```, ```--extract``` followed by ```-h```.

Here is a schematic of BASE steps and functioning.

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.004.jpeg)

You can find informations on installation and usge following the relative [tutorial](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md).

A comprehensive list of commands is present [here](https://github.com/for-giobbe/BASE/blob/master/command_list.md).

For troubleshooting or any explanation on BASE functioning and usage write to forni.giobbe@gmail.com.
