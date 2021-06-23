** replicate analyses & species-tree VS species-tree **

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

If we take a look to the likelihood summary we can appreciate that for some OGs different replicates have generated different likelihood values. 
The ```rep_g``` and ```rep_a``` columns report which replicate analysis had the "best" likelihood: in the general model the first replicate has been allways selected -
implying that the likelihood didn't vary among replicate analyses - while in the alternative model different analyses have been chosen for some OGs.

```

sh ../BASE.sh --analyze --input _ubiquitous_OGs/ --output _ubiquitous_OGs_0VS1_10rep 
--s_tree spp_tree.nwk --model_g m0.ctl --model_a m1.ctl --cores 4 -v --replicates 10

```

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

sh ../BASE.sh --analyze --input _ubiquitous_OGs/ --output _ubiquitous_OGs_0VS1_genetree 
--model_g m0.ctl --model_a m1.ctl --cores 4 -v --g_tree

```

Note that when using the ```--g_tree``` flag no species-tree needs to be specified.
The subsequent ```extract``` step to retrieve specific branch(es) or clade(s) metrics can be still carried out:
terminal branches will be allways present despite possible differences between gene-tree and the species-tree
but internal branches / clades may not be present ( _i.e._ be paraphyletic or polyphyletic) in the gene tree.
BASE will check wether the clade/branch of interest can be still identified in the gene tree topology and
- only if present - report the associated metrics. For example we can run: 

```

sh ../BASE.sh --annotate --input _ubiquitous_OGs_0VS1_genetree --labels clade_of_interest --min_spp x 

```


