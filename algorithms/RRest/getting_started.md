---
layout: default
title: Respiratory Rate
has_children: false
parent: Respiratory Rate
grand_parent: Parameter Estimation
---

# Getting Started
{: .no_toc }

This page guides the new user through getting started with RRest.
{: .fs-6 .fw-300 }


## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

If you are new to RRest it is recommended that you follow these steps to gain familiarity with the toolbox. These steps are demonstrated in this [video](https://youtu.be/J4ZG3QntTI8).

## Download a sample dataset
Several datasets are compatible with the toolbox (as listed [here](http://peterhcharlton.github.io/RRest/datasets.html)). Of these, the Synthetic Dataset, named 'RRSYNTH', is perhaps the easiest one to start with. Instructions on how to obtain the dataset are available [here](http://peterhcharlton.github.io/RRest/synthetic_dataset.html).

## Amend the Universal Parameters
The _Universal Parameters_ are a set of parameters which are used throughout the toolbox. In particular, the File Paths must be set for your own computer as detailed [here](https://github.com/peterhcharlton/RRest/wiki/Universal-Parameters). Apart from these, all other parameters can be left alone to get started.

## Run your first analysis
_RRest_ is the main script which runs the analysis. It takes a single input specifying the dataset to be analysed, such as the 'RRSYNTH' dataset. Use a command such as this to run _RRest_:

`RRest('RRSYNTH')`
