---
layout: default
title: Bootstrapping for confidence intervals
has_children: false
parent: Statistics
grand_parent: Research tools
permalink: stats/bootstrapping_confidence_intervals
---

# Calculating confidence intervals using bootstrapping
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

### Overview

When calculating summary statistics from a sample of measurements, it is often helpful to also calculate confidence intervals for the statistics. Bootstrapping can be a helpful technique for doing so.

### The technique

A very helpful description of the technique is provided [here](https://ocw.mit.edu/courses/mathematics/18-05-introduction-to-probability-and-statistics-spring-2014/readings/MIT18_05S14_Reading24.pdf) - see Section 6 for an example of calculating the confidence interval of the mean of an underlying distribution, using a sample of measurements.

### Implementation

Matlab includes a _[bootci](https://www.mathworks.com/help/stats/bootci.html)_ function which can be used to calculate confidence intervals using bootstrapping. I have used Matlab to calculate confidence intervals using bootstrapping when calculating receiver operating curve (ROC) statistics using the _[perfcurve](https://www.mathworks.com/help/stats/perfcurve.html)_ function.