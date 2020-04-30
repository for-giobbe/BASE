#!/bin/bash
shopt -s expand_aliases
#alias phyutility="java -jar phyutility.jar"

for arg in "$@"; do

   shift

   case "$arg" in

     "--requirements") set -- "$@" "-g" ;;
     "--analyze") set -- "$@" "-x" ;;
     "--annotate") set -- "$@" "-z" ;;
     "--extract") set -- "$@" "-j" ;;
     "-ma")   set -- "$@" "-a" ;;
     "-mb")   set -- "$@" "-b" ;;
     "-l2")   set -- "$@" "-e" ;;
     *)       set -- "$@" "$arg"

esac

done

while getopts ":xgzji:o:t:a:b:c:e:l:vr:dn:h" o; do

    case "${o}" in

i) input_folder=${OPTARG}
;;

o) output_folder=${OPTARG}
;;

t) species_tree=${OPTARG}
;;

a) codeml_template_1=${OPTARG}
;;

b) codeml_template_2=${OPTARG}
;;

c) n_threads=${OPTARG}
;;

v) verbose=1
;;

r) rep=${OPTARG}
;;

n) min_otu=${OPTARG}
;;

d) missing_data=1
;;

g) g=1
;;

x) x=1
;;

z) z=1
;;

j) j=1
;;

l) labels=${OPTARG}
;;

e) labels2=${OPTARG}
;;

################################################################################################################################################################################################################### ANALYZE! HELP

h)  if [ "$x" == 1 ]

then echo "
This mode tests which out of two dN/dS models fits best to each ortholog group(s), by carrying out branchlength optimization, two alternative codml analyses and a LRT
to decide wether the general or the alternative model fits best to the data. Missing data are allowed, as long as the species tree provided by the user contains
all of the OTUs which may be included in each ortholog group.

List of non-optional arguments:

	-i	path to the input folder containing .aln files (aligned oneliner fasta-formatted files, including a minimum of four OTUs) (write ./ to launch the script in the current folder).
	-o	output folder.
	-t	comprensive species tree, including all OTU and without branch length.
	-ma	codeml .ctl file of the generaly hypothesis, configured for the analysis (i.e. with the fields seqfile oufile and treefile left empty).
	-mb	codeml .ctl file of the alternative hypothesis, configured for the analysis (i.e. with the fields seqfile oufile and treefile left empty).
	-c	maximum number of cores to be used by the analysis (max = number of species x number of replicates).

List of optional argument:

	-l	file with the labelled branch(es): the file must contain in each line all the species which form a monophyletic clade which has to be tagged either with $ or # and a number.
	-l2	a second file with the labelled branch(es), used to test two model 2 versus each other.
	-v	verbose mode keeps the temporary folder wich contains all the intermediate files of the analyses, including trees and codeml outputs for both general and alternative models.
	-r	number of replicates to be performed (default is 1).
	-d	allow missing data in the .aln files in respect to the comprensive species tree

Several kind of ananlyeses can be carried out, with the general model specified with the flag -ma and the alternative model specified with the flag -mb. Here are some examples:

	a)	model 0 vs model 1 	---> 	model 0 and model 1 have to be specified in the codeml .ctl files.
	b)	model 0 vs model 2 	---> 	model 0 and model 2 have to be specified in the codeml .ctl files, along with one file containing the branch labels.
	c)	model 2 vs model 2 	---> 	model 2 and model 2 have to be specified in the codeml .ctl files, along with two file containing the branch labels.
	d)	NSsites X vs NSsites Y 	---> 	model 0 and two codeml NSsites models have to be specified in the codeml .ctl files.

Along these modifications of the .ctl file, all the other parameters of the codeml analyisis can be modified.
"

################################################################################################################################################################################################################### ANNOTATE HELP

elif [ "$z" == 1 ] ;
then echo "
This mode analyses codeml output(s) to reconstruct:

	a)	the nodes annotation created by codeml.
	b)	the OTUs which are downstream of each codeml branch.

This step is required to carry out the extraction of dN/dS & t values for target branches. 

List of non-optional arguments:

	-i	the path to an input folder containing codeml output(s) (.out extension is required) (write ./ to launch the script in the current folder). 
	-o	the path to an output folder (write ./ to launch the script in the current folder).

List of optional arguments:

	-h	this help page.
"

################################################################################################################################################################################################################### EXTRACT! HELP

elif [ "$j" == 1 ] ;
then echo "
This mode extracts omega and t values relative to each tagged branch(es).

List of non-optional arguments:

	-i	the path to an input folder containing codeml output(s) (.out extension is required) and codeml annotation(s) produced by BASE (.result extension is required).
	-l	the path to a file containing the branch for which the values need to be extracted (formatted as the branch ).
	-n	minimum number of OTUs to be considered for each group, both absolute and relative values can be specified (7 means at least seven OTUs, while 0.8 means at least 80% of the clade components).  

List of optional argument:

	-v	prins also the branch and the species found.
	-h	this help page.
"



################################################################################################################################################################################################################### MAIN HELP

else echo "
BASE - pronunced  /'baze/ - is a tool to test Branch And Site Evolution.

This front-end tool has been made to: 

	a)	analyze		test which out of two dN/dS models fits best to each ortholog group(s), by parallel processing.
	b)	annotate	annotate codeml output(s), including the annotation of internal nodes and the OTUs which are included by each branch. 
	c)	extract		extract target branch(es), retriving biologically equivalent branches, independently from any missing data.

More information on each mode usage and options can be accessed by typing "--analize" "--annotate" "--extract" followed by "-h".

BASE relies on the following softwares:

	Phyutility 2.2.6
	RAxML 8.1.21
	PAML 4.3
	R 3.2.2
	getopt 2.23.2
	EMBOSS 6.6.0 (transeq)

Each software can be either 

	1)	placed in the PATH
	2)	installed with conda

with the exception of phyutility, whose java executable should be placed shoud be placed in ~/bin/.

The correct installation and versions of the requirements can be checked using the --requirements option.

For troubleshooting or any explanation on its functioning and usage write to forni.giobbe@gmail.com.
" 



################################################################################################################################################################################################################### END OF HELP

fi
              exit

################################################################################################################################################################################################################### ALERTS FOR MISSING OF MISSPECIFIED VARIABLES

           ;;

       \?) echo "WARNING! -$OPTARG isn't a valid option"

           exit

          ;;

       :) echo "WARNING! missing -$OPTARG value"

          exit

          ;;

       esac

 done

################################################################################################################################################################################################################### ALERTS FOR MISSING OF MISSPECIFIED VARIABLES


if [ "$g" == 1 ] ;

