---
layout: default
title: PPG Diary 1 Dataset
parent: Datasets
permalink: datasets/ppg-diary1
---

# PPG Diary 1 Dataset
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Overview

 Item | Details 
 :--- | :--- 
 **Links** | [Dataset](https://doi.org/10.5281/zenodo.3268500), [Publication](https://doi.org/10.3390/ecsa-7-08233)
 **Signals** | Dual-wavelength PPG 
 **No. Subjs** | 1
 **Protocol** | PPG signal measured at the thumb from a single participant for 28 days. The participant recorded their activities of daily living, and any technical problems

## Dataset contents

The [dataset](https://doi.org/10.5281/zenodo.3268500) is presented in Matlab format. It contains:
- _ppg_diary_pilot_conv_data.mat_: The main data file (containing 4 weeks of data)
- _PPGdiary1_1_hour_sample.mat_: A 1-hour data sample
- _PPGdiary1_1_min_sample.mat_: A 1-minute data sample
- _PPGdiary1_1_pulse_sample.mat_: A short data sample of a single PPG pulse wave

The repository also contains the following scripts to process the data:
- _ppg_diary_pilot1_analysis.m_: The main Matlab script, used to analyse the data.
- _PulseAnalyse.m_: a script called by the main script

### Details of the data file

The _ppg_diary_pilot_conv_data.mat_ data file contains two variables:
 - _data_ : a structure containing data recorded from the wearable PPG sensor
 - _adl_data_ : a structure containing participant-reported activities of daily living

The "data" variable contains:
 - _fs_ : the sampling frequency of PPG signals (100 Hz)
 - _pr_ : the pulse rate (in beats per minute) provided by the device (at 1 Hz, see
_t_sec_rel_ for associated times)
 - _spo2_ : the arterial blood oxygen saturation (in %) provided by the device (at 1 Hz, see _t_sec_rel_ for associated times)
 - _spo2_status_ : provided by the device (at 1 Hz, see _t_sec_rel_ for associated times)
 - _ppg_red_ : a vector of red PPG values (at 100 Hz, see _t_ms_rel_ for associated times)
 - _ppg_ir_ : a vector of infrared PPG values (at 100 Hz, see _t_ms_rel_ for associated times)
 - _perf_ : perfusion parameter provided by the device (at 1 Hz, see _t_sec_rel_ for associated times)
 - _t_ms_rel_ : time in milliseconds since the start of the study
 - _t_sec_rel_ : time in seconds since the start of the study

The _adl_data_ variable contains a list of activities of daily living (and sensor maintenance issues) and their associated times:
 - _act_ : a list of activities and sensor maintenance issues. The suffix '_fin' indicates the end of an activity.
 - _t_ms_rel_ : the time in milliseconds since the start of the study.

## Replicating the analysis

### Steps 

The analysis reported in [this publication](https://doi.org/10.3390/ecsa-7-08233) can be replicated as follows:
*   Download the *[ppg_diary_pilot_conv_data.mat](https://zenodo.org/record/4106663/files/ppg_diary_pilot_conv_data.mat?download=1)* data file from [this repository](https://doi.org/10.5281/zenodo.3268500).
*   Download [Version 1](https://github.com/peterhcharlton/ppg-diary/tree/master/ppg-diary_v1.0) of the scripts.
*   Specify the path of the *[ppg_diary_pilot_conv_data.mat](https://zenodo.org/record/4106663/files/ppg_diary_pilot_conv_data.mat?download=1)* data file in line 111 of the *[ppg_diary_pilot1_analysis.m](https://zenodo.org/record/4106663/files/ppg_diary_pilot1_analysis.m?download=1)* script.
*   Analyse the data using the *[ppg_diary_pilot1_analysis.m](https://zenodo.org/record/4106663/files/ppg_diary_pilot1_analysis.m?download=1)* script. This script calls the *[PulseAnalyse.m](https://zenodo.org/record/4107055/files/PulseAnalyse.m?download=1)* script, so you will need this script too (v.1.2 beta).

### Output files

The following files are produced during the analysis:
- _filt_data.mat_: Contains filtered PPG signal
- _beat_data.mat_: Contains annotations of beats detected in PPG signal
- _rec_periods.mat_: Contains details of each 'recording period' (_i.e._ each period of data in which the participant was doing a single activity, and the device was either connected or disconnected). The file contains the _rec_periods_ variable, which contains the following fields:
  - _deb_: the start time of each recording period, measured in milliseconds since the start of the study.
  - _fin_: the end time of each recording period, measured in milliseconds since the start of the study.
  - _act_: the activity the participant was doing during each recording period (_e.g._ 'desk work').
  - _reason_disconnect_: (only populated if the device was disconnected during a period) the reason for device disconnection (_e.g._ 'connection dropped').
  - _connected_: whether or not the device was connected during each recording period (1 indicates that it was connected)
  - _durn_: the duration of each recording period (in ms)
  - _noted_wearing_: whether or not the participant noted that they were wearing the device during each recording period
- _trial_outcomes.mat_: contains a variable named 'endpoints', which is a structure containing each of the study endpoints.
- _quality_data.mat_: contains a variable named 'qual', which is a structure containing the following fields:
  - _no_onsets_: the number of pulse wave onsets detected in each recording period.
  - _no_hq_onsets_: the number of pulse wave onsets detected in each recording period, whose corresponding pulse waves were deemed to be of high quality (in samples, at 100 Hz).
  - _durn_hq_onsets_: the total duration of the pulse waves which were deemed to be of high quality during each recording period (in samples, at 100 Hz).
  - _durn_lq_onsets_: the total duration of the pulse waves which were deemed to be of low quality during each recording period (in samples, at 100 Hz).

For a greater understanding of these files, please see the _ppg_diary_pilot1_analysis.m_ script which generates the files. 
  
  
  
  
  
  
  
  
  
  
  
  
  

