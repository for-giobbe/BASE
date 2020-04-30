BASE - pronunced  /'baze/ - is a tool to test Branch And Site Evolution.


This front-end tool has been made to: 

2.   analyze	test which out of two dN/dS models fits best to each ortholog group(s), by parallel processing.
1.   annotate	annotate codeml output(s) to
3.   extract	extract biologically equivalent branch(es), independently from any missing taxa.


More information on each mode usage and options can be accessed by typing ```--analize```, ```--annotate```, ```--extract``` followed by ```-h```.


BASE relies on the following pieces of software:

. Phyutility
. RAxML
. PAML
. R
. getopt
. EMBOSS (transeq)


Each software can be either  placed in the PATH or installed with conda, with the exception of phyutility, whose java executable should be placed shoud be placed in ~/bin/.
A .yaml is available to configure a conda environiment with all the dependencies required by BASE. The correct installation and versions of the requirements can be checked 
using the --requirements option.


For troubleshooting or any explanation on its functioning and usage write to forni.giobbe@gmail.com.
