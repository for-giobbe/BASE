**BASE** - pronunced  /'baze/ - is a tool to test **B**ranch **A**nd **S**ite **E**volution.


This front-end tool has been desinged to: 

1.   analyze		analyze which out of two dN/dS models fits best to each ortholog group(s), by parallel processing.

2.   annotate		annotate internal edges and the relative leafs in codeml output(s).

3.   extract		extract biologically equivalent branch(es), independently from any missing taxa.

The first step tests which out of two dN/dS models fits best to each ortholog group(s), by carrying out branchlength optimization on the constrain tree, two alternative codml analyses and a LRT
to decide wether the general or the alternative model fits best to the data. Missing data are allowed, as long as the species tree provided by the user contains
all of the OTUs which may be included in each ortholog group. Subsequently in the second step the internal edges annotation created by codeml, alongside with the
taxa which are downstream of each codeml branch. Finally in the third step dN, dS, omega & t values relative to each branch(es) selected by the ueser can be extracted.
The focal poin of BASE is to carry out analyses on the selection regime also for orthologs alignemnt which present missing data (*i.e.* ortholog clusters which do not contain the full set of
species from the orthology search). Two approaches are possible, which both can be carried out with BASE: (a) the user do not want to allow uncomplete clusters in the group(s) of interest but
is willing to integrate the clusters which present missing data for the species which are not part of the group(s) of interest (b) the user wants to allow a certain degree of missing data
also for the group of interest, which can be applicable when analyzing big phylogeneies where the orthologs present in each species are few.

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

You can test the program on a [toy dataset](https://github.com/for-giobbe/BASE/tree/master/example) and follow the relative [tutorial]().

For troubleshooting or any explanation on its functioning and usage write to forni.giobbe@gmail.com.
