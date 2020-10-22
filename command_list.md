| `short` | `long` | `description` | `step` | `optional` |        
|---|---|---|---|---|
|-i|--input|path to the input folder containing OGs (aligned oneliner fasta-formatted files with the .fas extension; headers must match with the spp. in the tree)|both|n|
|-t|--tree|tree including all species (without branchlenth and in newick format, with the .nwk extension - species must match whith the fasta header in the OGs)|analyze|n|
|-ma|--model_a|codeml .ctl file of the general model, configured for the analysis (i.e. with the fields seqfile, oufile and treefile left empty)|analyze|n|
|-mb|--model_b|codeml .ctl file of the alternative model, configured for the analysis (i.e. with the fields seqfile, oufile and treefile left empty)|analyze|n|
|-c|--cores|maximum number of cores to be used by the analysis|analyze|n|
|-o|--output|output folder|analyze|n|
|-l|--label|file with the branch(es) / clade(s) labels: the file must contain in each line all the relative species followed by the label (either $ or #)|analyze|y|
|-l2|--label_2|a second file with branch(es) labels, used to test two model 2 versus each other|analyze|y|
|-v|--verbose|verbose mode keeps the temporary folder wich contains all the intermediate files of the analyses|analyze|y|
|-v|--verbose|---|extract|y|
|-r|--replicates|number of replicates to be performed - if not specified it will be set to 1|analyze|y|
|-u|--ubiquitous|analyze only ubiquitous OGs|analyze|y|
|-e|--erase|erase previous output folders with the same name as the specified output|analyze|y|
|-l|--labels|the path to a file containing the branch/clade for which the metrics need to be extracted (each line all the relative species followed by the name).|extract|y|
|-m|--min_spp|min. number of spp. associated to a branch/clade - numbers and proportions allowed. If x is specified, only complete branch(es) / clade(s) are considerd|extract|y|
|-h|--help|help page|both|y|
