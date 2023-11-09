---
layout: default
title: 4 SAFER Data
parent: SAFER Projects
has_children: false
---

# SAFER Data
{: .no_toc }

This page provides information on data collected during the SAFER Programme.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Data processing

The SAFER data are extensively processed to produce a clean dataset for analysis. The variables available are listed [here](https://universityofcambridgecloud-my.sharepoint.com/:b:/r/personal/pc657_cam_ac_uk/Documents/SAFER_Engineering_Resources/SAFER_student_projects/Project_Resources/SAFER_variables.pdf?csf=1&web=1&e=0Lq9Vq).

## Data characteristics

You may find it helpful to look at the following summary characteristics of the safer datasets:

| Phase | Link |
|---|---|
| Feas1 | [Summary document](https://universityofcambridgecloud-my.sharepoint.com/:t:/r/personal/pc657_cam_ac_uk/Documents/SAFER_Engineering_Resources/SAFER_analyses/SAFER_dataset_characteristics/stats/feas1_dataset_chars.md?csf=1&web=1&e=NDZnPP) |
| Feas2 | [Summary document](https://universityofcambridgecloud-my.sharepoint.com/:t:/r/personal/pc657_cam_ac_uk/Documents/SAFER_Engineering_Resources/SAFER_analyses/SAFER_dataset_characteristics/stats/feas2_dataset_chars.md?csf=1&web=1&e=teBccn) |
| Trial | [Summary document](https://universityofcambridgecloud-my.sharepoint.com/:t:/r/personal/pc657_cam_ac_uk/Documents/SAFER_Engineering_Resources/SAFER_analyses/SAFER_dataset_characteristics/stats/trial_dataset_chars.md?csf=1&web=1&e=l1m6ep) |

## Data Access

Users must sign a _Data Sharing Agreement_ to access the data, which is submitted for review by the SAFER Team. Please ask me for a copy of the _Data Sharing Agreement_.

## File Structure and Formatting

### Participant- and recording-level data

The data are provided in the following files:

- **pt_data_anon**: participant-level variables (such as gender and age). Each participant is assigned a unique ID, called _ptID_. The data are provided in two formats, each of which contain the same data: _.csv_ and _.mat_ files.
- **rec_data_anon**: recording-level variables (such as heart rate). Each recording (_i.e._ each ECG recording) is assigned a unique ID, called _measID_. The data are provided in two formats, each of which contain the same data: _.csv_ and _.mat_ files.
- **..._diag_key**: The key providing a link between the text diagnoses (such as 'AF') and the numerical diagnoses (such as 1) in either the _pt_data_anon_ or _rec_data_anon_ files.

These files are provided in separate subfolders for each stage of the SAFER Programme.

For an explanation of each variable, see the definitions [here](https://universityofcambridgecloud-my.sharepoint.com/:b:/r/personal/pc657_cam_ac_uk/Documents/SAFER_Engineering_Resources/SAFER_student_projects/Project_Resources/SAFER_variables.pdf).

### ECG recordings

ECG recordings are each provided in their own file, named: _safer[stage]___[measID]_, where:

- _[stage]_ refers to the stage of the SAFER Programme: Feasibility 1 (F1), Feasibility 2 (F2), or Trial (T).
- _[measID]_ refers to the unique ID for the ECG recording, which is available in _rec_data_anon_.

ECG recordings are provided in WFDB format, which is the standard format used on PhysioNet, and is explained [here](https://archive.physionet.org/faq.shtml#file_types). It is suitable for use with the [WFDB Python Toolbox](https://pypi.org/project/wfdb/). Please see the Introductory notebooks on [OneDrive](https://universityofcambridgecloud-my.sharepoint.com/:f:/r/personal/pc657_cam_ac_uk/Documents/SAFER_Engineering_Resources/SAFER_code) for examples of how to read and process the data.
