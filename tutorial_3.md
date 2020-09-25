**Retrive omega values of a branch allowing missing data**

---

This tutorial is rather similar to the previous one, with a big exception: we are going to implement in our analyses non-ubiquitous gene OGs - _i.e._ OGs where some of the species considered are lacking).
What's need to carry out this analysis is a) a folder of aligned OGs b) a species tree c) two codeml .ctl files to set up the analysis. Here is the 
[folder](https://github.com/for-giobbe/BASE/tree/master/example/_partials_OGs) with the toy-dastaset; if 
you type ``` grep -c ">" *``` you can see how each fasta-formatted file has a different number of genes in it, yet never exceeding the total number of tips of our species tree.
Consider that too small OGs (<3 OTUs) won't be processed by BASE, so you can exclude them before the analysis or make BASE discard them.

---

To execute analysis levereaging also non ubiquitous genes clusters we need to specify the ```-d``` flag; I have also included ```-v``` so that BASE will prduce a verbose output
and won't erase its temporary folder and files. Here's the line:

```sh BASE.1.9.sh --analyze -i complete_OGs/ -o complete_OGs_analyze -t sp.tre -ma m0.ctl -mb m1.ctl -c 4 -d -v```

Here's the standard output:

```
  analysis started on Fri Sep 25 15:35:40 CEST 2020

  analyizing 1 replicate(s) of 21 genes: model 0 VS 1 & NSsites 0 VS 0 

  analyze:	100/100

  performing LRT 

  formatting output 

  analysis finished on Fri Sep 25 15:40:57 CEST 2020 
```

The files generated are exactly the same as an analysis which doesn't allow missing data.
Due to the -v flag we also get a ```tmp.full.out folder``` which contains all the intermediate and temporary file of the analyses. 
We can then proceed straight to the annotation step by typing:

```sh BASE.1.9.sh --annotate -i partial_OGs_analyze_d/ -o partial_OGs_annotate```

And it's standard output:

```
  analysis started on Fri Sep 25 15:49:41 CEST 2020

  annotating 21 codeml outputs 

  annotate:	100/100

  analysis finished on Fri Sep 25 15:52:45 CEST 2020 
```

We now want to extract the values of a branch, but we don't want to allow any missing data in the relative clade. We
can specify a number of tips equal to the clade size; our clade of interest consists of just two tips and we thus we can use the flag ```-n 2```
which specifies that a minimun of 2 tips must be subtended for the branch to be considered. Let's type:

```sh BASE.1.9.sh --extract -i partial_OGs_annotate/ -l branch.lst -n 2```

```
  analysis started on Fri Sep 25 15:56:41 CEST 2020

  extracting 2 branches from 21 codeml output 

  extract alcade_1..	 100/100

  extract dmag..	 100/100 
 
  analysis finished on Fri Sep 25 15:57:38 CEST 2020 
```

If we take a look of the ouptut - by typing ```column -t partial_OGs_annotate/branch.clade_1.min.otu.2.dNdS.summary```
we'll se that it clearly states where the cirteria was not met.

```
clade    gene            OTUs_n  dNdS       t      dN      dS
clade_1  OG3105.mafft.n  2       0.0821     0.404  0.0363  0.4422
clade_1  OG3126.mafft.n  2       0.0942     1.100  0.1159  1.2294
clade_1  OG3158.mafft.n  2       0.1048     0.539  0.0623  0.5941
clade_1  OG3164.mafft.n  0       no_branch
clade_1  OG3196.mafft.n  0       no_branch
clade_1  OG3197.mafft.n  2       0.0960     1.188  0.1186  1.2349
clade_1  OG3302.mafft.n  2       0.1724     0.778  0.1277  0.7410
clade_1  OG3342.mafft.n  0       no_branch
clade_1  OG3347.mafft.n  0       no_branch
clade_1  OG3359.mafft.n  2       0.0298     0.326  0.0119  0.3998
clade_1  OG3362.mafft.n  2       0.1541     0.398  0.0573  0.3717
clade_1  OG3372.mafft.n  2       0.0219     0.318  0.0102  0.4641
clade_1  OG3387.mafft.n  2       0.0953     0.292  0.0272  0.2857
clade_1  OG3395.mafft.n  0       no_branch
clade_1  OG3399.mafft.n  0       no_branch
clade_1  OG3600.mafft.n  2       0.1973     0.244  0.0425  0.2154
clade_1  OG3622.mafft.n  2       0.1296     1.112  0.1481  1.1434
clade_1  OG3640.mafft.n  2       0.1355     0.411  0.0559  0.4127
clade_1  OG3648.mafft.n  2       0.1708     0.471  0.0726  0.4250
clade_1  OG3682.mafft.n  2       0.1405     0.276  0.0378  0.2693
clade_1  OG3683.mafft.n  0       no_branch
```

```sh BASE.1.9.sh --extract -i partial_OGs_annotate -l branch_alt.lst -n 2 -v```

```
  analysis started on Fri Sep 25 16:20:49 CEST 2020

  extracting 1 branches from 21 codeml output 

  extract second_c..	 100/100 

  analysis finished on Fri Sep 25 16:21:31 CEST 2020 
```

```
clade         gene            model        OTUs_n  dNdS    t      dN      dS      branch  OTUs
second_clade  OG3105.mafft.n  alternative  2       0.0875  0.270  0.0255  0.2916  7..8    lart  lubb
second_clade  OG3126.mafft.n  alternative  2       0.0942  1.100  0.1159  1.2294  5..6    lart  lubb
second_clade  OG3158.mafft.n  alternative  2       0.1187  1.361  0.1718  1.4471  7..8    tcan  tusa
second_clade  OG3164.mafft.n  alternative  4       0.0976  0.406  0.0523  0.5362  6..1    lart  lubb  tcan  tusa
second_clade  OG3196.mafft.n  general      4       0.1980  0.468  0.0768  0.3881  6..1    lart  lubb  tcan  tusa
second_clade  OG3197.mafft.n  general      4       0.0960  1.188  0.1186  1.2349  7..8    lart  lubb  tcan  tusa
second_clade  OG3302.mafft.n  alternative  4       0.1724  0.778  0.1277  0.7410  7..8    lart  lubb  tcan  tusa
second_clade  OG3342.mafft.n  alternative  4       0.1393  0.520  0.0734  0.5267  7..8    lart  lubb  tcan  tusa
second_clade  OG3347.mafft.n  alternative  4       0.1104  0.501  0.0611  0.5537  7..8    lart  lubb  tcan  tusa
second_clade  OG3359.mafft.n  alternative  3       0.0577  0.354  0.0233  0.4028  8..9    lart  lubb  tcan
second_clade  OG3362.mafft.n  alternative  4       0.1477  0.530  0.0741  0.5015  9..10   lart  lubb  tcan  tusa
second_clade  OG3372.mafft.n  alternative  3       0.0452  0.484  0.0296  0.6540  8..9    lart  lubb  tcan
second_clade  OG3387.mafft.n  alternative  4       0.1755  0.704  0.1033  0.5884  9..10   lart  lubb  tcan  tusa
second_clade  OG3395.mafft.n  alternative  4       0.0415  0.183  0.0096  0.2315  7..8    lart  lubb  tcan  tusa
second_clade  OG3399.mafft.n  general      4       0.1089  0.509  0.0592  0.5434  7..8    lart  lubb  tcan  tusa
second_clade  OG3600.mafft.n  alternative  3       0.1459  0.454  0.0655  0.4489  8..9    lart  lubb  tusa
second_clade  OG3622.mafft.n  alternative  4       0.1296  1.112  0.1481  1.1434  7..8    lart  lubb  tcan  tusa
second_clade  OG3640.mafft.n  alternative  4       0.1889  0.963  0.1623  0.8595  9..10   lart  lubb  tcan  tusa
second_clade  OG3648.mafft.n  general      4       0.1708  0.651  0.1002  0.5867  9..10   lart  lubb  tcan  tusa
second_clade  OG3682.mafft.n  alternative  3       0.1649  0.341  0.0519  0.3148  8..9    lart  lubb  tusa
second_clade  OG3683.mafft.n  alternative  4       0.1670  0.255  0.0403  0.2410  7..8    lart  lubb  tcan  tusa
```
