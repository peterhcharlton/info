---
layout: default
title: Respiratory Rate
has_children: true
parent: Parameter Estimation
grand_parent: Algorithms
permalink: RRest/
---

# A Toolbox of Respiratory Rate Algorithms
{: .no_toc }

This page provides an overview of RRest, a toolbox of respiratory rate algorithms.
{: .fs-6 .fw-300 }


## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## What is RRest?
RRest is a toolbox of algorithms for estimation of respiratory rate from physiological signals. It is written in Matlab &reg; format, and contains a wide range of algorithms previously reported in the literature. It is part of a larger project called the [Respiratory Rate Estimation](http://peterhcharlton.github.io/RRest/) project. The project contains additional material such as [data](http://peterhcharlton.github.io/RRest/datasets.html) to use with the algorithms, [publications](http://peterhcharlton.github.io/RRest/publications.html) arising from the project, and details of how to [make contributions](http://peterhcharlton.github.io/RRest/contributions.html).

<a name="what_does" />

## What does RRest do?
RRest estimates respiratory rate from windows of electrocardiogram (ECG) and pulse oximetry (photoplethysmogram, PPG) signals. It also estimates a reference respiratory rate from a simultaneous respiratory signal, such as an Impedance Pneumography signal.

<a name="why" />

## Why is RRest helpful?
RRest is a helpful resource for researchers in the field of respiratory rate estimation. It provides a set of RR algorithms for use with the ECG and PPG. This is helpful for:

1. **Comparing algorithms**: Perhaps you have developed a novel RR algorithm, and now you want to compare it to an existing algorithm. RRest provides many algorithms which have been implemented, verified, and published (for further details see [this publication](http://peterhcharlton.github.io/RRest/yhvs_assessment.html)).

2. **Evaluating algorithms**: RRest also facilitates statistical analysis of the performance of algorithms. Many of the statistics which have previously been used to evaluate the performance of algorithms are calculated by the code.

3. **Developing algorithms**: When developing algorithms for estimation of respiratory rate it is often prudent to begin with an existing algorithm, and tweak it to make improvements, rather than to start from scratch. RRest provides many of the fundamental algorithms described in the literature, allowing researchers to take existing algorithms and develop them further.

<a name="how_design" />

## How is RRest designed?

RRest is designed on the premise that RR algorithms can be segmented into three distinct components:

* **Extraction of a respiratory signal**: Firstly, algorithms extract a signal dominated by respiration from the raw signal. In the case of impedance pneumography or accelerometry signals this is straightforward since the primary modulation of these signals is due to modulation. However, many physiological signals such as the ECG and PPG are secondarily modulated by respiration after the primary cardiac modulation. In these instances extended extraction techniques are required.

* **Estimation of respiratory rate**: Secondly, a respiratory rate is estimated from a respiratory signal. This can be performed in either the time- or frequency-domain.

* **Fusion of respiratory rates**: Thirdly, and optionally, multiple respiratory rates obtained using different methods can be fused to give one, hopefully more accurate, respiratory rate.

RRest estimates a respiratory rate from either the ECG or PPG using a technique for each of components. Consequently, a large number of algorithms can be constructed by considering different combinations of techniques at each component.

RRest is computationally efficient since algorithms which share common extraction steps only require these steps to be conducted once, rather than for each algorithm.

<a name="how_more" />

## How can I find out more?

This Wiki acts as a user manual for the algorithms presented in this repository. The rest of the manual can be accessed via the links on the right-hand side.

Additional information is available on the wider [Respiratory Rate Estimation project](http://peterhcharlton.github.io/RRest/) webpages. They contain links to publications describing the use of RRest. They also contain data which can be used with the algorithms.

<a name="how_contribute" />

## How can I contribute to RRest?

Contributions to RRest are most welcome. Whether compliments, criticisms, questions, or code, do [get in touch](http://peterhcharlton.github.io/RRest/contributions.html).

<a name="what_not" />

## What does RRest not do?
As stated in the licence accompanying the source code, the algorithms are not intended to be fit for any purpose. Please see the [licence](https://github.com/peterhcharlton/RRest/blob/master/LICENSE) for further details.

RRest will also not fly you to the moon and back. However, it may be reasonable to presume that similar algorithms were used to monitor the respiratory rate of the parachutist in the [Red Bull Stratos project](http://www.ncbi.nlm.nih.gov/pubmed/24597163), albeit applied to a strain gauge rather than the ECG or PPG.


***