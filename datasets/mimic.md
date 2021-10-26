---
layout: default
title: MIMIC Dataset
parent: Datasets
permalink: datasets/mimic
---

# MIMIC Dataset
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Overview

 Item | Details 
 :--- | :--- 
 **Links** | [Dataset](https://physionet.org/content/mimic3wdb/1.0/), [Publication](https://doi.org/10.1038/sdata.2016.35) 
 **Signals** | PPG, ECG, resp, BP, others 
 **No. Subjs** | 1,000s
 **Protocol** | Recordings during critical care admissions 

## Subsets

We are currently developing approaches to extract the following subsets of the MIMIC dataset:

### AF Subset

This subset contains ECG and PPG recordings of 1-hour duration, some of which were acquired during atrial fibrillation (AF), and the rest were acquired during normal sinus rhythm.

 Item | Details 
 :--- | :--- 
 **Links** | _TBC_
 **Signals** | PPG, ECG, resp
 **No. Subjs** | 34 (18 in AF, 16 not in AF)
 **Protocol** | 34 critically-ill adults during routine clinical care. Data were measured using a bedside monitor at 125 Hz. Manual labels of AF and non-AF subjects were obtained from [here](https://doi.org/10.6084/m9.figshare.12149091.v1), as described in [[1](https://doi.org/10.1109/ACCESS.2019.2926199)]. Data were extracted from the MIMIC-III Waveform Database [Matched Subset](https://physionet.org/content/mimic3wdb-matched/1.0/).
 
### Ethnicity Subset

This subset contains ECG and PPG recordings of 10-minute duration, some of which were acquired from Black adults, and some of which were acquired from White adults.

 Item | Details 
 :--- | :--- 
 **Links** | _TBC_
 **Signals** | PPG, ECG, resp
 **No. Subjs** | 100 (50 Black, 50 White)
 **Protocol** | 100 critically-ill adults during routine clinical care. Data were measured using a bedside monitor at 125 Hz. Data were extracted from the MIMIC-III [Waveform Database](https://physionet.org/content/mimic3wdb/1.0/).

### Adult & Neonate Subset

This subset contains ECG and PPG recordings of 10-minute duration, some of which were acquired from adults, and some of which were acquired neonates.

 Item | Details 
 :--- | :--- 
 **Links** | _TBC_
 **Signals** | PPG, ECG, resp
 **No. Subjs** | 100 (50 adults, 50 neonates)
 **Protocol** | 100 critically-ill patients during routine clinical care. Data were measured using a bedside monitor at 125 Hz. Data were extracted from the MIMIC-III [Waveform Database](https://physionet.org/content/mimic3wdb/1.0/).


## Importing the data into MATLAB

I took the following steps to import each Subset into MATLAB:

### AF Subset

1. Download the MATLAB script for importing the data from [here](https://github.com/peterhcharlton/info/blob/master/collating_datasets/download_and_collate_mimiciii_ppg_af_dataset.m).
2. Modify the MATLAB script by inserting the `up.paths.root_folder` and `up.paths.save_folder` into the `setup_up` function.
   - _Note:_ The duration of recordings provided by the script can be adjusted with the `up.settings.req_durn` variable within the `setup_up` function.
3. Run the MATLAB script to download the required files from PhysioNet, import the data into MATLAB, and collate the data into a single MATLAB data file, ready for analysis.
 
### Ethnicity Subset

1. Download the MATLAB script for importing the data from _TBC_.
2. Modify the MATLAB script by inserting the `up.paths.root_folder` and `up.paths.save_folder` into the `setup_up` function.
   - _Note:_ The duration of recordings provided by the script can be adjusted with the `up.settings.req_durn` variable within the `setup_up` function.
   - _Note:_ The number of subjects in each group can be adjusted with the `up.settings.no_subjs_per_ethnicity` variable within the `setup_up` function.
3. Run the MATLAB script to download the required files from PhysioNet, import the data into MATLAB, and collate the data into a single MATLAB data file, ready for analysis.

### Adult & Neonate Subset

1. Download the MATLAB script for importing the data from _TBC_.
2. Modify the MATLAB script by inserting the `up.paths.root_folder` and `up.paths.save_folder` into the `setup_up` function.
   - _Note:_ The duration of recordings provided by the script can be adjusted with the `up.settings.req_durn` variable within the `setup_up` function.
   - _Note:_ The number of subjects in each group can be adjusted with the `up.settings.no_subjs_per_group` variable within the `setup_up` function.
3. Run the MATLAB script to download the required files from PhysioNet, import the data into MATLAB, and collate the data into a single MATLAB data file, ready for analysis.