---
layout: default
title: Input Data for RRest
has_children: true
parent: Respiratory Rate
grand_parent: Algorithms
---

# Input Data
{: .no_toc }

This page provides an overview of how to provide Input Data to RRest.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Several datasets are publicly available for use with _RRest_, as detailed [here](http://peterhcharlton.github.io/RRest/datasets.html). You may also wish to use your own dataset.

## Using Publicly Available Datasets
[Publicly available datasets](http://peterhcharlton.github.io/RRest/datasets.html) are either provided as part of the _RRest_ Project, or are available from other public sources. Those provided as part of the _RRest_ Project, such as the Vortal Dataset, are already in the required format for use with the _RRest_ toolbox. Those available from other public sources, such as the MIMICII Dataset can be easily used with the _RRest_ toolbox by downloading and re-formatting the datasets using the 'data_importer' scipts provided [here](https://github.com/peterhcharlton/RRest/tree/master/RRest_v1.0/Data_Import_Scripts).

Once you have downloaded a dataset, you are ready to use _RRest_. You should specify its location to _RRest_ in the `up.paths.root_folder` variable, in the _setup_universal_params.m_ script. _RRest_ can be run using the command detailed [here](https://github.com/peterhcharlton/RRest/wiki/Getting-Started#run-your-first-analysis).

## Using Your Own Datasets
You may alternatively wish to analyse your own dataset with _RRest_. There are three steps to doing so: formatting the your dataset correctly, saving it in the appropriate location, and using a Matlab command to call _RRest_ appropriately. These are now explained:

### Formatting your dataset
The easiest way to understand how to format your dataset for use with _RRest_ is to look at an example, such as the VORTAL_rest dataset presented [here](http://peterhcharlton.github.io/RRest/vortal_dataset.html).

A dataset must be stored in a Matlab structure array called _data_ to be used with _RRest_. The structure array should be of dimension [1, n], where n is the number of recordings. The structure array should contain the following fields:

* _ppg_ : _e.g._ `data(1).ppg.fs = 125` , specifying the sampling rate in Hz, and `data(1).ppg.v = [1,2,3,2,1]` , where [1,2,3,2,1] is the row vector of PPG values for this recording.
* _ekg_ : _e.g._ `data(1).ekg.fs = 125` , specifying the sampling rate in Hz, and `data(1).ekg.v = [1,2,3,2,1]` , where `[1,2,3,2,1]` is the row vector of ECG values for this recording.

It must also contain reference respiratory data. This can either be specified as the timings of individual breaths, the numerical outputs of a continuous monitor, or as a reference respiratory signal. To specify the timings of individual breaths:

* _ref.breaths_ : _e.g._ `data(1).ref.breaths.t = [1.2,3.7,5.1,6.2]`, where `[1.2,3.7,5.1,6.2]` is the column vector of breath timings in seconds.

To specify the numerical outputs of a continuous monitor:

* _ref.params.rr_ : _e.g._ `data(1).ref.params.rr.v = [20,21,20,19]`, where `[20,21,20,19]` is the column vector of RRs measured in breaths per minute; and `data(1).ref.params.rr.t = [1,2,3,4]`, where `[1,2,3,4]` is the column vector of corresponding times in seconds.

To specify a reference respiratory signal (in this case an impedance, _imp_ , signal:

* _imp_ : _e.g._ `data(1).imp.signal_e_vlf.y` = [1,2,3,2,1]` , where `[1,2,3,2,1]` is the row vector of impedance values for this recording.

In addition, individual recordings can be assigned to groups. For instance, in the [synthetic dataset](http://peterhcharlton.github.io/RRest/synthetic_dataset.html) the signals are assigned to baseline wander (_bw_), amplitude modulation (_am_) and frequency modulation (_fm_) groups. Groups can be called by any string name you wish. If you do specify groups then a sub-group analysis will be performed as well as the analysis of the entire dataset (if not please simply give all recordings the same group name). To specify a group use the following field:

* _group* : _e.g._ `data(1).group = 'bw'`

### Saving your dataset in the appropriate location
To ensure that your data is saved in an appropriate location for _RRest_ to be able to find it specify _up.paths.root_folder_ as the directory which contains the dataset. This variable is set in the _setup_universal_params.m_ script.

### Calling _RRest_ to analyse your dataset
Use the following command to call _RRest_ When using your own dataset:

`RRest('dataset_name')`

where `'dataset_name'` should be replaced with the name of the dataset. For instance, if your dataset is saved as _VORTAL_rest_data.mat_ then the appropriate command would be:

`RRest('VORTAL_rest')`