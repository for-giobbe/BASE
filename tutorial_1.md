## Installation and download of the toy dataset:

BASE substantially is a wrapper which leverages the following pieces of software:

* Phyutility
* RAxML
* PAML (codeml)
* R
* getopt
* EMBOSS (transeq)

Each software can be either placed in the PATH or installed with conda, with the exception of phyutility, which can be installed using ```sudo apt-get install phyutility```.
A [```.yml```](https://github.com/for-giobbe/BASE/blob/master/BASE_env.yml) is available to configure a conda environiment with all the dependencies required by BASE. 
You can create the enivironiment using ```conda env create -f BASE_env.yml``` and it can be then recalled using ```conda activate BASE_env```.
The correct installation and versions of the requirements can be checked using the ```--requirements``` option.

---

During the tutorial we are gonna leverage a toy datasets which can be found [here](https://github.com/for-giobbe/BASE/tree/master/example/):

We are going to use some [ubiquitous](https://github.com/for-giobbe/BASE/tree/master/example/example/_complete_OGs) and [non-ubiquitous](https://github.com/for-giobbe/BASE/tree/master/example/_partials_OGs)
OGs: in the first case each OG is made up by single copy genes present in all the tips of our phylogenetic trees, while in the second case
a certain number of tips is missing in some OGs.

These kind of data can readily be obtained using tools as [OrthoFinder2](https://github.com/davidemms/OrthoFinder), subsequently retrotranslating and aligning each OG.

BASE is built around codeml, so that a general knowledge of its usage is necessary to use it (here is the [manual](http://abacus.gene.ucl.ac.uk/software/pamlDOC.pdf)).

---

[Back](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md) to the tutorials list.

