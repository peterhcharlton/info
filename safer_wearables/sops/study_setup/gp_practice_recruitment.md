---
layout: default
title: 1.02 Study Setup - GP Practice Recruitment
parent: SOPs
grand_parent: SAFER Wearables
has_children: false
---

# GP Practice Recruitment
{: .no_toc }

This page provides details of how GP Practices are recruited to participate in the SAFER Wearables Study.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Identifying potential GP Practices

GP Practices must meet the following criteria to participate in the study:
1. Taken part in the SAFER Programme, with screening completed.
2. Part of a CRN region participating in the SAFER Wearables study.
3. Sufficient SAFER participants at the practice:
   - &#8805; 45 participants, including
   - &#8805; 6 AF participants

_NB: The calculations behind these figures are provided [here](https://github.com/peterhcharlton/safer-wearables/blob/main/planning/safer_wearables_planning.ipynb)._

Potential GP Practices can be identified automatically using the `SAFER_data_analysis.m (or similar)` script. To do so:
- At the top of the script, set the SAFER phase to the phase of interest (_e.g. 'feas1').
- Run the script, including the `extract_dataset_characteristics` function.
- When the `extract_dataset_characteristics` function is run, it will output the number of AF participants for each practice, and identify those practices which have the required number of AF participants.
- Copy down the original IDs for the GP Practices with the required number of AF participants.
- Use the `safer_gp_practices2` document as a key to convert these IDs into the GP Practice names (and CRN regions).
- Only retain those practices who are affiliated to a CRN region from whom practices are being recruited.

## Recruiting GP Practices

The process for recruiting GP Practices consists of the following steps.

### Working with CRNs

Firstly, arrangements are put in place with the relevant CRN(s) where practices are to be recruited. The steps include:
- Sharing study documentation
- Providing a study summary to help with the recruitment of GP Practices.
- Specifying potential GP Practices
- Agreeing costings (including Service Support Costs and Research Costs Part B, which are paid by the CRN) for a specified number of sites.
- Developing a PIC agreement (which needs to be approved by the Sponsor and the NHS R&D department):
  - using the appropriate template [here](https://www.myresearchproject.org.uk/help/hlptemplatesfor.aspx#PIC-contracting).
  - inserting the required details, as detailed at the top of the document

### Receiving EOIs

The CRN contacts GP Practices, and then Expressions of Interest (EOIs) are passed on by the CRN, and include contact details for the relevant Practices. Record details of EOIs in `safer_wearables_gp_practice_recruitment`.

### Responding to EOIs

Fill in the Practice-specific details in the PIC agreement (currently v.1.1), as detailed in the instruction pages (then deleting the instruction pages).

Then send an initial response email to EOIs (based on template `GP_Practice_responding_to_EOI.emltpl`, including:
- A thank you
- The broader topic
- An outline of the whole study
- The role of the Practice within the study, including what is required of them
- Study documentation (protocol, PIS, consent form, invitation letter)
- PIC agreement (after filling in Practice-specific details): ask the Practice to review any details entered, and fill in the remaining fields.
- HRA approvals
- Next steps: confirming point of contact, site initiation visit.

### Site initiation visit

Prepare for the site initiation visit (SIV) by:
- Reviewing any communications with the GP Practice, noting any outstanding queries, and progress on the PIC agreement.
- Decide on potential times for the Practice to take part.
- Inserting the Practice's point of contact in the presentation slides.

Meet remotely with the GP Practice, using the `SAFER_Wearables_SIV.pptx` presentation. The presentation covers:
- Learning objectives
- How this study fits into the broad topic, and the SAFER Programme
- Overview of the study (including details of what participants are asked to do, and including that any enquiries from participants should be referred to the study team).
- What GP Practices are asked to do (including that no health-related data will be returned to participants or practices)
- Inclusion and exclusion criteria
- Next steps: point of contact, PIC agreement, deciding on mutually convenient dates.

### Approvals
- Complete paperwork: PIC agreement