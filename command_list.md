
--analyze command list

| `short` | `long` | `description` | `optional` |        
|---|---|---|---|
|-i|--input|path to the input folder containing OGs (aligned oneliner fasta-formatted files with the .fas extension; headers must match with the spp. in the tree)|n|
|-t|--tree|tree including all species (without branchlenth and in newick format, with the .nwk extension - species must match whith the fasta header in the OGs)|n|
|-ma|--model_a|codeml .ctl file of the general model, configured for the analysis (i.e. with the fields seqfile, oufile and treefile left empty)|n|
|-mb|--model_b|codeml .ctl file of the alternative model, configured for the analysis (i.e. with the fields seqfile, oufile and treefile left empty)|n|
|-c|--cores|maximum number of cores to be used by the analysis|n|
|-o|--output|output folder|n|
|-l|--label|file with the branch(es) / clade(s) labels: the file must contain in each line all the relative species followed by the label (either $ or #)|y|
|-l2|--label_2|a second file with branch(es) labels, used to test two model 2 versus each other|y|
|-r|--replicates|number of replicates to be performed - if not specified it will be set to 1|y|
|-u|--ubiquitous|analyze only ubiquitous OGs|y|
|-e|--erase|erase previous output folders with the same name as the specified output|y|
|-v|--verbose|verbose mode keeps the temporary folder wich contains all the intermediate files of the analyses|y|
|-h|--help|help page|y|


--extract command list

| `short` | `long` | `description` | `optional` |        
|---|---|---|---|
|-i|--input|the path to an input folder containing codeml output(s) (.out extension is required). If no label is specified it will just annotate codeml outputs|n|
|-l|--labels|the path to a file containing the branch/clade for which the metrics need to be extracted (each line all the relative species followed by the name).|y|
|-m|--min_spp|min. number of spp. associated to a branch/clade - numbers and proportions allowed. If x is specified, only complete branch(es) / clade(s) are considerd|y|
|-v|--verbose|verbose mode prints also the tree branch (matching codeml output) and the species associated to the branch|y|
|-h|--help|help page|y|
