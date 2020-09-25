# Tutorial

This tutorial has been designed to illustrate several possible use of BASE, which reflect real scenarios of analysis.

---

## Installation and download of the toy dataset:

BASE consists of a single shell script. To install its dependencies, it is possible to create a conda 
environiment using the relative [yaml](https://github.com/for-giobbe/BASE/blob/master/BASE_env.yml) configuration file.

Additionally, the phyutility needs to be added to the path.

We are gonna leverage two toy datasets:

- the first includes OG of genens which are ubiquitous to the species considered

- the second consists of incomplete OGs where some species are missing

---

## Retrive omega values of a specific branch in complete clusters:

analyze m0 vs m1 - without -d - on just complete clustes
annotate
extract without missing data

---

## Retrive omega values of a branch allowing missing data in the group of interest:

analyze m0 vs m2 with missing data
annotate
extract with missing data in the group of interest

---

## Retrive omega values of a branch allowing missing data in the group of interest:

analyze m2 vs m2 with different labeling
annotate
extract with missing data only outside the target group

---

## Compare NSsites model using replicates:

analyze NSsites with replicates
