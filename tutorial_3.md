**implement non-ubiquitous genes OGs in the analysis**

---

This tutorial is rather similar to the previous one, with a big exception: 
we are going to implement **OGs of non-ubiquitous genes** - _i.e._ OGs in which the gene is missing for some of the species considered.
As before, what's need to carry out this analysis are a ```.nwk``` rooted species tree and two codeml ```.ctl``` files, along with a folder of ```.fa``` aligned OGs.
[Here](https://github.com/for-giobbe/BASE/tree/master/example/_non-ubiquitous_OGs) is the folder of the toy-dastaset which includes non-ubiquitous genes OGs; if 
you type ``` grep -c ">" *``` you can see how each OG has a different number of genes in it, yet never exceeding the total number of species in our phylogeny.
Consider that too small OGs (<3 OTUs) won't be processed by BASE, so you can exclude them before the analysis or make BASE discard them.

---

Note that, leveraging non ubiquitous genes OGs - along ubiquitous ones - is the defeault behavior in the ```--analyze``` step: if one wants 
to restrict the analyses to just ubiquitous OGs, the ```--ubiquitous``` flag needs to be used. We can also include ```--verbose``` so that BASE
 won't erase its temporary folder and files. Let's use the line:

```
sh ../BASE.sh --analyze --input _non-ubiquitous_OGs/ --output _non-ubiquitous_OGs_clade 
--s_tree spp_tree.nwk --model_g m0.ctl --model_a m2.ctl --cores 4 --labels tag_clade.lst --verbose
```

The files generated are exactly the same as an analysis which includes only ubiquitous genes OGs.
Due to the ```--verbose``` flag we also get as an output a ```.tmp.full.out``` folder which contains all the intermediate and temporary files relative to the analyses. 
We can then proceed to the ```--extract``` step by typing:

```
sh ../BASE.sh --extract --input _non-ubiquitous_OGs_clade
```

In a first scenario, we want to extract the values of a branch without allowing any missing data in its associated clade:

To do so we can just specify ```--min_spp x```.  Let's type:

```
sh ../BASE.sh --extract --input _non-ubiquitous_OGs_clade --labels clade_of_interest --min_spp x
```

We can see that the outpur clearly states the OGs where the criteria was not met, as we can observe from the ```no_branch``` labels
in the ```_non-ubiquitous_OGs_clade/extract.clade_of_interst.min.spp.4.dNdS.summary``` file:

```
branch/clade      OG      spp_n  dNdS       t      dN      dS
clade_of_interst  OG3105  0      no_branch
clade_of_interst  OG3126  0      no_branch
clade_of_interst  OG3158  0      no_branch
clade_of_interst  OG3197  4      0.0960     1.188  0.1186  1.2349
clade_of_interst  OG3302  4      0.1185     0.778  0.0999  0.8427
clade_of_interst  OG3342  4      0.0927     0.520  0.0548  0.5913
clade_of_interst  OG3347  4      0.0793     0.501  0.0478  0.6022
clade_of_interst  OG3359  0      no_branch
clade_of_interst  OG3362  4      0.1145     0.530  0.0618  0.5399
clade_of_interst  OG3372  0      no_branch
clade_of_interst  OG3387  4      0.1054     0.704  0.0711  0.6749
clade_of_interst  OG3395  4      0.1007     0.183  0.0199  0.1974
clade_of_interst  OG3399  4      0.1089     0.509  0.0592  0.5434
clade_of_interst  OG3600  0      no_branch
clade_of_interst  OG3622  4      0.0809     1.112  0.1046  1.2918
clade_of_interst  OG3640  4      0.1045     0.963  0.1087  1.0395
clade_of_interst  OG3648  4      0.1708     0.651  0.1002  0.5867
clade_of_interst  OG3682  0      no_branch
clade_of_interst  OG3683  4      0.1104     0.255  0.0304  0.2753
```

In a second scenario, we want instead to obtain the information of the branch leading to our clade(s) of interest even when some of its species are missing.

We can either specify an absolute number or a proportion with the ```--min_spp```. For example let's extract the metrics
for a branch using a treshold of 0.8 - which means that at leas 80% of the species of its associated species are necessary for it to be considered:

```
sh ../BASE.sh --extract --input _non-ubiquitous_OGs_clade --labels clade_of_interest --min_spp 0.8 --verbose
```

Of course this analysis will consider more OGs than the one considering only ubiquitous ones; due to the ```-v``` flag we can also visualize for each OGs
the best-fit model, the branch and its associated species:

Let's take a look to the ```_non-ubiquitous_OGs_clade/extract.clade_of_interst.min.spp.0.8.dNdS.summary``` file: 

```
branch/clade      OG      model        spp_n  dNdS       t      dN      dS      branch  spp
clade_of_interst  OG3105  general      0      no_branch
clade_of_interst  OG3126  alternative  0      no_branch
clade_of_interst  OG3158  general      0      no_branch
clade_of_interst  OG3197  general      4      0.0960     1.188  0.1186  1.2349  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3302  alternative  4      0.1185     0.778  0.0999  0.8427  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3342  general      4      0.0927     0.520  0.0548  0.5913  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3347  general      4      0.0793     0.501  0.0478  0.6022  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3359  general      3      0.0272     0.354  0.0119  0.4369  8..9    lart  lubb  tcan
clade_of_interst  OG3362  general      4      0.1145     0.530  0.0618  0.5399  9..10   lart  lubb  tcan  tusa
clade_of_interst  OG3372  general      3      0.0232     0.484  0.0163  0.7041  8..9    lart  lubb  tcan
clade_of_interst  OG3387  general      4      0.1054     0.704  0.0711  0.6749  9..10   lart  lubb  tcan  tusa
clade_of_interst  OG3395  alternative  4      0.1007     0.183  0.0199  0.1974  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3399  general      4      0.1089     0.509  0.0592  0.5434  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3600  general      3      0.1340     0.454  0.0618  0.4615  8..9    lart  lubb  tusa
clade_of_interst  OG3622  alternative  4      0.0809     1.112  0.1046  1.2918  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3640  general      4      0.1045     0.963  0.1087  1.0395  9..10   lart  lubb  tcan  tusa
clade_of_interst  OG3648  general      4      0.1708     0.651  0.1002  0.5867  9..10   lart  lubb  tcan  tusa
clade_of_interst  OG3682  general      3      0.1243     0.341  0.0428  0.3443  8..9    lart  lubb  tusa
clade_of_interst  OG3683  general      4      0.1104     0.255  0.0304  0.2753  7..8    lart  lubb  tcan  tusa
```

But let's try to use a different treshold of 0.6 - which means that at leas 60% of the species of a clade are necessary for the clade to be considered:

```
sh ../BASE.sh --extract --input _non-ubiquitous_OGs_clade --labels clade_of_interest --min_spp 0.6 --verbose
```

We can notice that the our criteria have been met in a larger number of cases (all of the OGs actually)
by checking the ```_non-ubiquitous_OGs_clade/extract.clade_of_interst.min.spp.0.6.dNdS.summary``` file:

```
branch/clade      OG      model        spp_n  dNdS    t      dN      dS      branch  spp
clade_of_interst  OG3105  general      2      0.0724  0.270  0.0219  0.3029  7..8    lart  lubb
clade_of_interst  OG3126  alternative  2      0.0869  1.100  0.1089  1.2533  5..6    lart  lubb
clade_of_interst  OG3158  general      2      0.0996  1.361  0.1512  1.5179  7..8    tcan  tusa
clade_of_interst  OG3197  general      4      0.0960  1.188  0.1186  1.2349  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3302  alternative  4      0.1185  0.778  0.0999  0.8427  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3342  general      4      0.0927  0.520  0.0548  0.5913  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3347  general      4      0.0793  0.501  0.0478  0.6022  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3359  general      3      0.0272  0.354  0.0119  0.4369  8..9    lart  lubb  tcan
clade_of_interst  OG3362  general      4      0.1145  0.530  0.0618  0.5399  9..10   lart  lubb  tcan  tusa
clade_of_interst  OG3372  general      3      0.0232  0.484  0.0163  0.7041  8..9    lart  lubb  tcan
clade_of_interst  OG3387  general      4      0.1054  0.704  0.0711  0.6749  9..10   lart  lubb  tcan  tusa
clade_of_interst  OG3395  alternative  4      0.1007  0.183  0.0199  0.1974  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3399  general      4      0.1089  0.509  0.0592  0.5434  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3600  general      3      0.1340  0.454  0.0618  0.4615  8..9    lart  lubb  tusa
clade_of_interst  OG3622  alternative  4      0.0809  1.112  0.1046  1.2918  7..8    lart  lubb  tcan  tusa
clade_of_interst  OG3640  general      4      0.1045  0.963  0.1087  1.0395  9..10   lart  lubb  tcan  tusa
clade_of_interst  OG3648  general      4      0.1708  0.651  0.1002  0.5867  9..10   lart  lubb  tcan  tusa
clade_of_interst  OG3682  general      3      0.1243  0.341  0.0428  0.3443  8..9    lart  lubb  tusa
clade_of_interst  OG3683  general      4      0.1104  0.255  0.0304  0.2753  7..8    lart  lubb  tcan  tusa

```

The ```--min_spp ``` flag - wether in combination with an explicit number of species or a proporiton - will be applaied to all the branches/clades specified
in a single analysis. To apply different tresholds across different clades separate analyses have to be carried out, or  ```x ``` can be specified to disable 
any tollerance towards missing species in the branches/clades of interest.

Nonetheless these results should be **handled carefully**: if we allow too much missing data, both in the branch/clades of interest and in the whole tree,
the analyses start to become meaningless. For example: if we want to consider the branch leading to a clade of 50 species, one thing is to allow 3-4 of them
to go missing, but when more than half are not present the analysis doesn't make sense anymore.
A good approach is to stay conservative and try to explore the tradeoff between the number of OGs considered and the missing data treshold,
manually inspecting the outputs.

---

[Back](https://github.com/for-giobbe/BASE/blob/master/tutorial_0.md) to the tutorials list.
