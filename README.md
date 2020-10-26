**BASE** - pronunced  /'baze/ - is a workflow built to ease analyses on selection regimes in the comparative genomic context. 
Most notably, it allows to integrate ortholog groups (OGs) of non-ubiquitous genes - *i.e.* OGs which do not 
contain the full set of species considered; the vast majority of genomic analyses on selection restricts analyses on ubiquitous genes OGs - *i.e.* OGs 
which contain all the species considered.

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.001.jpg)

For example, in one possible scenario the user can allow the abesnce of some species only when they are outside to the group of interest:

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.003.jpg)

In onother scenario the user could allow for a treshold of missing species also in the group of interst:

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.004.jpg)

By doing so, the number of genes which can be analyzed for selection regimes can be substantially increased! 

BASE presents many other features
which ease selection analyses in the comparative genomics context, such as the automatic extraction of metrics relative to a branch/clade on the basis
of the relative species. It also seamlessly implements the possibility to carry out replicate analysis, providing more confidence
when large phylogenies of very divergent species are used. The workflow allows to process OGs in batches, so that large numbers of them can be analyzed
at the same time.

BASE has been desinged to function in two indipendent steps:

1.   **analyze**		compare a general and alternative (nested) models for each OG.

2.   **extract**		retrive metrics of branches and/or clades, allowing a treshold for missing species.

More information on each mode can be accessed by typing ```--analize```, ```--extract``` followed by ```-h```.

BASE workflow leverages several other pieces of software, most notably [codeml](http://abacus.gene.ucl.ac.uk/software/pamlDOC.pdf). Here is the workfloe schematic:

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.002.jpg)

You can find informations on installation and usage following the relative [tutorials](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md).

A comprehensive list of commands is present [here](https://github.com/for-giobbe/BASE/blob/master/command_list.md).

For troubleshooting or any explanation on BASE functioning and usage write to forni.giobbe@gmail.com.