then
echo -e "List of requirements:"
phyutility > phyutility.tmp.chk 2>&1 ; if grep -q "fyoo" phyutility.tmp.chk ; then echo -e "Phyutility was found!"; rm phyutility.log &>/dev/null; else echo -e "Phyutility not found"; fi
raxmlHPC-PTHREADS -v > raxml.tmp.chk 2>&1 ; if grep -q "This is RAxML version" raxml.tmp.chk ; then echo -e "RAxML was found!";  else echo -e "RAxML not found"; fi
Rscript > rscript.tmp.chk 2>&1 ; if grep -q "Rscript" rscript.tmp.chk ; then echo -e "Rscript 3.2.2 was found!";  else echo -e "Rscript 3.2.2 not found"; fi
codeml . > codeml.tmp.chk 2>&1 ; if grep -q "Error: file name empty" codeml.tmp.chk ; then echo -e "codeml was found!"; rm rst* rub &>/dev/null;  else echo -e "codeml not found"; fi
transeq -h > transeq.tmp.chk 2>&1 ; if grep -q "Translate nucleic acid sequences" transeq.tmp.chk ; then echo -e "transeq was found!";  else echo -e "transeq not found"; fi
rm *.tmp.chk
exit
fi

################################################################################################################################################################################################################### ALERTS FOR MISSING OF MISSPECIFIED VARIABLES

if [ "$x" == 1 ]; then

 

 if [ -z "$input_folder" ] || [ -z "$output_folder" ] || [ -z "$species_tree" ] || [ -z "$codeml_template_1" ] ||  [ -z "$codeml_template_2" ] || [ -z "$n_threads" ]

 then

 echo -e " \n WARNING! non-optional argument/s is missing \n "

 exit

 fi



if [[ -z "$rep" ]];

then rep=1;



fi



elif [ "$z" == 1 ]; then

 

 if [ -z "$input_folder" ] || [ -z "$output_folder" ]

                then

                echo -e " \n WARNING! non-optional argument/s is missing \n "

                exit

                fi



 if [ -e "$output_folder" ]; then echo " WARNING! the output folder is allready present"; exit; fi



       elif [ "$j" == 1 ]; then



 if [ -z "$labels" ]; then echo "WARNING! label file is missing"; exit; fi



fi



################################################################################################################################################################################ ANALYZE!

if [ "$x"  == 1 ]

then

if [[ -z "$rep" ]] ;then rep=1 ;fi

#########################################################################################  inputs specification

if [[ -d $output_folder ]] ; then echo -e " \n WARNING! an output folder with the same name you specified is allready present. \n "; exit; fi

if [[ -d $output_folder".tmp.full.out" ]] ; then echo -e " \n WARNING! a temporary folder with the same name you specified is allready present. \n "; exit ; fi

