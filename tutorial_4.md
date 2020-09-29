**Complex models & analyses replicates usage**

---


In the first part of this tutorial we will leverage the clade (#) / branch ($) tagging functionalty. 
For both the general and alternative model we will use a ```.ctl``` which allows user specified branches or clades (foreground) to have different omega classes than the rest (background)
which can be found [here](https://github.com/for-giobbe/BASE/blob/master/example/m2.ctl):

```
seqfile = alignment.phy
outfile = output.txt
treefile = tre.tre
noisy = 0
verbose = 0
runmode = 0
seqtype = 1
CodonFreq = 3
model = 2
NSsites = 0
icode = 4
getSE = 1
fix_blength = 2
```

While we use the same ```.ctl``` we will tag differently two clades: in the general model we will specifiy two clades of interest to have the same omega class, 
while in the alternative model they have different omega class. The files are respectively [here](https://github.com/for-giobbe/BASE/blob/master/example/tag_same.lst) 
and [here](https://github.com/for-giobbe/BASE/blob/master/example/tag_diff.lst). Here is how they look:

```
lart lubb $1
tcan tusa $1
```

```
lart lubb $1
tcan tusa $2
```

We can run the analysis using:

```
    sh BASE.sh --analyze -i _complete_OGs/ -o complete_OGs_analyze_clades -t sp.tre 
    -ma m2.ctl -mb m2.ctl -c 4 -l tag_same.lst -l2 tag_diff.lst
```

Here is the result of the likelihood summary:

```
Ortholog_Cluster  Model1  NSsites_a  Model1np  Model1LnL     Rep1  Model2  NSsites_a.1  Model2np  Model2LnL      Rep2  LRT      df  p.value  significance
OG3126            2       NA         3         -4126.374378  1     2       NA           4         -4125.951623   1     0.8455   1   0.3578   n/s
OG3158            2       NA         3         -3814.052104  1     2       NA           4         -3810.216186   1     7.6718   1   0.0056   **
OG3164            2       NA         3         -5372.238755  1     2       NA           4         -5372.238754   1     0        1   0.9989   n/s
OG3196            2       NA         3         -3360.908271  1     2       NA           4         -3360.398794   1     1.019    1   0.3128   n/s
OG3197            2       NA         3         -3677.121538  1     2       NA           4         -3676.589707   1     1.0637   1   0.3024   n/s
OG3302            2       NA         3         -9053.264092  1     2       NA           4         -9051.828915   1     2.8704   1   0.0902   n/s
OG3342            2       NA         3         -3437.230877  1     2       NA           4         -3437.216262   1     0.0292   1   0.8642   n/s
OG3347            2       NA         3         -9596.388996  1     2       NA           4         -9593.993164   1     4.7917   1   0.0286   *
OG3359            2       NA         3         -3140.059561  1     2       NA           4         -3138.572243   1     2.9746   1   0.0846   n/s
OG3362            2       NA         3         -5714.728104  1     2       NA           4         -5713.991507   1     1.4732   1   0.2248   n/s
OG3372            2       NA         3         -3708.284008  1     2       NA           4         -3706.387761   1     3.7925   1   0.0515   n/s
OG3387            2       NA         3         -4063.241135  1     2       NA           4         -4062.950405   1     0.5815   1   0.4457   n/s
OG3395            2       NA         3         -3884.930938  1     2       NA           4         -3873.364272   1     23.1333  1   0        ***
OG3399            2       NA         3         -3001.431867  1     2       NA           4         -3000.368731   1     2.1263   1   0.1448   n/s
OG3600            2       NA         3         -2863.211741  1     2       NA           4         -2854.223199   1     17.9771  1   0        ***
OG3622            2       NA         3         -3402.125939  1     2       NA           4         -3401.836062   1     0.5798   1   0.4464   n/s
OG3640            2       NA         3         -3334.841932  1     2       NA           4         -3334.78744    1     0.109    1   0.7413   n/s
OG3648            2       NA         3         -10489.07023  1     2       NA           4         -10488.011445  1     2.1176   1   0.1456   n/s
OG3682            2       NA         3         -3703.746639  1     2       NA           4         -3702.983079   1     1.5271   1   0.2165   n/s
OG3683            2       NA         3         -2786.60211   1     2       NA           4         -2785.837636   1     1.5289   1   0.2163   n/s
```

We can proceed further with annotation:

```sh BASE.sh --annotate -i complete_OGs_analyze_clades -o complete_OGs_analyze_clades_annotate```

Then we can extract the metrics relative to the two branches of interest, using the file which can be found [here](https://github.com/for-giobbe/BASE/blob/master/example/branch_clades.lst).

```sh BASE.sh --extract -i complete_OGs_analyze_clades_annotate/ -l branch_clades.lst -n 2```

If we then take a look at the output of the two clades, 
it can be ovserved that, when the general model has been found the best-fit dNdS values are identical, 
while when the alternative model was the best-fit, they are different - implying the two clades have undergone different selection regimes across the two clades:

```
clade      gene    model        OTUs_n  dNdS    t      dN      dS      branch  OTUs
clade_one  OG3126  general      2       0.0349  0.107  0.0049  0.1402  10..11  lart  lubb
clade_one  OG3158  alternative  2       0.2049  0.018  0.0032  0.0157  10..11  lart  lubb
clade_one  OG3164  general      2       0.0648  0.112  0.0100  0.1551  10..11  lart  lubb
clade_one  OG3196  general      2       0.1828  0.722  0.1137  0.6216  10..11  lart  lubb
clade_one  OG3197  general      2       0.0734  0.290  0.0231  0.3143  10..11  lart  lubb
clade_one  OG3302  general      2       0.0845  0.209  0.0210  0.2484  10..11  lart  lubb
clade_one  OG3342  general      2       0.0442  0.222  0.0128  0.2906  10..11  lart  lubb
clade_one  OG3347  alternative  2       0.0745  0.227  0.0206  0.2768  10..11  lart  lubb
clade_one  OG3359  general      2       0.0069  0.149  0.0014  0.1955  10..11  lart  lubb
clade_one  OG3362  general      2       0.0739  0.189  0.0157  0.2131  10..11  lart  lubb
clade_one  OG3372  general      2       0.0141  0.143  0.0030  0.2153  10..11  lart  lubb
clade_one  OG3387  general      2       0.0672  0.125  0.0088  0.1306  10..11  lart  lubb
clade_one  OG3395  alternative  2       0.1922  0.109  0.0185  0.0962  10..11  lart  lubb
clade_one  OG3399  general      2       0.0668  0.136  0.0108  0.1618  10..11  lart  lubb
clade_one  OG3600  alternative  2       0.0184  0.108  0.0028  0.1509  10..11  lart  lubb
clade_one  OG3622  general      2       0.0383  0.207  0.0103  0.2692  10..11  lart  lubb
clade_one  OG3640  general      2       0.0505  0.112  0.0071  0.1397  10..11  lart  lubb
clade_one  OG3648  general      2       0.1340  0.197  0.0258  0.1923  10..11  lart  lubb
clade_one  OG3682  general      2       0.1325  0.135  0.0178  0.1345  10..11  lart  lubb
clade_one  OG3683  general      2       0.0553  0.073  0.0050  0.0913  10..11  lart  lubb
```

```
clade      gene    model        OTUs_n  dNdS    t      dN      dS      branch  OTUs
clade_two  OG3126  general      2       0.0349  0.204  0.0093  0.2675  10..12  tcan  tusa
clade_two  OG3158  alternative  2       0.0356  0.212  0.0099  0.2790  10..12  tcan  tusa
clade_two  OG3164  general      2       0.0648  0.142  0.0127  0.1968  10..12  tcan  tusa
clade_two  OG3196  general      2       0.1828  0.510  0.0802  0.4386  10..12  tcan  tusa
clade_two  OG3197  general      2       0.0734  0.331  0.0264  0.3589  10..12  tcan  tusa
clade_two  OG3302  general      2       0.0845  0.225  0.0225  0.2667  10..12  tcan  tusa
clade_two  OG3342  general      2       0.0442  0.140  0.0081  0.1828  10..12  tcan  tusa
clade_two  OG3347  alternative  2       0.0425  0.228  0.0130  0.3056  10..12  tcan  tusa
clade_two  OG3359  general      2       0.0069  0.167  0.0015  0.2193  10..12  tcan  tusa
clade_two  OG3362  general      2       0.0739  0.306  0.0254  0.3439  10..12  tcan  tusa
clade_two  OG3372  general      2       0.0141  0.153  0.0032  0.2304  10..12  tcan  tusa
clade_two  OG3387  general      2       0.0672  0.238  0.0167  0.2480  10..12  tcan  tusa
clade_two  OG3395  alternative  2       0.0294  0.165  0.0064  0.2168  10..12  tcan  tusa
clade_two  OG3399  general      2       0.0668  0.222  0.0177  0.2642  10..12  tcan  tusa
clade_two  OG3600  alternative  2       0.2032  0.102  0.0182  0.0895  10..12  tcan  tusa
clade_two  OG3622  general      2       0.0383  0.214  0.0107  0.2780  10..12  tcan  tusa
clade_two  OG3640  general      2       0.0505  0.153  0.0097  0.1913  10..12  tcan  tusa
clade_two  OG3648  general      2       0.1340  0.220  0.0288  0.2149  10..12  tcan  tusa
clade_two  OG3682  general      2       0.1325  0.101  0.0133  0.1004  10..12  tcan  tusa
clade_two  OG3683  general      2       0.0553  0.243  0.0168  0.3042  10..12  tcan  tusa
```

---

BASE also allows models which allow different dN/dS values among different alignement sites.
Let's use the ubiquitous OGs and ```.ctl```  which has one omega class across all branches and all sites as the general model,
and one with NSsites=3 , such as the one provided [here](https://github.com/for-giobbe/BASE/blob/master/example/m0_NS3.ctl) - as an alternative model

```
seqfile = alignment.phy
outfile = output.txt
treefile = tre.tre
noisy = 0
verbose = 0
runmode = 0
seqtype = 1
CodonFreq = 3
model = 0
NSsites = 3
icode = 4
getSE = 0
fix_blength = 2
```

Let's use the line:

```
    sh BASE.1.9.sh --analyze -i _complete_OGs/ -o complete_OGs_analyze_NSsites 
    -t sp.tre -ma m0.ctl -mb m0_NS3.ctl -c 4
```

The likelihood summary which has been generated in the output folder shows that all genes passed the LRT and 

```
Ortholog_Cluster  Model1  NSsites_a  Model1np  Model1LnL      Rep1  Model2  NSsites_a.1  Model2np  Model2LnL      Rep2  LRT       df  p.value  significance
OG3126            0       NA         2         -4132.017209   1     0       NA           8         -4086.882015   1     90.2704   6   0        ***
OG3158            0       NA         2         -3818.030135   1     0       NA           8         -3772.584619   1     90.891    6   0        ***
OG3164            0       NA         2         -5374.980383   1     0       NA           8         -5304.139456   1     141.6819  6   0        ***
OG3196            0       NA         2         -3365.98055    1     0       NA           8         -3279.872989   1     172.2151  6   0        ***
OG3197            0       NA         2         -3680.783168   1     0       NA           8         -3611.208846   1     139.1486  6   0        ***
OG3302            0       NA         2         -9054.676043   1     0       NA           8         -8884.092991   1     341.1661  6   0        ***
OG3342            0       NA         2         -3444.803353   1     0       NA           8         -3379.341607   1     130.9235  6   0        ***
OG3347            0       NA         2         -9597.616313   1     0       NA           8         -9443.970478   1     307.2917  6   0        ***
OG3359            0       NA         2         -3147.226951   1     0       NA           8         -3119.670872   1     55.1122   6   0        ***
OG3362            0       NA         2         -5722.861684   1     0       NA           8         -5640.13579    1     165.4518  6   0        ***
OG3372            0       NA         2         -3710.675722   1     0       NA           8         -3691.491562   1     38.3683   6   0        ***
OG3387            0       NA         2         -4067.125785   1     0       NA           8         -4024.065264   1     86.121    6   0        ***
OG3395            0       NA         2         -3901.33739    1     0       NA           8         -3889.142938   1     24.3889   6   4e-04    ***
OG3399            0       NA         2         -3003.011552   1     0       NA           8         -2959.338795   1     87.3455   6   0        ***
OG3600            0       NA         2         -2867.120583   1     0       NA           8         -2835.05711    1     64.1269   6   0        ***
OG3622            0       NA         2         -3407.557493   1     0       NA           8         -3379.421493   1     56.272    6   0        ***
OG3640            0       NA         2         -3342.883393   1     0       NA           8         -3317.365453   1     51.0359   6   0        ***
OG3648            0       NA         2         -10491.352418  1     0       NA           8         -10362.379639  1     257.9456  6   0        ***
OG3682            0       NA         2         -3703.868866   1     0       NA           8         -3662.590623   1     82.5565   6   0        ***
OG3683            0       NA         2         -2791.481942   1     0       NA           8         -2775.466035   1     32.0318   6   0        ***
```

---

Lastly we will carry out a branch-site model, which consists in a mix between branch-specific and site-specific models. you will finde the ```.ctl``` files for the
general and alternative models respectively [here](https://github.com/for-giobbe/BASE/blob/master/example/m_branch_site_gen.ctl) 
and [here](https://github.com/for-giobbe/BASE/blob/master/example/m_branch_site_alt.ctl), 
along the file to tag our branch of interest [here](https://github.com/for-giobbe/BASE/blob/master/example/tag_branch_site.lst). 
We will also carry out 5 different replicates - using the ```-r``` flag - so that the one wi the besy -lnL is chosen, resulting in a more precise analysis. 
This is the line to launch the analysis:

```
    sh BASE.1.9.sh --analyze -i _complete_OGs/ -o complete_OGs_analyze_branch_site -t sp.tre 
    -ma m_branch_site_gen.ctl -mb m_branch_site_alt.ctl -l tag_branch_site.lst -l2 tag_branch_site.lst -r 3 -c 4 -v
```

We can then inspect the output of the likelihood summary:

```
Ortholog_Cluster  Model1  NSsites_a  Model1np  Model1LnL     Rep1  Model2  NSsites_a.1  Model2np  Model2LnL     Rep2  LRT     df  p.value  significance
OG3126            2       NA         4         -4108.905187  1     2       NA           5         -4107.471035  1     2.8683  1   0.0903   n/s
OG3158            2       NA         4         -3795.537032  1     2       NA           5         -3795.537032  1     0       1   1        n/s
OG3164            2       NA         4         -5326.864502  1     2       NA           5         -5326.864503  1     0       1   1        n/s
OG3196            2       NA         4         -3287.050015  1     2       NA           5         -3286.841551  1     0.4169  1   0.5185   n/s
OG3197            2       NA         4         -3623.298938  1     2       NA           5         -3623.298938  1     0       1   1        n/s
OG3302            2       NA         4         -8911.697147  1     2       NA           5         -8911.697147  1     0       1   1        n/s
OG3342            2       NA         4         -3404.532625  1     2       NA           5         -3404.532625  1     0       1   1        n/s
OG3347            2       NA         4         -9499.288353  1     2       NA           5         -9497.793637  1     2.9894  1   0.0838   n/s
OG3359            2       NA         4         -3131.472756  1     2       NA           5         -3131.472756  1     0       1   1        n/s
OG3362            2       NA         4         -5667.803294  1     2       NA           5         -5666.883737  1     1.8391  1   0.1751   n/s
OG3372            2       NA         4         -3701.094933  1     2       NA           5         -3701.094933  1     0       1   1        n/s
OG3395            2       NA         4         -3898.643714  1     2       NA           5         -3897.257103  1     2.7732  1   0.0959   n/s
OG3399            2       NA         4         -2983.357611  1     2       NA           5         -2983.357611  1     0       1   1        n/s
OG3600            2       NA         4         -2843.435359  1     2       NA           5         -2843.435359  1     0       1   1        n/s
OG3622            2       NA         4         -3403.301033  1     2       NA           5         -3403.244384  1     0.1133  1   0.7364   n/s
OG3640            2       NA         4         -3328.867214  1     2       NA           5         -3328.867214  1     0       1   1        n/s
OG3682            2       NA         4         -3667.782582  1     2       NA           5         -3667.782583  1     0       1   1        n/s
OG3683            2       NA         4         -2780.761592  1     2       NA           5         -2778.824226  1     3.8747  1   0.049    *
```

It's then possible to proceed further with the ```--annotate``` and ```--extract``` steps.

---

[Back](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md) to the tutorials list.
