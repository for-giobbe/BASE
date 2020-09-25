## Installation and download of the toy dataset:

BASE substantially consists in a wrapper which leverages the following pieces of software:

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

During the tutorial we are gonna leverage two toy datasets:

- the [first](https://github.com/for-giobbe/BASE/tree/master/example/example_data/complete_OGs) includes OGs of (single-copy) genens which are ubiquitous 
to the species considered,

- the [second](https://github.com/for-giobbe/BASE/tree/master/example/example_data/partials_OGs) consists of (single-copy) "incomplete" OGs 
where some species are missing.

All the other input files can be found [here](https://github.com/for-giobbe/BASE/tree/master/example/).

