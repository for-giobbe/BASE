## install BASE and download the toy dataset

BASE is based on GNU utilities and thus will function just on linux distributions, such as CentOS 8. Moreover, it leverages the following pieces of software:

* RAxML 8.1.21
* PAML 4.3 (codeml)
* R 3.2.2
* getopt 2.23.2
* EMBOSS 6.6.0 (transeq)
* ape 5.4
* phangorn 2.4.0
* ete 3.1.2

Each software can be either placed in the PATH or installed with conda;
a [```.yml```](https://github.com/for-giobbe/BASE/blob/master/BASE_env.yml) is available to configure a conda environiment with all the dependencies required by BASE. 
The enivironiment can be created using ```conda env create -f BASE_env.yml``` and can be recalled with ```conda activate BASE_env```.
The correct installation and versions of the requirements can be checked using the ```--requirements``` option.

---

During the tutorial we are gonna leverage a toy datasets which can be found [here](https://github.com/for-giobbe/BASE/tree/master/example/):

We are going to use some 
[ubiquitous](https://github.com/for-giobbe/BASE/tree/master/example/example/ubiquitous_genes) and 
[non-ubiquitous](https://github.com/for-giobbe/BASE/tree/master/example/_ubiquitous_genes)
single-copy genes: in the first case each gene is present in all the species considered, 
while in the second case each gene is not found in some of the species species.

These kind of data can readily be obtained using tools as [OrthoFinder2](https://github.com/davidemms/OrthoFinder), subsequently retrotranslating and aligning each gene.

BASE relies largely on CodeML and thus a general knowledge of its usage is necessary to use it (here is the [manual](http://abacus.gene.ucl.ac.uk/software/pamlDOC.pdf)).

---

[Back](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md) to the tutorials list.
