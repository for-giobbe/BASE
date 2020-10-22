## Installation and download of the toy dataset:

BASE is based on GNU utilities and thus will function just on linux machines. This workflow leverages the following pieces of software:

* RAxML 8.1.21
* PAML 4.3 (codeml)
* R 3.2.2
* getopt 2.23.2
* EMBOSS 6.6.0 (transeq)
* ape 5.4
* phangorn 2.4.0

Each software can be either placed in the PATH or installed with conda;
a [```.yml```](https://github.com/for-giobbe/BASE/blob/master/BASE_env.yml) is available to configure a conda environiment with all the dependencies required by BASE. 
The enivironiment can be created using ```conda env create -f BASE_env.yml``` and can be recalled with ```conda activate BASE_env```.
The correct installation and versions of the requirements can be checked using the ```--requirements``` option.

---

During the tutorial we are gonna leverage a toy datasets which can be found [here](https://github.com/for-giobbe/BASE/tree/master/example/):

We are going to use some 
[ubiquitous](https://github.com/for-giobbe/BASE/tree/master/example/example/_ubiquitous_OGs) and 
[non-ubiquitous](https://github.com/for-giobbe/BASE/tree/master/example/_non-ubiquitous_OGs)
single-copy genes OGs: in the first case each OG is made up by genes present in all the species considered, 
while in the second case a certain number of species is missing in each OG.

These kind of data can readily be obtained using tools as [OrthoFinder2](https://github.com/davidemms/OrthoFinder), subsequently retrotranslating and aligning each OG.

BASE is built around codeml, so that a general knowledge of its usage is necessary to use it (here is the [manual](http://abacus.gene.ucl.ac.uk/software/pamlDOC.pdf)).

---

[Back](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md) to the tutorials list.
