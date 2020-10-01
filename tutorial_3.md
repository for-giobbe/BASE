**Implementing non-ubiquitous genes OGs in the analysis**

---

This tutorial is rather similar to the previous one, with a big exception: 
we are going to implement in our analyses **non-ubiquitous gene OGs** - _i.e._ OGs where some of the tips - species? - considered are lacking.
As before, what's need to carry out this analysis is a folder of ```.aln``` aligned OGs, a ```.nwk``` species tree and two codeml ```.ctl``` files.

Here is the [folder](https://github.com/for-giobbe/BASE/tree/master/example/_partials_OGs) with a toy-dastaset which includes non-ubiquitous genes OGs as well; if 
you type ``` grep -c ">" *``` you can see how each fasta-formatted file has a different number of genes in it, yet never exceeding the total number of tips of our species tree.
Consider that too small OGs (<3 OTUs) won't be processed by BASE, so you can exclude them before the analysis or make BASE discard them.

---

To carry out the ```--analyze``` step leveraging also non ubiquitous genes OGs we need to specify the ```-d``` flag; we can also include ```-v``` so that BASE will produce a verbose output
and won't erase its temporary folder and files. Here's the line:

```
    sh BASE.sh --analyze -i _partials_OGs/ -o partial_OGs_analyze 
    -t sp.tre -ma m0.ctl -mb m1.ctl -c 4 
    -d -v
```

The files generated are exactly the same as an analysis which includes ubiquitous genes OGs..
Due to the ```-v``` flag we also get a ```...tmp.full.out folder``` which contains all the intermediate and temporary file of the analyses. 
We can then proceed straight to the ```--annotate``` step by typing:

```sh BASE.sh --annotate -i partial_OGs_analyze/ -o partial_OGs_annotate```

In a first scenario, we want to extract the values of a branch without allowing any missing data in the relative clade. To do so we
can just specify a number of tips equal to the clade size: as our clade of interest consists of just two tips we can use the flag ```-n 2```,
which specifies that a minimun of 2 tips must be subtended for the branch to be considered. Let's type:

```sh BASE.sh --extract -i partial_OGs_annotate/ -l branch.lst -n 2```

The ouptut will be named with the clade name and the treshold of missing data as well.
We can see that it clearly states where the cirteria was not met for certain OGs, as we can observe from the ```no_branch``` labels.

```
clade              gene    OTUs_n  dNdS       t      dN      dS
clade_of_interest  OG3105  2       0.0821     0.404  0.0363  0.4422
clade_of_interest  OG3126  2       0.0942     1.100  0.1159  1.2294
clade_of_interest  OG3158  2       0.1048     0.539  0.0623  0.5941
clade_of_interest  OG3164  0       no_branch
clade_of_interest  OG3196  0       no_branch
clade_of_interest  OG3197  2       0.0960     1.188  0.1186  1.2349
clade_of_interest  OG3302  2       0.1724     0.778  0.1277  0.7410
clade_of_interest  OG3342  0       no_branch
clade_of_interest  OG3347  0       no_branch
clade_of_interest  OG3359  2       0.0298     0.326  0.0119  0.3998
clade_of_interest  OG3362  2       0.1541     0.398  0.0573  0.3717
clade_of_interest  OG3372  2       0.0219     0.318  0.0102  0.4641
clade_of_interest  OG3387  2       0.0953     0.292  0.0272  0.2857
clade_of_interest  OG3395  0       no_branch
clade_of_interest  OG3399  0       no_branch
clade_of_interest  OG3600  2       0.1973     0.244  0.0425  0.2154
clade_of_interest  OG3622  2       0.1296     1.112  0.1481  1.1434
clade_of_interest  OG3640  2       0.1355     0.411  0.0559  0.4127
clade_of_interest  OG3648  2       0.1708     0.471  0.0726  0.4250
clade_of_interest  OG3682  2       0.1405     0.276  0.0378  0.2693
clade_of_interest  OG3683  0       no_branch
```

In a second scenario, we want instead to obtain the information of the branch leading to our group(s) of interest even when some of its tips are missing.
With the ```-n``` flag we can specify either an absulute number or a proportion. For example let's extract the information
for a second clade using a trashold of 0.8:

```sh BASE.sh --extract -i partial_OGs_annotate -l branch_alt.lst -n 0.8 -v```

This analysis will consider more OGs than the one only considering ubiquitous genes; due to the ```-v``` flag we can visualize each OGs OTUs and the specific branch in the tree:

```
second_clade  OG3105  alternative  0       no_branch
second_clade  OG3126  alternative  0       no_branch
second_clade  OG3158  alternative  0       no_branch
second_clade  OG3164  alternative  4       0.0976     0.406  0.0523  0.5362  6..1    lart  lubb  tcan  tusa
second_clade  OG3196  general      4       0.1980     0.468  0.0768  0.3881  6..1    lart  lubb  tcan  tusa
second_clade  OG3197  general      4       0.0960     1.188  0.1186  1.2349  7..8    lart  lubb  tcan  tusa
second_clade  OG3302  alternative  4       0.1724     0.778  0.1277  0.7410  7..8    lart  lubb  tcan  tusa
second_clade  OG3342  alternative  4       0.1393     0.520  0.0734  0.5267  7..8    lart  lubb  tcan  tusa
second_clade  OG3347  alternative  4       0.1104     0.501  0.0611  0.5537  7..8    lart  lubb  tcan  tusa
second_clade  OG3359  alternative  3       0.0577     0.354  0.0233  0.4028  8..9    lart  lubb  tcan
second_clade  OG3362  alternative  4       0.1477     0.530  0.0741  0.5015  9..10   lart  lubb  tcan  tusa
second_clade  OG3372  alternative  3       0.0452     0.484  0.0296  0.6540  8..9    lart  lubb  tcan
second_clade  OG3387  alternative  4       0.1755     0.704  0.1033  0.5884  9..10   lart  lubb  tcan  tusa
second_clade  OG3395  alternative  4       0.0415     0.183  0.0096  0.2315  7..8    lart  lubb  tcan  tusa
second_clade  OG3399  general      4       0.1089     0.509  0.0592  0.5434  7..8    lart  lubb  tcan  tusa
second_clade  OG3600  alternative  3       0.1459     0.454  0.0655  0.4489  8..9    lart  lubb  tusa
second_clade  OG3622  alternative  4       0.1296     1.112  0.1481  1.1434  7..8    lart  lubb  tcan  tusa
second_clade  OG3640  alternative  4       0.1889     0.963  0.1623  0.8595  9..10   lart  lubb  tcan  tusa
second_clade  OG3648  general      4       0.1708     0.651  0.1002  0.5867  9..10   lart  lubb  tcan  tusa
second_clade  OG3682  alternative  3       0.1649     0.341  0.0519  0.3148  8..9    lart  lubb  tusa
second_clade  OG3683  alternative  4       0.1670     0.255  0.0403  0.2410  7..8    lart  lubb  tcan  tusa
```

But let's try to use a different treshold of 0.6:

```sh BASE.sh --extract -i partial_OGs_annotate -l branch_alt.lst -n 0.6 -v```

We can notice that the our criteria have been met in a larger number of cases (all of the OGs actually):

```
clade         gene    model        OTUs_n  dNdS    t      dN      dS      branch  OTUs
second_clade  OG3105  alternative  2       0.0875  0.270  0.0255  0.2916  7..8    lart  lubb
second_clade  OG3126  alternative  2       0.0942  1.100  0.1159  1.2294  5..6    lart  lubb
second_clade  OG3158  alternative  2       0.1187  1.361  0.1718  1.4471  7..8    tcan  tusa
second_clade  OG3164  alternative  4       0.0976  0.406  0.0523  0.5362  6..1    lart  lubb  tcan  tusa
second_clade  OG3196  general      4       0.1980  0.468  0.0768  0.3881  6..1    lart  lubb  tcan  tusa
second_clade  OG3197  general      4       0.0960  1.188  0.1186  1.2349  7..8    lart  lubb  tcan  tusa
second_clade  OG3302  alternative  4       0.1724  0.778  0.1277  0.7410  7..8    lart  lubb  tcan  tusa
second_clade  OG3342  alternative  4       0.1393  0.520  0.0734  0.5267  7..8    lart  lubb  tcan  tusa
second_clade  OG3347  alternative  4       0.1104  0.501  0.0611  0.5537  7..8    lart  lubb  tcan  tusa
second_clade  OG3359  alternative  3       0.0577  0.354  0.0233  0.4028  8..9    lart  lubb  tcan
second_clade  OG3362  alternative  4       0.1477  0.530  0.0741  0.5015  9..10   lart  lubb  tcan  tusa
second_clade  OG3372  alternative  3       0.0452  0.484  0.0296  0.6540  8..9    lart  lubb  tcan
second_clade  OG3387  alternative  4       0.1755  0.704  0.1033  0.5884  9..10   lart  lubb  tcan  tusa
second_clade  OG3395  alternative  4       0.0415  0.183  0.0096  0.2315  7..8    lart  lubb  tcan  tusa
second_clade  OG3399  general      4       0.1089  0.509  0.0592  0.5434  7..8    lart  lubb  tcan  tusa
second_clade  OG3600  alternative  3       0.1459  0.454  0.0655  0.4489  8..9    lart  lubb  tusa
second_clade  OG3622  alternative  4       0.1296  1.112  0.1481  1.1434  7..8    lart  lubb  tcan  tusa
second_clade  OG3640  alternative  4       0.1889  0.963  0.1623  0.8595  9..10   lart  lubb  tcan  tusa
second_clade  OG3648  general      4       0.1708  0.651  0.1002  0.5867  9..10   lart  lubb  tcan  tusa
second_clade  OG3682  alternative  3       0.1649  0.341  0.0519  0.3148  8..9    lart  lubb  tusa
second_clade  OG3683  alternative  4       0.1670  0.255  0.0403  0.2410  7..8    lart  lubb  tcan  tusa
```

Nonetheless these results should be **handeled carefully**: if we allow too much missing data, both in the clade(s) of interest and in the whole tree,
the analyses start to become meaningless. For example: if we want to consider the branch leading to a clade of 50 species, one thing is to allow 5-6 of them
to go missing, but when more than half are not present the analysis doesn't make sense anymore. 
A good approach is to stay conservative and try to explore the tradeoff between the number of OGs considered and the missing data treshold. 

---

[Back](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md) to the tutorials list.
