**BASE** - pronunced  /'baze/ - is a tool to test **B**ranch **A**nd **S**ite **E**volution.


It has been desinged to function in three indipendent steps: 

1.   **analyze**	compare which out of two dN/dS models fits best to each ortholog group(s), by parallel processing.

2.   **annotate**	reconstruct & reformat the internal edges along with the associated leafs in codeml output(s).

3.   **extract**	find biologically equivalent branch(es), independently from any missing taxa.

The focal poin of BASE is to allow analyses on selection regimes / moleular evolution to integrate ortholog clusters which present missing data (*i.e.* ortholog clusters which do not 
contain the full set of species considered). Consider that much of the litterature on the topic restricts analyses on the subset of genes which are found in all the species considered,
not taking into consideration clusters with missing data. Two approaches are possible, which both can be carried out with BASE:

* the user do not want to allow uncomplete clusters in the group(s) of interest but is willing to integrate the clusters which present missing data for the species which are not part of the group(s) of interest
* the user wants to allow a specific degree of missing data also for the group of interest, which can be applicable when analyzing big and ancient phylogeneies where the orthologs present across all  species are few.

More information on each mode can be accessed by typing ```--analize```, ```--annotate```, ```--extract``` followed by ```-h```.


BASE is substantially a wrapper which leverages the following pieces of software:

* Phyutility
* RAxML
* PAML
* R
* getopt
* EMBOSS (transeq)


Each software can be either placed in the PATH or installed with conda, with the exception of phyutility, which can be installed using ```sudo apt-get install phyutility```.
A [```.yml```](https://github.com/for-giobbe/BASE/blob/master/BASE_env.yml) is available to configure a conda environiment with all the dependencies required by BASE. 
You can create the enivironiment using ```conda env create -f BASE_env.yml``` and it can be then recalled using ```conda activate BASE_env```.
The correct installation and versions of the requirements can be checked using the ```--requirements``` option.

You can test the program on a [toy dataset](https://github.com/for-giobbe/BASE/tree/master/example) and follow the relative [tutorial](https://github.com/for-giobbe/BASE/blob/master/tutorial.md).

For troubleshooting or any explanation on its functioning and usage write to forni.giobbe@gmail.com.
