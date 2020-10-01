**BASE** - pronunced  /'baze/ - is a tool to test **B**ranch **A**nd **S**ite **E**volution, 
mainly built around [codeml](http://abacus.gene.ucl.ac.uk/software/pamlDOC.pdf).
Moreover BASE implements additional features, such as the possibilty to carry out replicate analyses.


The focal poin of BASE is to allow analyses on selection regimes to integrate ortholog groups (OGs from now on) of non-ubiquitous genes (*i.e.* OGs which do not 
contain the full set of species considered). The vast majority of the litterature on the topic restricts analyses on ubiquitous genes 
(*i.e.* OGs which contain all the species considered).

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.001.jpeg)

When analyzing large phylogenies of very divergent clades, the orthologs present across all species are most likely very few.
Different approaches are possible to implement a higher number of genes in the analyses, which can be carried out with BASE:

* the user do not want to considered OGs made up of non-ubiquitous genes relatively to the group(s) of interest, 
but is willing to implement OGs which contain non- ubiquitous in genes in the species which are not part of the group(s) of interest.

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.002.jpeg)

* the user wants to implement OGs which are made up of non-ubiquitous genes in respect to to the group(s) of interest (_via_ a specific treshold).

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.003.jpeg)

It has been desinged to function in three indipendent steps:

1.   **analyze**        compare which model (out of two) fits best to each OG, by parallel processing.

2.   **annotate**	reformat the internal nodes annotation along with the associated tips in codeml output(s).

3.   **extract**        retrive metrics of equivalent branch(es), allowing a treshold for missing tips.

More information on each mode can be accessed by typing ```--analize```, ```--annotate```, ```--extract``` followed by ```-h```.

Here is a schematic of BASE steps and functioning.

![Image description](https://github.com/for-giobbe/BASE/blob/master/figures/BASE_fig.004.jpeg)

You can find informations on installation and usge following the relative [tutorial](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md).

A comprehensive list of commands is present [here](https://github.com/for-giobbe/BASE/blob/master/command_list.md).

For troubleshooting or any explanation on BASE functioning and usage write to forni.giobbe@gmail.com.