if [[ $(ls -l $input_folder/*aln | wc -l) -eq 0 ]]; then echo -e " \n WARNING! no .aln file(s) (one liner fasta-formatted alignment files) is present in the input folder. \n "; exit; fi

for i in $input_folder/*aln; do a=$(cat $i | head -2); if ( echo $a | grep -v ">") ; then echo -e " \n WARNING! something is wrong with the .aln file(s) (they should be one liner fasta-formatted alignment files, but you may have used phylip-formatted files). \n "; exit; fi; done

if grep -q ":[0-9]" $species_tree; then echo -e " \n WARNING! it seems your species tree contains branch length values, you should remove them before the analysis. \n "; exit; fi

if [[ $n_threads -gt $(( $(ls -l $input_folder/*aln | wc -l) * $rep )) ]]; then echo -e " \n WARNING! a number of cores smaller than the number of genes to be analyzed multiplied by the number of replicates have to be specified \n "; exit; fi

mkdir $output_folder

mkdir $output_folder".tmp.full.out"

cp -r $input_folder/*.aln $output_folder".tmp.full.out"

cp $species_tree $output_folder".tmp.full.out"/species_tree

cd $output_folder".tmp.full.out"

original_path=$(pwd)

for i in *.aln; do awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $i > $i.ol; mv $i.ol $i; done

T_raxml=$((n_threads + 1))

echo -e "\n  analysis started on $(date)"

######################################################################################### analysis specification

tot_genes=$( ls *.aln | wc -l | awk '{print $1}')

sed 's/,/\n/g' species_tree | sed 's/(//g' |  sed 's/)//g' | sed 's/;//g' >> sp.lst

for i in *aln; do grep ">" $i | tr -d ">"; done | sort -u > aln_sp.lst

sp_mismatch_more_aln=$(cat aln_sp.lst | grep -Fvf sp.lst); if [[ -n $sp_mismatch_more_aln ]];  then echo -e " \n  WARNING! some species which are included in the alignments are not present in the species tree. \n "; exit; fi

sp_mismatch_more_tre=$(cat sp.lst | grep -Fvf aln_sp.lst); if [[ -n $sp_mismatch_more_tre ]];  then echo -e " \n  WARNING! some species which are included in the alignments are not present in the species tree. \n "; exit; fi

        export g_m=$(grep model ../$codeml_template_1 | awk {'print $3'})

	export a_m=$(grep model ../$codeml_template_2 | awk {'print $3'})

        export ns_g=$(grep NSsites ../$codeml_template_1 | awk {'print $3'})

        export ns_a=$(grep NSsites ../$codeml_template_2 | awk {'print $3'})

if [ $a_m == 2 ] && [ -z "$labels" ]; then printf "\n %s \n " " WARNING! branch labels are required to test model 2 vs 0 but not specified \n"; exit; fi

if [ "$a_m" != 2 ] && [ ! -z "$labels" ]; then printf "\n %s \n " " WARNING! you specified branch labels for a model which do not require them " " "; exit; fi

echo -e "\n  analyizing $rep replicate(s) of $tot_genes genes: model $g_m VS $a_m & NSsites $ns_g VS $ns_a \n";

######################################################################################### analysis specification

# if [ -z "$labels" ] && [ "$a_m" != 2 ]

ls *.aln > tmp.lst

aln_tot=$(wc -l tmp.lst | awk '{print $1}')

gen_code=$(grep icode  ../$codeml_template_1 | awk '{print $NF}' | tr -d " ")

if [[ $gen_code == 0 ]] ; then gencode=0;
elif [[ $gen_code == 1 ]] ; then gencode=2;
elif [[ $gen_code == 3 ]] ; then gencode=3;
elif [[ $gen_code == 4 ]] ; then gencode=5;
elif [[ $gen_code == 5 ]] ; then gencode=6;
elif [[ $gen_code == 6 ]] ; then gencode=9;
elif [[ $gen_code == 7 ]] ; then gencode=10;
elif [[ $gen_code == 8 ]] ; then gencode=12;
elif [[ $gen_code == 9 ]] ; then gencode=13;
elif [[ $gen_code == 10 ]] ; then gencode=15;
fi;

prog=0

#  echo -e "\n  analyizing replicate $rep of $aln_tot genes with branch modeles 0 vs 1 using $n_threads threads\n"

for j in $(cat tmp.lst);

do

if ( pwd | grep -q $original_path ); then : ; else printf "\n %s \n " " WARNING! an error occured while creating the folder system. \n"; exit; fi

#########################################################################################  folder creation      

codeml_threads=$(jobs | wc -l); raxml_threads=$(( $n_threads - $codeml_threads ));

                let prog=prog+1;

		perc=$(( ((prog) * 100)/ aln_tot ))

                #bar="■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"

                #barlength=${#bar}

                #n=$((perc*barlength/100))

                #printf "\r  analyze: \t \t %d%% \t %-${barlength}s" "$perc" "${bar:0:n}"
                printf "\r  analyze:\t"$perc"/100"

#  echo "analyzing gene $prog of $aln_tot - replicate $rep"

 k=$(head -$prog tmp.lst| tail -1) 

 export f=$(echo $j | sed "s/.aln//");

 mkdir $f;

#########################################################################################  branch length optimiztion

cd $f

if ( pwd | grep -q $original_path ); then : ; else printf "\n %s \n " " WARNING! an error occured while creating the folder system. \n"; exit; fi

transeq -sequence ../$j -outseq $j".aa" -table $gencode  &> /dev/null ;
if grep -q "\*" $j".aa" ; then echo -e  " the gene $j contains stop codon and has been excluded by the analyses - check if the gen code is correct" >> ../warnings_summary.txt; cd ..; mv $f $f"_stop_codons"; echo -e "$(echo $j | sed 's/.aln//')" >> failed_clusters.txt; continue; fi;


export n=$(tail -1 ../$j | wc -c);

echo "DNA, st=1-$n\3" >> $f.prt;
echo "DNA, nd=2-$n\3" >> $f.prt;
echo "DNA, rd=3-$n\3" >> $f.prt;

################################################################################################################################################################################################## md

  for i in $(cat ../sp.lst);

  do if grep -q $i ../$j;

  then :;

  else echo -n $i' ' >> $j"missing_otus.lst";

  fi;

 done;

 if [[ -e $j"missing_otus.lst" ]] && [[ -z "$missing_data" ]]; then cd .. ; echo -e " the gene $j contains missing data and has been excluded by the analyses - to include it use the -d flag" >> warnings_summary.txt; continue; fi

 if [[ -e $j"missing_otus.lst" ]] && [[ "$missing_data" = 1 ]]; then

phyutility -pr -names $(cat $j"missing_otus.lst") -in ../species_tree -out species_tree_cor;

raxmlHPC-PTHREADS -T $raxml_threads -m GTRGAMMA -s ../$j -f e -t species_tree_cor -q $f.prt -n $f".tre"  &> $j'_RAxML.log';

else

raxmlHPC-PTHREADS -T $raxml_threads -m GTRGAMMA -s ../$j -f e -t ../species_tree -q $f.prt -n $f".tre"  &> $j'_RAxML.log'; 

fi

#  echo -e "optimizing \t $j \t branchlength \t replicate \t $rep"

                rm *reduced* &> /dev/null;

 rm ../*reduced*  &> /dev/null;

 if grep -q "TOO FEW SPECIES" $j"_RAxML.log"; 

  then cd .. ;  

  mv $f $f"_tree_failure"; 

  echo -e "$(echo $j | sed 's/.aln//')" >> failed_clusters.txt; 

  echo -e " the gene $j contains less tha 3 OTUS so that branch lengths could not be calculated" >> warnings_summary.txt; continue; 

 fi

#################################################################################################################################################################################################### add TAGS

if  [ ! -z "$labels" ] && [ "$a_m" == 2 ]; then

cp RAxML_result."$f".tre r_input.tre

printf 'require(phangorn) \n' >> label.R
printf 'tr<-read.tree("./r_input.tre") \n' >> label.R
printf 'tips=(readLines(paste("./a_species.txt", sep = " "))) \n' >> label.R
printf 'labels<-scan("./a_tag.txt", character(), quote = " ") \n' >> label.R
printf 'label_nodes <- function(tr, tips, labels, filename = "tree.tre"){ \n' >> label.R
printf '    tr$node.label <- rep("", max(tr$edge)-Ntip(tr)) \n' >> label.R
printf '    for(i in 1:length(labels)) tr$node.label[mrca.phylo(tr, node = strsplit(tips[i], " ")[[1]], full = FALSE) - Ntip(tr)] <- labels[i] \n' >> label.R
printf '    write.tree(tr, file = filename) \n' >> label.R
printf '    return(tr) \n' >> label.R
printf '} \n' >> label.R
printf 'label_nodes(tr, tips, labels, filename = "tree.tre") \n' >> label.R

for W in {1..10}; do

	for lab in $labels $labels2; do

		awk '{print $NF}' ../../$lab > a_tag.txt
		awk '{$NF=""; print $0}' ../../$lab > a_species.txt

		if  [[ "$missing_data" = 1 ]] && [[ -a $j"missing_otus.lst" ]];
		
			then for i in $(cat $j"missing_otus.lst"); do sed -i 's/$i//g' a_species.txt; done
		fi;

		Rscript label.R  &> /dev/null;

		mv tree.tre "RAxML_result."$f"."$lab".tre"
		
		cat "RAxML_result."$f"."$lab".tre"

	done

        tree_end=$(awk -F ")" '{print $NF}' "RAxML_result."$f"."$lab".tre")
        good_tree_end=";"
       	echo -e "\n tree end = $tree_end"
       	echo -e "\n good end = $good_tree_end \n"

        if [[ $tree_end == $good_tree_end ]]; then break; else

        root=$(shuf -n 1 ../sp.lst); if grep $root  $j"missing_otus.lst"; then break; fi
	echo $root
        phyutility -rr -names $root -in r_input.tre -out r_input.tre
		
	cat RAxML_result.$f".tre"

	fi;

done

 if [[ $tree_end != $good_tree_end ]];
 then echo -e "  impossible to use tag $bad_tag in gene $j because of topology. Try to lanuch it again in the subset of ortholog clusters which failed. \n" >> ../warnings_summary.txt;
 #break;
 fi;

else : ;

fi ;

##############################################################################################################################################

for rep in $(seq 1 $rep); do

mkdir $f"_replicate_"$rep;
mkdir $f"_replicate_"$rep/$f"_model_alternative";
mkdir $f"_replicate_"$rep/$f"_model_general";

cd $f"_replicate_"$rep;

if ( pwd | grep -q $original_path ); then : ; else printf "\n %s \n " " WARNING! an error occured while creating the folder system. \n"; exit; fi

#########################################################################################  tree building original loop & folder creation

# model general

cd $f"_model_general";

if ( pwd | grep -q $original_path ); then : ; else printf "\n %s \n " " WARNING! an error occured while creating the folder system. \n"; exit; fi

# if  [ ! -z "$labels2" ]; then cp ../../"RAxML_result."$f"."$labels".tre" .; else cp ../../"RAxML_result."$f".tre" .; fi


if  [ ! -z "$labels2" ];
then
cp ../../"RAxML_result."$f"."$labels".tre" .
mv "RAxML_result."$f"."$labels".tre" "RAxML_result."$f".general.tre"
else
cp ../../"RAxML_result."$f".tre" .
mv "RAxML_result."$f".tre" "RAxML_result."$f".general.tre"
fi

cp ../../../$j .

sed "s/seqfile =/seqfile = $j/" ../../../../$codeml_template_1  | sed "s/treefile =/treefile = RAxML_result."$f".general.tre/" | sed "s/outfile =/outfile = "$f"_replicate_"$rep"_model_general.out/" > $f"_model_general.ctl" ;

codeml $f'_model_general.ctl' &> $j'model_general_codeml.log' &

while [ $(jobs | wc -l) -ge $n_threads ]; do sleep 1; done

# echo -e "performing \t $j \t model \t $general \t replicate \t $rep"

cd .. ;



# model alternative

cd $f"_model_alternative";

if ( pwd | grep -q $original_path ); then : ; else printf "\n %s \n " " WARNING! an error occured while creating the folder system. \n"; exit; fi

if [ ! -z "$labels" ] && [ ! -z "$labels2" ]; 
then 
cp ../../"RAxML_result."$f".$labels2.tre" .
mv "RAxML_result."$f".$labels2.tre" "RAxML_result."$f".alternative.tre"
elif [ ! -z "$labels" ] && [ -z "$labels2" ];
then cp ../../"RAxML_result."$f".$labels.tre" .
mv "RAxML_result."$f".$labels.tre" "RAxML_result."$f".alternative.tre"
else
cp ../../"RAxML_result."$f".tre" .
        mv "RAxML_result."$f".tre" "RAxML_result."$f".alternative.tre"
fi

cp ../../../$j .

sed "s/seqfile =/seqfile = $j/" ../../../../$codeml_template_2 | sed "s/treefile =/treefile = RAxML_result."$f".alternative.tre/" | sed "s/outfile =/outfile = "$f"_replicate_"$rep"_model_alternative.out/" > $f"_model_alternative.ctl" ;

codeml $f'_model_alternative.ctl' &> $j'_model_alternative_codeml.log' &

while [ $(jobs | wc -l) -ge $n_threads ]; do sleep 1; done

# echo -e "performing \t $j \t model \t $alternative \t replicate \t $rep"

cd ../..

done;

cd ..

done;

echo -e " "

######################################################################################### TAGS

wait

#########################################################################################  likelihood ratio test

if [[ $(wc -l failed_clusters.txt | awk '{print $1}') == $tot_genes ]]; then echo -e "\n all clusters failed, check the warning_summary.txt file in the .tmp.full.out folder. \n" ; exit; fi 2>/dev/null

echo -e "\n  performing LRT \n"

        for i in $(ls *.aln); do 

 export name=$(echo $i | sed -s 's/.aln//g');

 unset lk_a_best rep_a_best lk_b_best rep_b_best

 for r in $(seq 1 $rep); do

  export occurencies=$(grep "Time used" $name/$name"_replicate_"$r/"$name"_model_*/*out 2>/dev/null | wc -l);

  if [[ $occurencies == 2 ]];

  then

   export np_a=$(grep "lnL" $name/$name"_replicate_"$r/"$name"_model_general/*out | awk -F ":" '{print $3}' | sed 's/)/ /g' | tr -d " ");

   export np_b=$(grep "lnL" $name/$name"_replicate_"$r/"$name"_model_alternative/*out | awk -F ":" '{print $3}' | sed 's/)/ /g' | tr -d " ");

   export lk_a=$(grep "lnL" $name/$name"_replicate_"$r/"$name"_model_general/*out | awk '{print $5}'); echo $lk_a $r >> $name"_general.tmp"

                         export lk_b=$(grep "lnL" $name/$name"_replicate_"$r/"$name"_model_alternative/*out | awk '{print $5}');  echo $lk_b $r >> $name"_alternative.tmp"

    elif [[ $occurencies -lt 2 ]] && [[ -e $name/"RAxML_result."$name".tre" ]];

  then : ;

                          echo -e " the codeml analyisis relative to the replicate $r of the gene $name crashed" >> warnings_summary.txt;

   mv $name/$name"_replicate_"$r $name/$name"_replicate_"$r"_codeml_failure"

  fi;

 done 

 lk_a_best=$(sort -g $name"_general.tmp" 2> /dev/null | head -1 | awk '{print $1}')

         rep_a_best=$(sort -g $name"_general.tmp" 2> /dev/null | head -1 | awk '{print $2}')

         lk_b_best=$(sort -g $name"_alternative.tmp" 2> /dev/null | head -1 | awk '{print $1}')

         rep_b_best=$(sort -g $name"_alternative.tmp" 2> /dev/null | head -1 | awk '{print $2}')  

 if [[ ! -z $lk_a_best ]] && [[ ! -z $lk_b_best ]];

  then

           echo -e "$name\t$g_m\t$ns_1\t$np_a\t$lk_a_best\t$rep_a_best\t$a_m\t$ns_2\t$np_b\t$lk_b_best\t$rep_b_best" >> likelihood_summary.txt;

                elif [[ -z $lk_a_best ]] ||  [[ -z $lk_b_best ]] && [[ -e $name/"RAxML_result."$name".tre" ]];

  then

   echo -e " all replicates relative to gene $name crashed" >> warnings_summary.txt;

   echo -e "$name" >> failed_clusters.txt

                elif [[ -z $lk_a_best ]] && [[ -z $lk_b_best ]] && [[ -e $name/$name"_replicate_1"/"RAxML_result."$name".tre" ]];

  then : ;

 fi;

done

printf 'likelihood.summary <- read.table(file="./likelihood_summary.txt",sep="\t",header=FALSE,col.names=c("Ortholog_Cluster","Model1","NSsites_a","Model1np","Model1LnL","Rep1","Model2","NSsites_a","Model2np","Model2LnL","Rep2"),as.is=c(1:2,5)) \n' > LRT.R

printf 'LRT <- -2*(likelihood.summary$Model1LnL-likelihood.summary$Model2LnL) \n' >> LRT.R

printf 'degrees.of.freedom <- likelihood.summary$Model2np-likelihood.summary$Model1np \n' >> LRT.R

printf 'p.value <- 1-pchisq(LRT,df=degrees.of.freedom) \n' >> LRT.R

printf 'significance <- character() \n' >> LRT.R

printf 'selected.cluster <- character() \n' >> LRT.R

printf 'for (c in 1:dim(likelihood.summary)[1]) { \n' >> LRT.R

        printf 'selected <- TRUE \n' >> LRT.R

        printf 'if (p.value[c] < 0.001) { \n' >> LRT.R

        printf 'significance <- c(significance,"***") \n' >> LRT.R

        printf '} \n' >> LRT.R

        printf 'else if (p.value[c] < 0.01) { \n' >> LRT.R

        printf 'significance <- c(significance,"**") \n' >> LRT.R

        printf '} \n' >> LRT.R

        printf 'else if (p.value[c] < 0.05) { \n' >> LRT.R

        printf 'significance <- c(significance, "*") \n' >> LRT.R

        printf '} else { \n' >> LRT.R

        printf 'significance <- c(significance,"n/s") \n' >> LRT.R

        printf 'selected <- FALSE \n' >> LRT.R

        printf '} \n' >> LRT.R

        printf 'if (selected == TRUE) selected.cluster <- c(selected.cluster,likelihood.summary$Ortholog_Cluster[c]) \n' >> LRT.R

        printf '} \n' >> LRT.R

printf 'likelihood.summary$LRT <- round(LRT,digits=4) \n' >> LRT.R

printf 'likelihood.summary$df <- degrees.of.freedom \n' >> LRT.R

printf 'likelihood.summary$p.value <- round(p.value,digits=4) \n' >> LRT.R

printf 'likelihood.summary$significance <- significance \n' >> LRT.R

printf 'write.table(likelihood.summary,file="./likelihood_summary.txt",quote=FALSE,sep="\\t",eol="\\n",row.names=FALSE) \n' >> LRT.R

printf 'write.table(data.frame(selected.cluster=selected.cluster),file="./selected_clusters.txt",quote=FALSE,sep="\\t",eol="\\n",row.names=FALSE,col.names=FALSE) \n' >> LRT.R

Rscript LRT.R &> /dev/null;

rm LRT.R

########################################################################################

echo -e "  formatting output \n"

for f in $(cat selected_clusters.txt); do

 rep_b_best=$(sort -g $f"_alternative.tmp" 2> /dev/null | head -1 | awk '{print $2}')

 cp $f/$f'_replicate_'$rep_b_best/$f'_model_alternative'/$f'_replicate_'$rep_b_best'_model_alternative.out' ../$output_folder &> /dev/null;

done

######################################################################################## moves codeml .out which did pass the LRT 

for i in $(cat tmp.lst | sed 's/.aln//'); do if grep $i selected_clusters.txt &> /dev/null; then : ; else echo $i >> unselected_clusters.txt; fi; done

for f in $(cat unselected_clusters.txt); do

        rep_a_best=$(sort -g $f"_general.tmp" 2> /dev/null | head -1 | awk '{print $2}')

        cp $f/$f'_replicate_'$rep_a_best/$f'_model_general'/$f'_replicate_'$rep_a_best'_model_general.out' ../$output_folder  &> /dev/null;

done

######################################################################################## moves codeml .out which did not pass the LRT

rm tmp.lst

sort -u -o warnings_summary.txt warnings_summary.txt &> /dev/null

cp likelihood_summary.txt ../$output_folder 2> /dev/null

cp warnings_summary.txt ../$output_folder 2> /dev/null

if [[ -a warnings_summary.txt ]]; then echo -e "  \nthe analysis has produced some warning: you will find the information relative to each failure in the file warning_summary.txt"; fi

cd ../$output_folder

######################################################################################## builds files for branches when there are no missing data

if  [ "$missing_data" != 1 ]; then

pattern="*.out";

files=( $pattern );

base=$(echo "${files[0]}")

lines_number=$(awk '/dN & dS for each branch/,/tree length/' $base | wc -l)

awk '/dN & dS for each branch/,/tree length/' $base | head -$((lines_number -4)) | tail -$((lines_number -8)) | awk '{print $1}' > branches.tmp

cat $base | grep -w "TREE #  1:" | awk -F ":" '{print $2}' |  awk -F ";" '{print $1}' | sed 's/ //g' >> codeml.tre

while read line;

         do

 grep_arg=$(echo $line | sed 's/\./\\./g')

                 for j in *.out;

                                do

                                a=$(echo $j | sed 's/\.aln//' | awk -F "_" '{print $1}')

                                b=$(echo $j | sed 's/\.aln//' | awk -F "_" '{print $3}' | sed 's/\.out//')

                                c=$(cat $j | grep -w $grep_arg | awk -F " " '{print $2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9}')

                                echo -e $a"\t"$b"\t"$c >> $line"_branch.tmp";

                                done;

        done < branches.tmp

        for i in *_branch.tmp; do export branch=$(echo $i | sed 's/_branch.tmp//');

        echo -e "gene \t model \t t \t n \t S \t dN/dS \t dN \t dS \t N*dN \t S*dS" | cat - $i >> temp && mv temp $branch"_branch.out"

        done;

        mkdir $output_folder"_branches"

mv *_branch.out $output_folder"_branches"

rm *.tmp

fi

########################################################################################

cd ..

if  [ "$verbose" != 1 ]

then rm -r $output_folder".tmp.full.out"

fi

################################################################################################################################################################################ ANNOTATE (PART 1)

elif [ "$z"  == 1 ]

then

if [[ $(ls -l $input_folder/*out | wc -l) -eq 0 ]]; then echo -e " \n WARNING! no .out file(s) (codeml outputs) is present in the input folder \n "; exit; fi

echo -e "\n  analysis started on $(date)"

mkdir $output_folder

cp $input_folder/*.out $output_folder

cp $tags_file $output_folder 2>/dev/null

cd $output_folder;

ltot=$(ls -l *.out | wc -l)

prog=1

echo -e "\n  annotating $ltot codeml outputs \n"

for i in *.out;

do

perc=$(( ((prog) * 100)/ ltot ))
#bar="■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
#barlength=${#bar}
#n=$((perc*barlength/100))
#printf "\r  annotation: \t \t %d%% \t %-${barlength}s" "$perc" "${bar:0:n}"
printf "\r  annotate:\t"$perc"/100"

        let prog=prog+1

################################################################################################################################################################################ ANNOTATE (PART 2)

# echo "analyzing $i codeml output"

lines_number=$(awk '/dN & dS for each branch/,/tree length/' $i | wc -l); 

awk '/dN & dS for each branch/,/tree length/' $i | head -$((lines_number -2)) | tail -$((lines_number -6)) | awk -F " " '{print $1}' | sed 's/\.\./_/g' | awk -F "_" '{print $2"_"$1}' | sort -n > branches.tmp

awk '/dN & dS for each branch/,/tree length/' $i | head -$((lines_number -2)) | tail -$((lines_number -6)) | awk -F " " '{print $1}' | sed 's/\.\./_/g' | awk -F "_" '{print $1"_"$2}' | sort -n > chesbran.tmp

awk -F "_" '{print $1}' branches.tmp > init.tmp

awk -F "_" '{print $2}' branches.tmp > hits.tmp

cat $i | grep -A 2 "tree length = " | tail -1 > codeml_tre.tmp

n=$(cat init.tmp | wc -l)

################################################################################################################################################################################ ANNOTATE (PART 3)

for k in {1..5};

do

for j in $(eval echo {1..$n}); 

 do 

 init=$(sed -n $j"p" init.tmp)

 hits=$(sed -n $j"p" hits.tmp)

# subs=$(cat codeml_tre.tmp | sed s"/[^0-9]$init:/here (\n/" | grep -zPo 'here (\(([^()]++|(?1))*\))' | tail -1); 

subs=$(cat codeml_tre.tmp | tr -d '\0' | sed s"/[^0-9]$init:/$init (/" | tr -d '\0' | grep -zPo "$init (\(([^()]++|(?1))*\))" | tr -d '\0' | sed "s/$init (/$init\:/" | tr -d '\0')  &> /dev/null; 

# echo $init $hits $subs

if grep -w -q "$init" codeml_tre.tmp &> /dev/null; 

then if grep -w -v "$hits" codeml_tre.tmp &> /dev/null;

then if [[ ! -z $subs ]]; 

then sed -i "s/[^0-9.]$subs/&$hits/" codeml_tre.tmp;

fi;

fi;

fi;

done

done

################################################################################################################################################################################ ANNOTATE (PART 4)

export sp_number=$(cat $i | grep "TREE #  1" | awk -F ":" '{print $2}' | awk -F ";" '{print $1}' | tr -d "()" | sed -e "s/,/\n/g" | tr -d " " | sort -n | tail -1)

################################################################################################################################################################################ ANNOTATE (PART 5)

cat $i | grep -A 4 "tree length =" | tail -1 | sed 's/,/\n/g' | sed 's/(//g' |  sed 's/)//g' | sed 's/;//g' | awk -F ":" '{print $1}' | tr -d " " > name_1.tmp

cat $i | grep -A 4 "tree length =" | head -3 | tail -1 | sed 's/,/\n/g' | sed 's/(//g' |  sed 's/)//g' | sed 's/;//g' | awk -F ":" '{print $1}' | tr -d " " > name_2.tmp

for l in $(seq -s' ' 1 $sp_number); 

do export a=$(awk "NR==$l" name_1.tmp); export b=$(awk "NR==$l" name_2.tmp); echo -e $a $b >> conversion.tmp; done

################################################################################################################################################################################ ANNOTATE (PART 6)

# echo -e "\n (term branches) \n" >> $i".terminal.branches.tmp"

for q in `seq $((sp_number))`; do echo -e $q "\t" - - - - - "\t" $q >> $i".terminal.branches.tmp"; done

# echo -e "\n (deep branches) \n" >> $i".deep.branches.tmp"

for m in `seq $((sp_number +2)) $((2*sp_number-2))`;

do one=$(cat codeml_tre.tmp | sed s"/$m:/\n /" | head -1 | grep -zPo '(\(([^()]++|(?1))*\))' | tail -1 |  tr -d '\000' | grep -o "[0-9]*\:" | sed "s/://g" | sort -n); 

	for g in $one;

	do if [ $g -le $sp_number ]; then echo $g >> tips.tmp;

	fi; 

done; 

echo -e  $m "\t" - - - - - "\t" $(cat tips.tmp) >> $i".deep.branches.tmp"

rm tips.tmp 2> /dev/null

done;

################################################################################################################################################################################ ANNOTATE (PART 7)

cp codeml_tre.tmp codeml_tre_renamed.tmp

while read line;

do common_name=$(echo $line | awk '{print $1}'); codeml_name=$(echo $line | awk '{print $2}');

sed -i "s/\<$codeml_name\>[^.]/$common_name :/g" codeml_tre_renamed.tmp;

done < conversion.tmp

################################################################################################################################################################################ ANNOTATE (PART 8)

cp $i".terminal.branches.tmp" $i".terminal.branches.corrected.tmp";

while read line; do a=$(echo $line | awk '{print $1}'); b=$(echo $line | awk '{print $2}'); sed -i "s/ \<$b\>/ $a/g" $i".terminal.branches.corrected.tmp" &> /dev/null; done < conversion.tmp

cp $i".deep.branches.tmp" $i".deep.branches.corrected.tmp";

while read line; do a=$(echo $line | awk '{print $1}'); b=$(echo $line | awk '{print $2}'); sed -i "s/ \<$b\>/ $a/g" $i".deep.branches.corrected.tmp" &> /dev/null; done < conversion.tmp

################################################################################################################################################################################ ANNOTATE (PART 9)

while read line; do A=$(echo $line | awk -F "_" '{print $1}'); B=$(echo $line | awk -F "_" '{print $2}'); sed -i "s/\<$A\> /$B..$A/" $i".terminal.branches.corrected.tmp" &> /dev/null; done < branches.tmp &> /dev/null

while read line; do A=$(echo $line | awk -F "_" '{print $1}'); B=$(echo $line | awk -F "_" '{print $2}'); sed -i "s/\<$A\> /$B..$A/" $i".terminal.branches.tmp" &> /dev/null; done < branches.tmp &> /dev/null

while read line; do A=$(echo $line | awk '{print $1}'); B=$(grep "_$A" chesbran.tmp); sed -i "s/\<$A\> /$B/" $i".deep.branches.corrected.tmp" &> /dev/null; done < $i".deep.branches.corrected.tmp";

sed -i 's/_/\.\./' $i".deep.branches.corrected.tmp"

while read line; do A=$(echo $line | awk '{print $1}'); B=$(grep "_$A" chesbran.tmp); sed -i "s/\<$A\> /$B/" $i".deep.branches.tmp" &> /dev/null; done < $i".deep.branches.tmp"; 

sed -i 's/_/\.\./' $i".deep.branches.tmp"

################################################################################################################################################################################ ANNOTATE (REVERSE DEEP BRANCHES)

cat $i | grep -A 4 "tree length =" | tail -1 | sed 's/,/\n/g' | sed 's/(//g' | tr -d " " | awk -F ":" '{print $1}'| sort > $i"_sp_lst.tmp";

while read line; do 

branch_components=$(echo $line | awk -F " - - - - - " '{print $2}');

branch_name=$(echo $line | awk -F " - - - - - " '{print $1}'); echo $branch_components | tr " " "\n" | sort > $i"_branch_"$branch_name".tmp"; 

comm -3 $i"_sp_lst.tmp" $i"_branch_"$branch_name".tmp" > $i"_branch_"$branch_name"_opposite.tmp" 2> /dev/null; 

echo -e $branch_name "\t - - - - - \t" $(cat $i"_branch_"$branch_name"_opposite.tmp" | tr '\n' '  ') >> $i"_deep_branches_opposite.tmp"; 

done <  $i".deep.branches.corrected.tmp";

################################################################################################################################################################################ ANNOTATE (REVERSE TIP BRANCHES)

# cat $i | grep -A 4 "tree length =" | tail -1 | sed 's/,/\n/g' | sed 's/(//g' | tr -d " " | awk -F ":" '{print $1}'| sort > $i"_sp_lst.tmp";

                while read line; do

                branch_components=$(echo $line | awk -F " - - - - - " '{print $2}');

                branch_name=$(echo $line | awk -F " - - - - - " '{print $1}'); echo $branch_components | tr " " "\n" | sort > $i"_branch_"$branch_name".tmp";

                comm -3 $i"_sp_lst.tmp" $i"_branch_"$branch_name".tmp" > $i"_branch_"$branch_name"_opposite.tmp";

                echo -e $branch_name "\t - - - - - \t" $(cat $i"_branch_"$branch_name"_opposite.tmp" | tr '\n' '  ') >> $i"_terminal_branches_opposite.tmp";

        done <  $i".terminal.branches.corrected.tmp";

################################################################################################################################################################################ ANNOTATE (WRITE OUTPUT)

echo -e "\ntips defined by each branch (original) ---------------------------------------------------------------------< \n"  >> $i".result"

        cat $i".terminal.branches.corrected.tmp" >> $i".result"

cat $i".deep.branches.corrected.tmp" >> $i".result"

        echo -e "\ntips defined by each branch (mirror) -----------------------------------------------------------------------< \n"  >> $i".result"

cat $i"_terminal_branches_opposite.tmp" >> $i".result"

        cat $i"_deep_branches_opposite.tmp" >> $i".result"

#       echo -e "\ntips defined by each branch (codeml) -----------------------------------------------------------------------<"  >> $i".result"

# cat $i".terminal.branches.tmp" >> $i".result"

# cat $i".deep.branches.tmp" >> $i".result"

echo -e "\nconversion table between codeml and original tips ---------------------------------------------------------------< \n"  >> $i".result"

        cat conversion.tmp | sort -u | sort -k 2 | sed 's/ /\t - - - - - \t/g'>> $i".result"; 

        echo -e "\ntree with deep nodes and tips annotation (original) -------------------------------------------------------------< \n"  >> $i".result"

echo -e $(cat codeml_tre_renamed.tmp) >> $i".result"

        echo -e "\ntree with deep nodes and tips annotation (codeml) ---------------------------------------------------------------< \n"  >> $i".result"

echo -e $(cat codeml_tre.tmp) >> $i".result"

echo -e "\n" >> $i".result"

############################################################################################################################################################################### ANNOTATE (END)

rm *.tmp

done;

echo -e " \n"

################################################################################################################################################################################ EXTRACT!

elif [ "$j"  == 1 ];

                then

# if [[ -z $min_otu ]]; then echo -e " \n WARNING! a minimum number of OTUs to extract a clade has to be specified \n "; exit; fi 

if [[ $(ls -l $input_folder/*out | wc -l) -eq 0 ]]; then echo -e " \n WARNING! no .out file(s) (codeml outputs) is present in the input folder \n "; exit; fi

if [[ $(ls -l $input_folder/*result | wc -l) -eq 0 ]]; then echo -e " \n WARNING! no .result file(s) (annotation of codeml outputs) is present in the input folder \n "; exit; fi

echo -e "\n  analysis started on $(date)"

cp $labels $input_folder

cd $input_folder

# echo $input_folder $labels

ltot=$(ls -l *.out | wc -l)

ttot=$(wc -l $labels | awk '{print $1}')

echo -e "\n  extracting $ttot branches from $ltot codeml output \n"

        while read tag; do

 prog=0

                export tag_number=$(echo $tag | awk '{$NF=""; print $0}' | wc -w);

                export tag_name=$(echo $tag | awk '{print $NF}');

################################################################################################################################################################################ EXTRACT! (PT1)

 if [[ $tag_number == 1 ]]; 

  then

  if  [ "$verbose" = 1 ]; then

   echo -e "clade \t gene \t model \t dNdS \t t \t dN \t dS \t branch" > "branch."$tag_name".dNdS.summary.tmp";

  else

                                echo -e "clade \t gene \t dNdS \t t \t dN \t dS" > "branch."$tag_name".dNdS.summary.tmp";

  fi;  

  export tag_hit=$(echo $tag | awk '{print $1}' | tr -d " ")

  for codeml_file in *out; do

                        let prog=prog+1

#    echo -e "extracting $codeml_file tag $tag_name"

   name=$(echo $codeml_file | awk -F "_replicate_" '{print $1}');

                                model=$(echo $codeml_file | awk -F "_model_" '{print $2}' | sed 's/\.out//');

                  sed -n -e '/tips defined by each branch/,/conversion table between codeml and original tips/ p' $codeml_file".result" | sort -n | tail -n +8 > $codeml_file"_result_deep_branches.tmp"

   while read line; 

    do content=$(echo $line | awk -F "- - - - - " '{print $2}' | tr -d " "); 

    if [[ $content == $tag_hit ]]; 

     then 

     comp_branch=$(echo $line | awk -F "- - - - - " '{print $1}'); 

     export dNdS=$(grep -w "$(echo $comp_branch | sed 's/\./\\./g')" $codeml_file | tail -1 | awk '{print $5}');

     export t=$(grep -w "$(echo $comp_branch | sed 's/\./\\./g')" $codeml_file | tail -1 | awk '{print $2}');

                          export enne=$(grep -w "$(echo $comp_branch | sed 's/\./\\./g')" $codeml_file | tail -1 | awk '{print $6}');

                           export esse=$(grep -w "$(echo $comp_branch | sed 's/\./\\./g')" $codeml_file | tail -1 | awk '{print $7}');

    fi

                         done < $codeml_file"_result_deep_branches.tmp"

                         if [ -z "$dNdS" ]; then dNdS=$(echo "no_branch"); fi;

   if  [ "$verbose" = 1 ]; then

                          echo -e "$tag_name \t $name \t $model \t $dNdS \t $t \t $enne \t $esse \t $comp_branch" >> "branch."$tag_name".dNdS.summary.tmp";

   else

                                 echo -e "$tag_name \t $name \t $dNdS \t $t \t $enne \t $esse" >> "branch."$tag_name".dNdS.summary.tmp";

   fi;

#                               echo -e "$tag_name \t $codeml_file \t $dNdS \t $comp_branch \t $tag_hit"

   unset dNdS comp_branch t enne esse

  perc=$(( ((prog) * 100)/ ltot ))

          #bar="■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
          #barlength=${#bar}
	  #n=$((perc*barlength/100))
          #printf "\r  extraction: ${tag_name:0:10}... \t \t \t %d%% \t %-${barlength}s" "$perc" "${bar:0:n}"
           printf "\r  extract ${tag_name:0:8}..\t "$perc"/100"
                 done

                        echo  " "

################################################################################################################################################################################ EXTRACT! (PT2)

 elif [[ $tag_number -gt 1 ]];

 then

  if [[ -z $min_otu ]]; 

then echo -e " a minimum number of OTUs to extract $tag_name clade has to be specified " >> warnings_summary.txt;

printf "\r  extraction: ${tag_name:0:10}... \t \t \t must specify a minimum number of OTUs"; echo  " ";

continue; 

fi

        float=$(echo $min_otu | awk -F "." '{print $1}');
                        
  if [[ $float == 0 ]]; then perc=$( echo $min_otu | sed "s/0.//"); min=$(( tag_number * perc / 10 ));

  else min=$(echo $min_otu);

  fi;

                        if [[ $float != 0 ]]; then

                                if [[ $min_otu -gt $tag_number ]];

                                        then echo -e " a minimum number of OTUs ($min_otu) greater than the whole clade has been specified for $tag_name and thus it has been excluded " >> warnings_summary.txt;

    printf "\r  extraction: ${tag_name:0:10}... \t \t \t fail"; echo  " ";

                                        continue;

                                fi;

  fi;

                        if  [ "$verbose" = 1 ]; then

                                echo -e "clade \t gene \t model \t OTUs_n \t dNdS \t t \t dN \t dS \t branch \t OTUs" > "branch."$tag_name".min.otu."$min_otu".dNdS.summary.tmp";

                        else

                                echo -e "clade \t gene \t OTUs_n \t dNdS \t t \t dN \t dS" > "branch."$tag_name".min.otu."$min_otu".dNdS.summary.tmp";

                        fi;

                beginning=$(echo $tag | awk '{$NF=""; print $0}' | sed 's/ /" -e "/g');

                corrected_beginning=$(echo ${beginning::-4});

                grep_argument=$(echo "-e \"$corrected_beginning")

#               echo $tag_name $grep_argument $tag_number

                for codeml_file in *out; do

#   if [[ $float != 0 ]]; then 

#    if [[ $min_otu -gt $tag_number ]]; 

#     then echo -e " a minimum number of OTUs ($min_otu) greater than the whole clade has been specified for $tag_name and thus it has been excluded " >> warnings_summary.txt;

#     continue; 

#    fi;

#   fi;

name=$(echo $codeml_file | awk -F "_replicate_" '{print $1}');

        model=$(echo $codeml_file | awk -F "_model_" '{print $2}' | sed 's/\.out//');

let prog=prog+1

#   echo -e "extracting $codeml_file tag $tag_name"

  sed -n -e '/tips defined by each branch/,/conversion table between codeml and original tips/ p' $codeml_file".result" | sort -n | tail -n +8 > $codeml_file"_result_deep_branches.tmp"

                  while read line; do

                        export branch=$(echo $line | awk -F " - - - - - " '{print $1}');

                        export content=$(echo $line | awk -F " - - - - - " '{print $2}');

                        export branch_hits_number=$(echo $content | eval grep -o $grep_argument | wc -w);

export branch_hits=$(echo $content | eval grep -o $grep_argument)

                        export branch_element_number=$(echo $content | wc -w);

#  echo $branch $content $branch_element_number $branch_hits $branch_hits_number $tag_number $min

#  echo  $branch_element_number $tag_number $branch_hits_number $min

                                if [[ "$branch_element_number" -le "$tag_number" ]] && [[ "$branch_hits_number" -ge "$min" ]];

                               then echo $branch_hits_number $branch $branch_hits >> candidate_branches.tmp;

                                fi;

                 done < $codeml_file"_result_deep_branches.tmp";

                        sort -nr candidate_branches.tmp > candidate_branches_sorted.tmp 2>/dev/null;

                        rm candidate_branches.tmp 2>/dev/null;

                        export comp_branch=$(head -1 candidate_branches_sorted.tmp | awk '{print $2}')

                        export comp_branch_hits=$(head -1 candidate_branches_sorted.tmp | awk '{$1=$2=""}1')

                        export comp_branch_hits_number=$(head -1 candidate_branches_sorted.tmp | awk '{$1=$2=""}1' | wc -w)

                        export dNdS=$(grep -w "$(echo $comp_branch | sed 's/\./\\./g')" $codeml_file | tail -1 | awk '{print $5}')

#                       echo -e "$tag_name \t $codeml_file \t $dNdS \t $elementz";



  if [ -z "$dNdS" ]; then dNdS=$(echo "no_branch"); 

  else 

  export t=$(grep -w "$(echo $comp_branch | sed 's/\./\\./g')" $codeml_file | tail -1 | awk '{print $2}'); 

                        export enne=$(grep -w "$(echo $comp_branch | sed 's/\./\\./g')" $codeml_file | tail -1 | awk '{print $6}');

                        export esse=$(grep -w "$(echo $comp_branch | sed 's/\./\\./g')" $codeml_file | tail -1 | awk '{print $7}');

  fi

   if  [ "$verbose" = 1 ]; then

    echo -e "$tag_name \t $name \t $model \t $comp_branch_hits_number \t $dNdS \t $t \t $enne \t $esse \t $comp_branch \t $comp_branch_hits" >> "branch."$tag_name".min.otu."$min_otu".dNdS.summary.tmp";

                                else

                                 echo -e "$tag_name \t $name \t $comp_branch_hits_number \t $dNdS \t $t \t $enne \t $esse" >> "branch."$tag_name".min.otu."$min_otu".dNdS.summary.tmp";

   fi;

                        unset dNdS comp_branch elementz t enne esse

          perc=$(( ((prog) * 100)/ ltot ))

                       #bar="■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"
                       #barlength=${#bar}
                       #n=$((perc*barlength/100))
                       #printf "\r  extraction: ${tag_name:0:10}... \t \t \t %d%% \t %-${barlength}s" "$perc" "${bar:0:n}"
	               printf "\r  extract ${tag_name:0:8}..\t "$perc"/100"

  done

                        #echo  " "

fi;

################################################################################################################################################################################ EXTRACT! (PT2)

done < $labels

echo " "

for i in *.summary.tmp; do cat $i | awk 'NR<2{print $0;next}{print $0 | " sort -k 2 " }' > $(echo $i | sed s'/.tmp//'); done 2>/dev/null

        sort -u -o warnings_summary.txt warnings_summary.txt 2>/dev/null

rm *.tmp 2>/dev/null

if [[ -a warnings_summary.txt ]]; then echo -e "  the analysis has produced some warning: you will find the information relative to each failure in the file warning_summary.txt \n"; fi

################################################################################################################################################################################ EXTRACT! (END)

else echo -e "\nTo recall an help page type BASE -h\n"; exit;

fi;

printf "  analysis finished on $(date) \n"
