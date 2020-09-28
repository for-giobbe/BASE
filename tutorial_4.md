**Complex models & analyses replicates usage**

---


In the first part of this tutorial we will leverage the clade / branch tagging functionalty.

```sh BASE.1.9.sh --analyze -i _complete_OGs/ -o complete_OGs_analyze_clades -t sp.tre -ma m0.ctl -mb m2.ctl -c 4 -d -l tag_same.lst -l2 tag_diff.lst```

```
column -t complete_OGs_analyze_clades/likelihood_summary.txt
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

```sh BASE.1.9.sh --annotate -i complete_OGs_analyze_clades -o complete_OGs_analyze_clades_annotate```

```sh BASE.1.9.sh --extract -i complete_OGs_analyze_clades_annotate/ -l branch_clades.lst -n 2```

---

Here we use NSsites models

---

replicates + branch-site
