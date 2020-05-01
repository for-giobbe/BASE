**BASE** - pronunced  /'baze/ - is a tool to test **B**ranch **A**nd **S**ite **E**volution.


This front-end tool has been desinged to: 

1.   analyze		analyze which out of two dN/dS models fits best to each ortholog group(s), by parallel processing.

2.   annotate		annotate internal edges and the relative leafs in codeml output(s).

3.   extract		extract biologically equivalent branch(es), independently from any missing taxa.


More information on each mode can be accessed by typing ```--analize```, ```--annotate```, ```--extract``` followed by ```-h```.


BASE leverages the following pieces of software:

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
