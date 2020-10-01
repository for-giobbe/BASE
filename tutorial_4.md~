**Complex models & analyses replicates**

---


In this part of the tutorial we will leverage the clade (#) / branch ($) tagging functionalty .

```
    sh BASE.sh --analyze -i _complete_OGs/ -o complete_OGs_analyze_clades 
    -t sp.tre -ma m0.ctl -mb m2.ctl -c 4 -d 
    -l tag_same.lst -l2 tag_diff.lst```
```

```
Ortholog_Cluster  Model1  NSsites_a  Model1np  Model1LnL      Rep1  Model2  NSsites_a.1  Model2np  Model2LnL      Rep2  LRT      df  p.value  significance
OG3105            0       NA         2         -5241.508221   1     2       NA           3         -5241.070044   1     0.8764   1   0.3492   n/s
OG3126            0       NA         2         -4132.017209   1     2       NA           4         -4127.83591    1     8.3626   2   0.0153   *
OG3158            0       NA         2         -3818.030135   1     2       NA           4         -3810.358255   1     15.3438  2   5e-04    ***
OG3164            0       NA         2         -5374.980383   1     2       NA           4         -5373.852274   1     2.2562   2   0.3236   n/s
OG3196            0       NA         2         -3365.98055    1     2       NA           4         -3358.486049   1     14.989   2   6e-04    ***
OG3197            0       NA         2         -3680.783168   1     2       NA           4         -3675.90942    1     9.7475   2   0.0076   **
OG3302            0       NA         2         -9054.676043   1     2       NA           4         -9051.915521   1     5.521    2   0.0633   n/s
OG3342            0       NA         2         -3444.803353   1     2       NA           4         -3436.439699   1     16.7273  2   2e-04    ***
OG3347            0       NA         2         -9597.616313   1     2       NA           4         -9593.160792   1     8.911    2   0.0116   *
OG3359            0       NA         2         -3147.226951   1     2       NA           4         -3139.261242   1     15.9314  2   3e-04    ***
OG3362            0       NA         2         -5722.861684   1     2       NA           4         -5714.936329   1     15.8507  2   4e-04    ***
OG3372            0       NA         2         -3710.675722   1     2       NA           4         -3706.474579   1     8.4023   2   0.015    *
OG3387            0       NA         2         -4067.125785   1     2       NA           4         -4063.48902    1     7.2735   2   0.0263   *
OG3395            0       NA         2         -3901.33739    1     2       NA           4         -3891.655412   1     19.364   2   1e-04    ***
OG3399            0       NA         2         -3003.011552   1     2       NA           4         -3000.226596   1     5.5699   2   0.0617   n/s
OG3600            0       NA         2         -2867.120583   1     2       NA           4         -2858.329414   1     17.5823  2   2e-04    ***
OG3622            0       NA         2         -3407.557493   1     2       NA           4         -3401.823165   1     11.4687  2   0.0032   **
OG3640            0       NA         2         -3342.883393   1     2       NA           4         -3335.087473   1     15.5918  2   4e-04    ***
OG3648            0       NA         2         -10491.352418  1     2       NA           4         -10487.570129  1     7.5646   2   0.0228   *
OG3682            0       NA         2         -3703.868866   1     2       NA           4         -3703.465076   1     0.8076   2   0.6678   n/s
OG3683            0       NA         2         -2791.481942   1     2       NA           4         -2789.801519   1     3.3608   2   0.1863   n/s
```

```sh BASE.sh --annotate -i complete_OGs_analyze_clades -o complete_OGs_analyze_clades_annotate```

```sh BASE.sh --extract -i complete_OGs_analyze_clades_annotate/ -l branch_clades.lst -n 2```

```
clade      gene    OTUs_n  dNdS    t      dN      dS
clade_one  OG3105  2       0.1030  0.270  0.0289  0.2809
clade_one  OG3126  2       0.0349  0.107  0.0049  0.1402
clade_one  OG3158  2       0.2049  0.018  0.0032  0.0157
clade_one  OG3164  2       0.0648  0.112  0.0100  0.1551
clade_one  OG3196  2       0.1828  0.722  0.1137  0.6216
clade_one  OG3197  2       0.0734  0.290  0.0231  0.3143
clade_one  OG3302  2       0.0845  0.209  0.0210  0.2484
clade_one  OG3342  2       0.0442  0.222  0.0128  0.2906
clade_one  OG3347  2       0.0745  0.227  0.0206  0.2768
clade_one  OG3359  2       0.0069  0.149  0.0014  0.1955
clade_one  OG3362  2       0.0739  0.189  0.0157  0.2131
clade_one  OG3372  2       0.0141  0.143  0.0030  0.2153
clade_one  OG3387  2       0.0672  0.125  0.0088  0.1306
clade_one  OG3395  2       0.1922  0.109  0.0185  0.0962
clade_one  OG3399  2       0.0668  0.136  0.0108  0.1618
clade_one  OG3600  2       0.0184  0.108  0.0028  0.1509
clade_one  OG3622  2       0.0383  0.207  0.0103  0.2692
clade_one  OG3640  2       0.0505  0.112  0.0071  0.1397
clade_one  OG3648  2       0.1340  0.197  0.0258  0.1923
clade_one  OG3682  2       0.1325  0.135  0.0178  0.1345
clade_one  OG3683  2       0.0553  0.073  0.0050  0.0913
```

```
clade      gene    OTUs_n  dNdS       t      dN      dS
clade_two  OG3105  0       no_branch
clade_two  OG3126  2       0.0349     0.204  0.0093  0.2675
clade_two  OG3158  2       0.0356     0.212  0.0099  0.2790
clade_two  OG3164  2       0.0648     0.142  0.0127  0.1968
clade_two  OG3196  2       0.1828     0.510  0.0802  0.4386
clade_two  OG3197  2       0.0734     0.331  0.0264  0.3589
clade_two  OG3302  2       0.0845     0.225  0.0225  0.2667
clade_two  OG3342  2       0.0442     0.140  0.0081  0.1828
clade_two  OG3347  2       0.0425     0.228  0.0130  0.3056
clade_two  OG3359  2       0.0069     0.167  0.0015  0.2193
clade_two  OG3362  2       0.0739     0.306  0.0254  0.3439
clade_two  OG3372  2       0.0141     0.153  0.0032  0.2304
clade_two  OG3387  2       0.0672     0.238  0.0167  0.2480
clade_two  OG3395  2       0.0294     0.165  0.0064  0.2168
clade_two  OG3399  2       0.0668     0.222  0.0177  0.2642
clade_two  OG3600  2       0.2032     0.102  0.0182  0.0895
clade_two  OG3622  2       0.0383     0.214  0.0107  0.2780
clade_two  OG3640  2       0.0505     0.153  0.0097  0.1913
clade_two  OG3648  2       0.1340     0.220  0.0288  0.2149
clade_two  OG3682  2       0.1325     0.101  0.0133  0.1004
clade_two  OG3683  2       0.0553     0.243  0.0168  0.3042
```

dNdS values are the same when the general model won.

---

BASE also allows models which allow different dN/dS values among different alignement sites. 
Let's use the ubiquitous OGs and ```.ctl```  which has one omega class across all branches and all sites as the general model,
and one with NSsites=3 , such as the one provided here - as an alternative model

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
    sh BASE.sh --analyze -i _complete_OGs/ -o complete_OGs_analyze_NSsites 
    -t sp.tre -ma m0.ctl -mb m0_NS3.ctl -c 4
```

The likelihood summary which has been generated in the output folder shows that all genes passed the LRT.

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

Lastly we will carry out a branch-site model, which is a mix between branch-specific and site-specific models.

```
sh BASE.sh --analyze -i _complete_OGs/ -o complete_OGs_analyze_branch_site 
-t sp.tre -ma m_branch_site_gen.ctl -mb m_branch_site_alt.ctl 
-l tag_branch_site.lst -l2 tag_branch_site.lst -c 4
```

---

[Back](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md) to the tutorials list.
