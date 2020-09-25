|List of non-optional arguments:| 																				 |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|	-i	|path to the input folder containing .aln files (aligned oneliner fasta-formatted files, including a minimum of four OTUs) (write ./ to launch the script in the current folder).|
|	-o	|output folder.																					 |
|	-t	|comprensive species tree, including all OTU and without branch length.														 |
|	-ma	|codeml .ctl file of the generaly hypothesis, configured for the analysis (i.e. with the fields seqfile oufile and treefile left empty).					 |
|	-mb	|codeml .ctl file of the alternative hypothesis, configured for the analysis (i.e. with the fields seqfile oufile and treefile left empty).					 |
|	-c	|maximum number of cores to be used by the analysis (max = number of species x number of replicates).										 |

List of optional argument:

	-l	file with the labelled branch(es): the file must contain in each line all the species which form a monophyletic clade which has to be tagged either with $ or # and a number.
	-l2	a second file with the labelled branch(es), used to test two model 2 versus each other.
	-v	verbose mode keeps the temporary folder wich contains all the intermediate files of the analyses, including trees and codeml outputs for both general and alternative models.
	-r	number of replicates to be performed (default is 1).
	-d	allow missing data in the .aln files in respect to the comprensive species tree

