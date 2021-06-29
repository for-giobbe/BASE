```--analyze``` command list:

| `short` | `long` | `description` |
|---|---|---|
|-i|--input|path to the input folder containing coding gene alingments in fasta format and with the .fas extension; headers must match with the spp. in the tree)|
|-st|--s_tree|tree including all species (without branchlenth and in newick format, with the .nwk extension - species must match whith the fasta header in the gene alignments)|
|-gt|--g_tree|the gene tree will be inferred and used for the analyses - using the gene tree can cause some clades to be no more present in the phylogeny|
|-mg|--model_g|codeml .ctl file of the general model, configured for the analysis (i.e. with the fields seqfile, oufile, treefile and omega left empty)|
|-ma|--model_a|codeml .ctl file of the alternative model, configured for the analysis (i.e. with the fields seqfile, oufile, treefile and omega left empty)|
|-c|--cores|maximum number of cores to be used by the analysis|
|-o|--output|output folder|
|-l|--label|file with the branch / clade labels: the file must contain in each line all the relative species followed by the label (either $ or #)|
|-l2|--label_2|a second file with branch / clade labels, used to test two model 2 versus each other|
|-r|--replicates|number of replicates to be performed - if not specified it will be set to 1|
|-u|--ubiquitous|analyze only ubiquitous genes|
|-e|--erase|erase previous output folders with the same name as the specified output|
|-v|--verbose|verbose mode keeps the temporary folder wich contains all the intermediate files of the analyses|
|-h|--help|help page|


```--extract``` command list:

| `short` | `long` | `description` |
|---|---|---|
|-i|--input|the path to an input folder containing codeml output(s) (.out extension is required). If no branches/clades of interest are specified it will just annotate codeml outputs|
|-l|--labels|the path to a file containing the branches/clades of interest for which the metrics need to be extracted (each line all the relative species followed by the name).|
|-m|--min_spp|min. number of spp.to be present for branches/clades to be considered - numbers and proportions allowed. If x is specified, only complete branches and clades are considerd|
|-v|--verbose|verbose mode prints also the tree branch (matching codeml output) and the species associated to the branch|
|-h|--help|help page|
