**retrive omega values of specific branches in ubiquitous genes clusters**

---

In this tutorial we will compare through a Likelihood Ratio Test (LRT from now on)
a model with a single omega values across all the branch of our phylogeny versus a model in which all the branches have different omegas, for each OG; subsequently 
we will extract omega (along with dN dS and substitution rate) for specific branches. This analysis will focus only on OGs of ubiquitus genes,
in which a single copy gene is present for each species. 
After moving to the [example folder](https://github.com/for-giobbe/BASE/tree/master/example) we can quickly revise what's needed to start our analysis:

* a species tree - in the newick format - which present all the species considered;
no branchlengths are needed as they will be optimized for each gene through our analysis.

* two codeml ```.ctl``` files, which describe the model we want to use / compare in our analysis. As stated before, in this analysis we will compare 
a [model](https://github.com/for-giobbe/BASE/blob/master/example/m0.ctl) where there is one omega shared by all branches and (codeml model 1) and
a (model)[https://github.com/for-giobbe/BASE/blob/master/example/m1.ctl] where each branch has it's own omega (codeml model 1);
every parameter of the ```.ctl``` files can still be modified

* a folder of aligned OGs. These alignment shouldn't have any STOP codon, yet BASE will check for them, discard and report the OGs wehre they are found.
Cosider that alignment quality will substantially impact the quality of downstraeam analysis.

---

To start the analysis just use the line:

```BASE.1.9.sh --analyze -i complete_OGs/ -o complete_OGs_analyze -t sp.tre -ma m0.ctl -mb m1.ctl -c 4```

Some information are printed to the standard output, including potential errors, as can be seen from the second-last line:

```
  analysis started on Fri Sep 25 14:02:08 CEST 2020

  analyizing 1 replicate(s) of 21 genes: model 0 VS 1 & NSsites 0 VS 0 

  analyze:	100/100 

  performing LRT 

  formatting output 

  the analysis has produced some warning: you will find the information relative to each failure in the file warning_summary.txt

  analysis finished on Fri Sep 25 14:07:19 CEST 2020 
```

Inside the  output folder ```complete_OGs_analyze``` you will find a ```warnings_summary.txt```.
If you ```cat``` the file, you can read all the warnings generated by the analysis, such as:
```the gene OG3105.mafft.n.aln contains missing data and has been excluded by the analyses - to include it use the -d flag```
This is because an OG misses one of the 11 species which are present in the species tree. This OG can be included as we'll se in the further tutorial.
The analysis has also generated a ```.out``` file for each OG, which also state whether the general or alternative model was
the best-fit for the data and - if specified - the best replicate. We'll need these outputs for the following steps
A rather important file is the summary of the LRTs. Type ```column -t complete_OGs_analyze/likelihood_summary.txt``` to take a look at it:

```
Ortholog_Cluster  Model1  NSsites_a  Model1np  Model1LnL      Rep1  Model2  NSsites_a.1  Model2np  Model2LnL     Rep2  LRT      df  p.value  significance
OG3126.mafft.n    0       NA         2         -4132.017209   1     1       NA           12        -4116.792933  1     30.4486  10  7e-04    ***
OG3158.mafft.n    0       NA         2         -3818.030135   1     1       NA           12        -3801.882145  1     32.296   10  4e-04    ***
OG3164.mafft.n    0       NA         2         -5374.980383   1     1       NA           12        -5358.727983  1     32.5048  10  3e-04    ***
OG3196.mafft.n    0       NA         2         -3365.98055    1     1       NA           12        -3355.771214  1     20.4187  10  0.0255   *
OG3197.mafft.n    0       NA         2         -3680.783168   1     1       NA           12        -3671.481767  1     18.6028  10  0.0456   *
OG3302.mafft.n    0       NA         2         -9054.676043   1     1       NA           12        -9028.37395   1     52.6042  10  0        ***
OG3342.mafft.n    0       NA         2         -3444.803353   1     1       NA           12        -3431.378852  1     26.849   10  0.0028   **
OG3347.mafft.n    0       NA         2         -9597.616313   1     1       NA           12        -9586.571185  1     22.0903  10  0.0147   *
OG3359.mafft.n    0       NA         2         -3147.226951   1     1       NA           12        -3126.908131  1     40.6376  10  0        ***
OG3362.mafft.n    0       NA         2         -5722.861684   1     1       NA           12        -5706.727938  1     32.2675  10  4e-04    ***
OG3372.mafft.n    0       NA         2         -3710.675722   1     1       NA           12        -3695.63184   1     30.0878  10  8e-04    ***
OG3387.mafft.n    0       NA         2         -4067.125785   1     1       NA           12        -4057.24774   1     19.7561  10  0.0316   *
OG3395.mafft.n    0       NA         2         -3901.33739    1     1       NA           12        -3841.403883  1     119.867  10  0        ***
OG3399.mafft.n    0       NA         2         -3003.011552   1     1       NA           12        -2990.356715  1     25.3097  10  0.0048   **
OG3600.mafft.n    0       NA         2         -2867.120583   1     1       NA           12        -2844.358272  1     45.5246  10  0        ***
OG3622.mafft.n    0       NA         2         -3407.557493   1     1       NA           12        -3388.589881  1     37.9352  10  0        ***
OG3640.mafft.n    0       NA         2         -3342.883393   1     1       NA           12        -3317.158544  1     51.4497  10  0        ***
OG3648.mafft.n    0       NA         2         -10491.352418  1     1       NA           12        -10484.2421   1     14.2206  10  0.1632   n/s
OG3682.mafft.n    0       NA         2         -3703.868866   1     1       NA           12        -3690.236972  1     27.2638  10  0.0024   **
OG3683.mafft.n    0       NA         2         -2791.481942   1     1       NA           12        -2774.797116  1     33.3697  10  2e-04    ***
```

This output is quite self-explanatory, and the more important outcome of this table is the result of the LRTs which are found in the last two columns.

---

Subsequently we can proceed to the further step, ```annotate```, whcih
takes as input the folder generated by the previous step and will write a new folder - specified through the ```-o``` flag
In the output folder you will find the original  ```.out ``` and also some  ```.result ```, which contains
a) the nodes annotation created by codeml and b) the OTUs which are downstream of each codeml branch. Type:

```sh BASE.1.9.sh --annotate -i complete_OGs_analyze/ -o complete_OGs_annotate```

and here goes the standard output:

```
  analysis started on Fri Sep 25 14:58:43 CEST 2020

  annotating 20 codeml outputs 

  annotate:	100/100
  
  analysis finished on Fri Sep 25 15:02:59 CEST 2020 
```

---

In the last step we proceed to extract the values relative to the branch(es) which we are interested in. 
We will specify each internal branch using a file like [this](https://github.com/for-giobbe/BASE/blob/master/example/branch.lst) which contains on each line all the species which
form the clade relative to our branch of interested - separated by single spaces - followed by an identifier.
If we are interested in a terminal branch relative to a single tip, just specify the tip name in the tree and an identifier.
let's take a look to such file:

```
dmag dpul clade_1
dmag dmag
``` 

We also need to specify the minimum number of species to consider a clade: the latter can be expressed with an
absolute number - such as 3 - or via a proportion - such as 0.9. When we are not considering missing data we can just specify ```-n 0```. 
Let's extract the values of the branch leading to the two species dmag and dpul, using the line:

```sh BASE.1.9.sh --extract -i complete_OGs_annotate -l branch.lst -n 2```.

We can then see the output by typing```column -t complete_OGs_annotate/branch.clade_1.min.otu.2.dNdS.summary ```; ss you can see
each line of the label file generates an output, named with the name of their clade /tip and the treshold of missing data. This is an ouput for a clade:

```
clade    gene            OTUs_n  dNdS    t      dN      dS
clade_1  OG3126.mafft.n  2       0.0978  0.518  0.0559  0.5711
clade_1  OG3158.mafft.n  2       0.1264  0.482  0.0628  0.4966
clade_1  OG3164.mafft.n  2       0.1314  0.425  0.0630  0.4796
clade_1  OG3196.mafft.n  2       0.1297  0.505  0.0629  0.4844
clade_1  OG3197.mafft.n  2       0.1381  0.639  0.0826  0.5982
clade_1  OG3302.mafft.n  2       0.1491  0.392  0.0588  0.3945
clade_1  OG3342.mafft.n  2       0.1238  0.389  0.0507  0.4097
clade_1  OG3347.mafft.n  2       0.0735  0.375  0.0336  0.4580
clade_1  OG3359.mafft.n  2       0.0299  0.324  0.0119  0.3978
clade_1  OG3362.mafft.n  2       0.1541  0.398  0.0573  0.3717
clade_1  OG3372.mafft.n  2       0.0219  0.318  0.0102  0.4656
clade_1  OG3387.mafft.n  2       0.0953  0.292  0.0272  0.2857
clade_1  OG3395.mafft.n  2       0.0476  0.218  0.0130  0.2727
clade_1  OG3399.mafft.n  2       0.1391  0.625  0.0864  0.6212
clade_1  OG3600.mafft.n  2       0.2059  0.207  0.0370  0.1798
clade_1  OG3622.mafft.n  2       0.0965  0.530  0.0566  0.5867
clade_1  OG3640.mafft.n  2       0.1355  0.411  0.0559  0.4127
clade_1  OG3648.mafft.n  2       0.1708  0.471  0.0726  0.4250
clade_1  OG3682.mafft.n  2       0.1398  0.277  0.0378  0.2705
clade_1  OG3683.mafft.n  2       0.1825  0.407  0.0679  0.3720
```

Here is how an output for a terminal branche should look like:

```
clade  gene            dNdS    t      dN      dS
dmag   OG3126.mafft.n  0.0201  0.085  0.0023  0.1171
dmag   OG3158.mafft.n  0.0603  0.109  0.0081  0.1336
dmag   OG3164.mafft.n  0.0424  0.155  0.0098  0.2321
dmag   OG3196.mafft.n  0.0571  0.269  0.0174  0.3055
dmag   OG3197.mafft.n  0.0705  0.286  0.0220  0.3122
dmag   OG3302.mafft.n  0.0476  0.144  0.0091  0.1906
dmag   OG3342.mafft.n  0.0844  0.118  0.0116  0.1371
dmag   OG3347.mafft.n  0.0618  0.223  0.0174  0.2820
dmag   OG3359.mafft.n  0.0001  0.020  0.0000  0.0272
dmag   OG3362.mafft.n  0.0981  0.141  0.0147  0.1497
dmag   OG3372.mafft.n  0.0036  0.095  0.0005  0.1492
dmag   OG3387.mafft.n  0.0749  0.102  0.0078  0.1047
dmag   OG3395.mafft.n  0.0001  0.104  0.0000  0.1499
dmag   OG3399.mafft.n  0.0530  0.148  0.0097  0.1832
dmag   OG3600.mafft.n  0.1323  0.064  0.0087  0.0658
dmag   OG3622.mafft.n  0.0198  0.187  0.0051  0.2584
dmag   OG3640.mafft.n  0.0613  0.159  0.0118  0.1930
dmag   OG3648.mafft.n  0.1708  0.125  0.0193  0.1127
dmag   OG3682.mafft.n  0.0294  0.094  0.0036  0.1219
dmag   OG3683.mafft.n  0.0290  0.090  0.0035  0.1220
```

These tables are rather self explanatory as well, and represent the final output of our analysis.

---

Click [here](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md) to go back to the tutorials list.