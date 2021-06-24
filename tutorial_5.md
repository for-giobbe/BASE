**replicate analyses & species-tree VS species-tree**

---

In the first half of this tutorial we will leverage replicate analyses: codeml models with a high number of parameters may have issues with local optima 
and it's good practice to run analyses multiple times with varying starting values in order to obtain the global optimum.
Through the ```--replicates``` flag, BASE allows to carry out a user-specified number of replicate analyses incorporating random - from 0.0 to 3.2 - omega starting values.
The replicate analysis which has the best likelihood values will be then selected, substantially strengthening our confidence in the result.

Let's run an analysis using as an alternative mode the parameter-rich model 1, wich allows each branch of the phylogeny to have its own omega.
Please note that - despite beeing frequently used - this "free ratio" model is discouraged by PAML authors themselves; nonetheless in this context it
provides a good example of a parameter-rich model.

```

sh ../BASE.sh --analyze --input _ubiquitous_OGs/ --output _ubiquitous_OGs_0VS1_10rep 
--s_tree spp_tree.nwk --model_g m0.ctl --model_a m1.ctl --cores 4 -v --replicates 10

```

If we take a look to the ```likelihood_summary.txt``` we can appreciate that for some OGs different replicates have generated different likelihood values. 

```

OG      branch_model_g  site_model_g  model_g_np  model_g_LnL    rep_g  branch_model_a  site_model_a  model_a_np  model_a_LnL    rep_a  nRF   LRT      df  p.value  significance
OG3105  0               0             2           -5241.508221   1      1               0             8           -5234.516739   1      0     13.983   6   0.0298   n/s
OG3126  0               0             2           -4132.017209   1      1               0             12          -4116.792932   1      0     30.4486  10  7e-04    **
OG3158  0               0             2           -3818.030135   1      1               0             12          -3801.882145   1      0.25  32.296   10  4e-04    **
OG3164  0               0             2           -5374.980383   1      1               0             12          -5358.727936   1      0     32.5049  10  3e-04    **
OG3196  0               0             2           -3365.98055    1      1               0             12          -3355.771198   2      0     20.4187  10  0.0255   n/s
OG3197  0               0             2           -3680.783168   1      1               0             12          -3671.481745   1      0     18.6028  10  0.0456   n/s
OG3302  0               0             2           -9054.676043   1      1               0             12          -9028.373456   1      0     52.6052  10  0        ***
OG3342  0               0             2           -3444.803353   1      1               0             12          -3431.378852   4      0     26.849   10  0.0028   *
OG3347  0               0             2           -9597.616313   1      1               0             12          -9586.571177   10     0     22.0903  10  0.0147   n/s
OG3359  0               0             2           -3147.226951   1      1               0             12          -3126.908123   2      0     40.6377  10  0        ***
OG3362  0               0             2           -5722.861684   1      1               0             12          -5706.727937   2      0     32.2675  10  4e-04    **
OG3372  0               0             2           -3710.675722   1      1               0             12          -3695.631697   4      0     30.0881  10  8e-04    **
OG3387  0               0             2           -4067.125785   1      1               0             12          -4057.247711   6      0     19.7561  10  0.0316   n/s
OG3395  0               0             2           -3901.33739    1      1               0             12          -3841.403883   1      0     119.867  10  0        ***
OG3399  0               0             2           -3003.011552   1      1               0             12          -2990.356713   4      0     25.3097  10  0.0048   *
OG3600  0               0             2           -2867.120583   1      1               0             12          -2844.358272   1      0     45.5246  10  0        ***
OG3622  0               0             2           -3407.557493   1      1               0             12          -3388.589881   1      0     37.9352  10  0        ***
OG3640  0               0             2           -3342.883393   1      1               0             12          -3317.158542   4      0     51.4497  10  0        ***
OG3648  0               0             2           -10491.352418  1      1               0             12          -10484.242083  7      0     14.2207  10  0.1632   n/s
OG3682  0               0             2           -3703.868866   1      1               0             12          -3690.236956   3      0     27.2638  10  0.0024   *
OG3683  0               0             2           -2791.481942   1      1               0             12          -2774.797107   9      0     33.3697  10  2e-04    **

```

The ```rep_g``` and ```rep_a``` columns report which replicate analysis had the "best" likelihood: in the general model all replicates have the same likelihood -
replicate 1 is selected when they are all equal - while in the alternative model different analyses have been chosen for some OGs.

While replicates can be unimportant in "simple" analyses, they can play a key role when there are a lot of parameters (omega classes and / or species).

