---
layout: default
title: Datasets
has_children: true
---

# Datasets

This page provides a few resources related to the following datasets that I have used in my research:

| Dataset     | Signals | Overview of protocol | 
| :--- | :--- | :--- |
| [WESAD](#wesad-dataset) | PPG, ECG, resp, accel, others | Recordings at baseline and during amusement, stress and meditation |
| [PPG-DaLiA](#ppg-dalia-dataset) | PPG, ECG, resp, accel, EDA | Recordings during activities of daily living |

## WESAD Dataset

### Overview

 Item | Details 
 :--- | :--- 
 **Links** | [Dataset](https://archive.ics.uci.edu/ml/datasets/WESAD+%28Wearable+Stress+and+Affect+Detection%29), [Publication](https://doi.org/10.1145/3242969.3242985) 
 **Signals** | PPG, ECG, resp, accel, others 
 **No. Subjs** | 15 
 **Protocol** | Recordings at baseline and during amusement, stress and meditation 

### Importing the data into MATLAB

I took the following steps to import the WESAD dataset to MATLAB:

1. Download the data from [here](https://uni-siegen.sciebo.de/s/HGdUkoNlW1Ub0Gx) (as stated [here](https://ubicomp.eti.uni-siegen.de/home/datasets/icmi18/)).
2. Download the [`convert_subject_pickle_files_to_mat.py` python script](https://raw.githubusercontent.com/peterhcharlton/resources/master/collating_datasets/convert_subject_pickle_files_to_mat.py).
3. Copy the subject's _.pkl_ file to the same folder as this python script.
4. Run the python script to convert the _.pkl_ file into a MATLAB file. (I used Spyder - a Python program - through Anaconda-Navigator.)
5. Copy this MATLAB file back to the same folder as the _.pkl_ file was obtained from.
6. Download the [`collate_ppg_dalia_dataset.m` MATLAB script](https://raw.githubusercontent.com/peterhcharlton/resources/master/collating_datasets/collate_ppg_dalia_dataset.m).
7. Modify the MATLAB script by inserting the `up.paths.root_folder` and `up.paths.save_folder` into the `setup_up` function.
8. Run the MATLAB script to collate all the individual MATLAB files into a single MATLAB data file, ready for analysis.

## PPG-DaLiA Dataset

### Overview

 Item | Details 
 :--- | :--- 
 **Links** | [Dataset](https://archive.ics.uci.edu/ml/datasets/PPG-DaLiA), [Publication](https://doi.org/10.3390/s19143079) 
 **Signals** | PPG, ECG, resp, accel, others 
 **No. Subjs** | 15 
 **Protocol** | Recordings during activities of daily living (car driving, cycling, in a lunch break, sitting, stair climbing, playing table soccer, walking and working)

### Importing the data into MATLAB

1. Download from [here](https://ubicomp.eti.uni-siegen.de/home/datasets/sensors19/) or [here](https://archive.ics.uci.edu/ml/datasets/PPG-DaLiA), and unzip.
2. Download the [`convert_subject_pickle_files_to_mat.py` python script](https://raw.githubusercontent.com/peterhcharlton/resources/master/collating_datasets/convert_subject_pickle_files_to_mat.py).
3. Copy the subject's _.pkl_ file to the same folder as this python script.
4. Run the python script to convert the _.pkl_ file into a MATLAB file. (I used Spyder - a Python program - through Anaconda-Navigator.)
5. Copy this MATLAB file back to the same folder as the _.pkl_ file was obtained from.
6. Download [`collate_wesad_dataset.m` MATLAB script](https://raw.githubusercontent.com/peterhcharlton/resources/master/collating_datasets/collate_wesad_dataset.m).
7. Modify the MATLAB script by inserting the `up.paths.root_folder` and `up.paths.save_folder` into the `setup_up` function.
8. Run the MATLAB script to collate all the individual MATLAB files into a single MATLAB data file, ready for analysis.