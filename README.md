**BASE** - pronunced  /'baze/ - is a workflow built to ease the inference and interpretation of selection regimes in the context of comparative genomics. 
While the majority of these analyses are restricted to ubiquitous genes - *i.e.* genes which are present in all the species considered - 
BASE allows to integrate non-ubiquitous genes - *i.e.* genes which are not present in all the species considered - in a straightforward and reproducible manner.
Nonetheless, BASE presents many other features, including replicates, gene-trees and species-trees analyses.

BASE has been designed to function in two indipendent steps:

1.   **analyze**		infer & compare a general and alternative models for each gene.

2.   **extract**		retrive metrics of branches and/or clades, allowing a treshold for missing species.

More information on each mode can be accessed by typing ```--analize``` or ```--extract``` followed by ```-h```.

BASE leverages several other pieces of software, most notably [codeml](http://abacus.gene.ucl.ac.uk/software/pamlDOC.pdf). Here is the workflow schematic:

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.001.jpg)

You can find informations on installation and usage following the relative [tutorials](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md).

A preprint for BASE is available [here](https://doi.org/10.1101/2020.11.04.367789).

For troubleshooting or any explanation on BASE functioning and usage write to forni.giobbe@gmail.com.
