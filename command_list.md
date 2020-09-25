|analyze|---|---|
|---|---|---|
|-i|path to the input folder containing .aln files (aligned oneliner fasta-formatted files, including a minimum of four OTUs) (write ./ to launch the script in the current folder).	| non-optional |
|-o|output folder.																					| non-optional |
|-t|comprensive species tree, including all OTU and without branch length.														| non-optional |
|-ma|codeml .ctl file of the generaly hypothesis, configured for the analysis (i.e. with the fields seqfile oufile and treefile left empty).					 	| non-optional |
|-mb|codeml .ctl file of the alternative hypothesis, configured for the analysis (i.e. with the fields seqfile oufile and treefile left empty).					 	| non-optional |
|-c|maximum number of cores to be used by the analysis (max = number of species x number of replicates).										| non-optional |
|-l|file with the labelled branch(es): the file must contain in each line all the species which form a monophyletic clade which has to be tagged either with $ or # and a number.	| optional |
|-l2|a second file with the labelled branch(es), used to test two model 2 versus each other.												| optional |
|-v|verbose mode keeps the temporary folder wich contains all the intermediate files of the analyses, including trees and codeml outputs for both general and alternative models.	| optional |
|-r|number of replicates to be performed (default is 1).																| optional |
|-d|allow missing data in the .aln files in respect to the comprensive species tree.													| optional |

|non-optional arguments analyze|                                                                                                                                                              	 |
|---|---|
	-i	the path to an input folder containing codeml output(s) (.out extension is required) (write ./ to launch the script in the current folder). 
	-o	the path to an output folder (write ./ to launch the script in the current folder).
