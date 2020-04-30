BASE - pronunced  /'baze/ - is a tool to test Branch And Site Evolution.

---

This front-end tool has been made to: 

	a)	analyze		test which out of two dN/dS models fits best to each ortholog group(s), by parallel processing.
	b)	annotate	annotate codeml output(s), including the annotation of internal nodes and the OTUs which are included by each branch. 
	c)	extract		extract target branch(es), retriving biologically equivalent branches, independently from any missing data.

More information on each mode usage and options can be accessed by typing --analize --annotate --extract followed by -h.

---

BASE relies on the following pieces of software:

	Phyutility 2.2.6
	RAxML 8.1.21
	PAML 4.3
	R 3.2.2
	getopt 2.23.2
	EMBOSS 6.6.0 (transeq)

Each software can be either 

	1) placed in the PATH
	2) installed with conda

with the exception of phyutility, whose java executable should be placed shoud be placed in ~/bin/.

A .yaml is available to configure a conda environiment with all the dependencies required by BASE

The correct installation and versions of the requirements can be checked using the --requirements option.

For troubleshooting or any explanation on its functioning and usage write to forni.giobbe@gmail.com.
