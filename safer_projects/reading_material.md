---
layout: default
title: 2 Reading Material
parent: SAFER Projects
has_children: false
---

# Reading Material
{: .no_toc }

This page provides a background reading material relating to our work on the SAFER Programme.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Initial Reading for SAFER Student Projects

This page provides some recommended reading for projects within the SAFER Programme. Do be selective about which articles to read - there is certainly no need to read them all. In addition, be selective about which parts of the articles to read - for instance, simply reading the abstract may be sufficient in some cases.

**PDFs** of documents which are not available online are provided [here](https://universityofcambridgecloud-my.sharepoint.com/:f:/r/personal/pc657_cam_ac_uk/Documents/SAFER_Engineering_Resources/SAFER_student_projects/Project_Resources/Reading_Materials).

---

## Atrial Fibrillation

The following are recommended for initial reading on the atrial fibrillation (AF):

- **AF is associated with a fivefold increase in stroke risk:** See [this paper][2] which demonstrates the importance of AF.
- **AF is responsible for approximately 28% of all strokes**: See [this paper][4]
- **Approximately 3.3% of the UK population have AF:** See [this paper][3]
- **The risk of stroke can be reduced by approximately 60% through anticoagulation**: See [this paper][5]
- **AF is often unrecognised:** See [this report][1] which suggests that there may be approximately 425,000 people in England with undiagnosed AF.
- **The global prevalence of AF is expected to more than double by 2050:** See [this paper][6]
- **AF is diagnosed using an ECG assessment:** Section 3.2 of the recent [guidelines][9] on AF provide details of the criteria used to diagnose AF from an ECG. (there's no need to read the rest of the guidelines)


## Screening for Atrial Fibrillation

The following are recommended for initial reading on screening for AF:

- **An introduction to screening for AF:** [This review][10] provides an accessible introduction to screening for AF.
- **The SAFER Programme:** Try to learn about the SAFER Programme, using the links [here](https://peterhcharlton.github.io/info/tools/reading/af_screening.html#safer-study). You will likely use data from the SAFER Feasibility Study in your project - [this publication](7) describes the dataset (although note that the number of AF diagnoses increased slightly after this paper was written), and [this paper](http://peterhcharlton.github.io/publication/prioritising_ecgs/) contains an initial analysis of the ECG data.
- **The STROKESTOP Study:** The STROKESTOP Study used very similar methodology to the SAFER Programme. There are several links on the study [here](https://peterhcharlton.github.io/info/tools/reading/af_screening.html#strokestop-study). However, I would recommend just reading [this paper][8].
- **The ECG recording device:** Have a look at Zenicor's device [here](https://peterhcharlton.github.io/info/tools/reading/af_screening.html#zenicors-handheld-ecg-device) to get an idea of the device used in these studies.


## ECG Interpretation and Analysis

Whilst the above topics are likely to be of some relevance, the following topics may or may not be relevant. Do be selective.

### ECG signals

- **[The physiological origins of ECG signals](https://www.mit.edu/~gari/ecgbook/ch1.pdf):** provides an introduction to what an ECG signal is. It's important to have some understand of what P, Q, R, S and T-waves are.

### ECG Interpretation

- **[2020 ESC Guidelines for the diagnosis and management of atrial fibrillation][28]:** This is a lengthy document, so please don't read it all. However, Section 3.2 (and the Table called 'Recommendations for diagnosis of AF' are particularly helpful). It provides details of the standard criteria for identifying AF in single-lead ECGs (such as those collected in the SAFER Programme).

### ECG Analysis

- **Traditional ECG signal processing:** [This book chapter](http://diec.unizar.es/~laguna/personal/publicaciones/libroWiley.pdf) provides a helpful overview of traditional ECG signal processing techniques. [This article](https://doi.org/10.1109/ACCESS.2020.3026968) is also helpful.
- **The Cardiolund algorithm:** For details of the automated algorithm used to analyse ECGs in the SAFER (and STROKESTOP) Programmes, see [here](https://peterhcharlton.github.io/info/tools/reading/af_screening.html#cardiolunds-ecg-parser-algorithm). Other companies also produce similar ECG analysis algorithms (e.g. [Cardiomatics](https://cardiomatics.com/)), although it is probably most important to read about the Cardiolund algorithm as it is being used in SAFER, and is also well-reported in the literature.
- **ECG beat detection:** [This page][27] provides a list of open-source beat detectors, which may well be helpful if you intend to analyse the ECG signals yourself (rather than simply using the outputs of the Cardiolund algorithm).
- **Heart rate variability analysis:** The following paper provides a useful introduction to heart rate variability (HRV) analysis: [An overview of heart rate variability metrics and norms][29], and [this paper][31] provides additional details.
- **Details of ECG signal processing:** For a comprehensive overview of signal processing techniques used to predict AF from the ECG signal, see [this thesis](http://hdl.handle.net/10362/64177), focusing on Sections 5.2.2 and 5.2.3.
- **Noise in an ECG signal:** See the first part of [this article][13]
- **ECG signal filtering:** [This book chapter][11] and [this one][12] are written by experts in the field. [This article][38] provides an introduction to empirical mode decomposition (EMD) and variations of EMD.
- **Deep learning for the ECG:** [This][20] is a very well written paper on using deep learning with the ECG. See [this paper][19] which used deep learning to identify arrhythmias in the ECG. See [this paper][14] (which used normal 12-lead ECGs to predict which patients would experience AF). There are also several review papers on deep learning and the ECG - [this one][21] looked helpful at first glance, but do have a look around. Update: the toolbox described in [this paper][34] looks like it might be helpful, and [this paper][35] might be helpful for getting a general introduction to the topic.
- **Identifying AF in ECGs:** See the Computing in Cardiology 2017 Challenge: see [here][15] and [here][16] for an introduction to the challenge, and [here][17] for papers describing code submitted to the challenge, much of which is openly available [here][18]. If you ever wish to use the data from this challenge, then do have a look at the [MATLAB script][26] for importing the data.
- **ECG quality assessment:** Our work on ECG quality assessment is available [here][22] (and also [here][23], although this paper is narrower in scope). [This][24] is meant to be helpful, although I haven't read it for a while. Whilst [this paper][25] focuses on using multiple signals, rather than just a single-lead ECG, I do like the idea that you can assess signal quality by using multiple beat detector algorithms, and deeming data to be of high quality only if a 'strong' (i.e. highly accurate) and a 'weak' (i.e. less accurate) beat detector agree on where the heart beats are.See [here][37] for example algorithms, and [here][36] for a publication on this topic). Finally, [this article][30] describes a technique for identifying transient noise in ECG signals, designed and validated on STROKESTOP data.

## Machine Learning in AF screening

- **Potential applications of ML in AF screening:** See [this article][32].
- **Using AI in AF screening:** See [this article][39].

## Additional Reading

[This page](https://peterhcharlton.github.io/info/tools/reading/af_screening.html) provides an extended list of reading on screening for atrial fibrillation (AF), much of which may not be relevant to your particular project.

[1]: https://universityofcambridgecloud-my.sharepoint.com/:b:/r/personal/pc657_cam_ac_uk/Documents/SAFER_Engineering_Resources/SAFER_student_projects/Project_Resources/Reading_Materials/Public%20Health%20England%20-%20Atrial%20fibrillation%20prevalence%20estimates%20in%20England%20Application%20of%20recent%20population%20estimates%20of%20AF%20in%20Sweden.pdf?csf=1&web=1&e=Hi3n0e
[2]: https://doi.org/10.1161/01.str.22.8.983
[3]: https://doi.org/10.1136/heartjnl-2018-312977
[4]: https://doi.org/10.1161/STROKEAHA.116.013378
[5]: https://doi.org/10.7326/0003-4819-146-12-200706190-00007
[6]: https://doi.org/10.1093/eurheartj/eht280
[7]: https://doi.org/10.3390/ecsa-7-08195
[8]: https://doi.org/10.1161/CIRCULATIONAHA.114.014343
[9]: https://doi.org/10.1093/eurheartj/ehaa612
[10]: https://doi.org/10.1093/eurheartj/ehz834
[11]: http://www.mit.edu/~gari/ecgbook/ch5.pdf
[12]: http://www.mit.edu/~gari/ecgbook/ch6.pdf
[13]: http://www.jscholaronline.org/articles/JBER/Signal-Processing.pdf
[14]: https://doi.org/10.1016/s0140-6736(19)31721-0
[15]: https://physionet.org/content/challenge-2017/1.0.0/
[16]: http://www.cinc.org/archives/2017/pdf/065-469.pdf
[17]: https://physionet.org/files/challenge-2017/1.0.0/papers/index.html
[18]: https://archive.physionet.org/challenge/2017/sources/
[19]: https://doi.org/10.1038/s41591-018-0268-3
[20]: https://doi.org/10.1088/1361-6579/aaf34d
[21]: https://doi.org/10.1016/j.eswax.2020.100033
[22]: https://doi.org/10.1109/JBHI.2014.2338351
[23]: https://doi.org/10.3390/ecsa-5-05743
[24]: https://doi.org/10.1109/TBME.2013.2240452
[25]: https://doi.org/10.1088/0967-3334/36/8/1665
[26]: https://peterhcharlton.github.io/info/datasets/cinc2017
[27]: https://peterhcharlton.github.io/info/algorithms/beat-detectors.html
[28]: https://doi.org/10.1093/eurheartj/ehaa612
[29]: https://doi.org/10.3389/fpubh.2017.00258
[30]: https://doi.org/10.3389/fphys.2021.672875
[31]: https://doi.org/10.1161/01.CIR.93.5.1043
[32]: https://doi.org/10.1016/j.cvdhj.2022.04.001
[33]: http://peterhcharlton.github.io/publication/prioritising_ecgs/
[34]: https://doi.org/10.1088/1361-6579/ac9451
[35]: https://doi.org/10.3390/s20040969
[36]: https://doi.org/10.1109/ACCESS.2018.2860056
[37]: https://doi.org/10.1101/2023.11.07.23298202
[38]: https://doi.org/10.1016/j.bspc.2023.104612
[39]: https://doi.org/10.1093/ehjqcco/qcab094