---

In the second half of this tutorial we will explore how to check for potential biases in omega estimation
associated to artefactual substitution rate variation. This phenomenon can occur when substitutions that occur on discordant gene trees 
are analyzed in the context of a fixed species tree. For a primer on the topic you can check [this](https://doi.org/10.1093/sysbio/syw018) papers.

In the Likelihood summary file which is generated - such as the one generated in the first half of this tutorial - you can spot
a "nRF" column which includes normalized Robinson Fould distance between the species tree and the gene tree inferred for each OG.
The user can then decide to exclude analyses whwere there is a strong conflict between gene-tree and species-tree topologies, 
as this can lead to biased parameter estimation when they are inferred on a fixed species-tree.

In this instance, BASE allows to carry out analyses on the gene-tree topology inferred for each OG - using the ```--g_tree``` flag - such as in:

```

sh ../BASE.sh --analyze --input _non-ubiquitous_OGs/ --output _ubiquitous_OGs_0VS1_genetree 
--model_g m0.ctl --model_a m1.ctl --cores 4 -v --g_tree

```

Note that when using the ```--g_tree``` flag no species-tree needs to be specified.
The subsequent ```extract``` step to retrieve specific branch(es) or clade(s) metrics can be still carried out:
terminal branches will be allways present despite possible differences between gene-tree and the species-tree
but internal branches / clades may not be present ( _i.e._ be paraphyletic or polyphyletic) in the gene tree.
BASE will check wether the clade/branch of interest can be still identified in the gene tree topology and - 
only if present - report the associated metrics. For example we can run: 

```

sh ../BASE.sh --extract --input _ubiquitous_OGs_0VS1_genetree --labels smaller_clade --min_spp x

```

Then we can check the ```_non-ubiquitous_OGs_0VS1_genetree/extract.smaller_clade.min.spp.2.dNdS.summary``` file.

```

branch/clade 	 OG 	 spp_n 	 dNdS 	 t 	 dN 	 dS
smaller_clade 	 OG3105 	 2 	 0.0724 	 0.270 	 0.0219 	 0.3029
smaller_clade 	 OG3126 	 2 	 0.0243 	 0.107 	 0.0035 	 0.1451
smaller_clade 	 OG3158 	 non-monophyletic
smaller_clade 	 OG3164 	 2 	 0.0955 	 0.112 	 0.0134 	 0.1405
smaller_clade 	 OG3196 	 2 	 0.1364 	 0.722 	 0.0931 	 0.6826
smaller_clade 	 OG3197 	 2 	 0.1076 	 0.290 	 0.0312 	 0.2902
smaller_clade 	 OG3302 	 2 	 0.0973 	 0.209 	 0.0233 	 0.2399
smaller_clade 	 OG3342 	 2 	 0.0298 	 0.222 	 0.0091 	 0.3045
smaller_clade 	 OG3347 	 2 	 0.0697 	 0.227 	 0.0196 	 0.2806
smaller_clade 	 OG3359 	 2 	 0.0129 	 0.149 	 0.0025 	 0.1922
smaller_clade 	 OG3362 	 2 	 0.0899 	 0.189 	 0.0184 	 0.2046
smaller_clade 	 OG3372 	 2 	 0.0325 	 0.143 	 0.0066 	 0.2019
smaller_clade 	 OG3387 	 2 	 0.1054 	 0.125 	 0.0127 	 0.1202
smaller_clade 	 OG3395 	 2 	 0.0054 	 0.109 	 0.0008 	 0.1554
smaller_clade 	 OG3399 	 2 	 0.0772 	 0.136 	 0.0121 	 0.1573
smaller_clade 	 OG3600 	 2 	 0.0368 	 0.108 	 0.0052 	 0.1424
smaller_clade 	 OG3622 	 2 	 0.0440 	 0.207 	 0.0117 	 0.2652
smaller_clade 	 OG3640 	 2 	 0.0447 	 0.112 	 0.0064 	 0.1429
smaller_clade 	 OG3648 	 2 	 0.1708 	 0.197 	 0.0304 	 0.1778
smaller_clade 	 OG3682 	 2 	 0.1103 	 0.135 	 0.0156 	 0.1418
smaller_clade 	 OG3683 	 2 	 0.0608 	 0.073 	 0.0055 	 0.0899

```

As we can see - for some OGs - the target clade is non monophyletic
in the gene tree and no metric will be reported.

---

[Back](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md) to the tutorials list.

