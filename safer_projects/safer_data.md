---
layout: default
title: 3 SAFER Data
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

## Data Collection

### Recording ECGs

Participants of the SAFER programme are asked to use a handheld ECG device to record 30-second, single-lead ECGs at home. They record approximately 4 ECGs per day for approximately 3 weeks, providing around 84 ECGs per participant.

_The handheld ECG device_

The device being used is the [Zenicor-EKG](https://zenicor.com/zenicor-ekg/) device (see [here](https://zenicor.com/wp-content/uploads/2014/08/MG_1945_low-300x200.jpg) for a picture of the device). This device was previously used in the STROKESTOP studies.

### Automated analysis of ECGs

ECGs are analysed using [Cardiolund's ECG analysis algorithm](https://peterhcharlton.github.io/info/tools/reading/af_screening.html#cardiolunds-ecg-parser-algorithm). This algorithm applies the binary classifications (known as tags) to each ECG signal, which are descirbed [here](https://cardiolund.com/ecg-parser/).

Selected tags are used to identify ECGs which exhibit signs of possible AF, and therefore warrant manual review.

### Participant-level diagnoses

Participants who have at least one ECG exhibiting signs of possible AF are sent for manual review by one or more reviewers (details of this process are provided [here](https://universityofcambridgecloud-my.sharepoint.com/:t:/r/personal/pc657_cam_ac_uk/Documents/SAFER_Engineering_Resources/SAFER_study_methods/Clinical%20review.md?csf=1&web=1&e=qCcgKp), and details of the tags used to identify signs of possible AF are provided [here](https://universityofcambridgecloud-my.sharepoint.com/:t:/r/personal/pc657_cam_ac_uk/Documents/SAFER_Engineering_Resources/SAFER_study_methods/Use%20of%20algorithm%20tags.md?csf=1&web=1&e=NcchiT)).

Each participant is assigned a participant-level diagnosis.

### ECG-level labels

During the process of reviewing participants, cardiologists may label individual ECGs on an ad-hoc basis. Labels include: AF, non-AF, and poor quality.

## Data processing

The SAFER data are extensively processed to produce a clean dataset for analysis. The variables available are listed [here](https://universityofcambridgecloud-my.sharepoint.com/:b:/r/personal/pc657_cam_ac_uk/Documents/SAFER_Engineering_Resources/SAFER_student_projects/Project_Resources/SAFER_variables.pdf?csf=1&web=1&e=0Lq9Vq).

## Accessing the data

Users must sign a _Data Sharing Agreement_ to access the data, which is submitted for review by the SAFER Team. Please ask me for a copy of the _Data Sharing Agreement_.

## Files

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
