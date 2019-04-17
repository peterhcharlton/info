# Teaching Resources

This page provides links to resources which I have used in teaching.

## Software Packages

I have found the following software packages particularly helpful during my research:

* **Reference Manager**: [Mendeley](https://www.mendeley.com/) is a free program which keeps your articles in one place. It allows you to search through the articles, and also create reference lists quickly which can be used in MS Word and Latex documents.
* **Latex Editor**: [TeXShop](https://en.wikipedia.org/wiki/TeXShop) and [TeXstudio](http://www.texstudio.org/) are free programs for editing latex documents. TeXShop is designed for MacOS, and TeXstudio is useful for other operating systems. TeXstudio requires a Latex typesetting system to function, such as [MikTex](https://miktex.org/). I have also found [TeXcount](https://www.ctan.org/tex-archive/support/texcount) useful for counting the number of words in Latex files (such as theses).
* **Automated Backups**: [Google Drive](https://www.google.com/drive/) and [Dropbox](https://www.dropbox.com/) both allow you to backup your files to the cloud (automatically backing up any new or edited files when you're connected to the internet), and synchronise them between computers.
* **Code Respositories**: [GitHub](https://github.com/) allows you to backup your code online, keep a history of changes, and synchronise it between computers. It also provides a platform for creating a free website.
* **Matlab &reg; and Octave**: [Matlab](https://www.mathworks.com/products/matlab.html) is widely used to perform mathematical analyses in university engineering departments. It requires a licence. [Octave](https://www.gnu.org/software/octave/) is freely available software which is largely compatible with Matlab &reg;.

## Search Engines for Finding Publications

The following search engines have been useful for finding publications:

* [Google Scholar](https://scholar.google.co.uk/): Provides both a simple and an 'Advanced Search'.
* [IEEE Xplore <sup>TM</sup>](http://ieeexplore.ieee.org/): A database of scientific and technical content published by the IEEE (Institute of Electrical and Electronics Engineers) and partners.
* [ScienceDirect](http://www.sciencedirect.com/): A database of scientific, technical and medical research
* [Scopus](https://www.scopus.com/): A database of peer-reviewed research literature
* [PubMed](https://www.ncbi.nlm.nih.gov/pubmed/): A database of medical research, including much biomedical engineering research

## Relevant Journals

I have found the following journals to be highly relevant in my research into physiological measurement techniques, and in the broader field of biomedical engineering:

* [Physiological Measurement](http://iopscience.iop.org/journal/0967-3334/): including several [Focus Issues](http://iopscience.iop.org/journal/0967-3334/page/Focus%20issues).
* [IEEE Transactions on Biomedical Engineering](https://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=10)
* [Annals of Biomedical Engineering](http://www.springer.com/biomed/journal/10439)
* [Journal of Biomedical and Health Informatics](http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=6221020)
* [Medical Engineering & Physics](https://www.journals.elsevier.com/medical-engineering-and-physics)
* [Biomedical Engineering Online](https://biomedical-engineering-online.biomedcentral.com/)
* [Journal of Medical Engineering and Technology](http://www.tandfonline.com/loi/ijmt20)
* [Biomedical Signal Processing and Control](https://www.journals.elsevier.com/biomedical-signal-processing-and-control/)
* [Journal of Clinical Monitoring and Computing](http://www.springer.com/medicine/anesthesiology/journal/10877)
* [Medical & Biological Engineering and Computing](https://link.springer.com/journal/11517)
* [IEEE Reviews in Biomedical Engineering](http://ieeexplore.ieee.org/xpl/RecentIssue.jsp?punumber=4664312/)
* [MDPI Sensors](http://www.mdpi.com/journal/sensors): see also the upcoming special issue in [MDPI Applied Sciences](https://www.mdpi.com/si/applsci/Signals_Care) on Signals in Health Care.

In addition, [this webinar](https://www.brighttalk.com/webcast/8013/301799/an-introduction-to-best-practices-for-refereeing-a-journal-manuscript) provides a useful "introduction to best practices for refereeing a journal manuscript", including a referee report template. [This webpage](http://www.drpaulwong.com/how-to-write-a-good-manuscript-review/) and [this webpage](https://resource-cms.springernature.com/springer-cms/rest/v1/content/13445048/data/v6) give top tips on writing a good review.

A cover letter template is available [here](https://authorservices.taylorandfrancis.com/writing-a-cover-letter/).

## Relevant Conferences

* [International Electronic Conference on Sensors and Applications](https://ecsa-5.sciforum.net/): an online conference which accepts both poster and 6-page paper submissions, and has open-access proceedings.

## Algorithms

Here are some of the publicly available algorithms which I have found helpful, and which I would recommend. They are written for Matlab &reg; .

### Beat Detectors

* [ECG beat detector](http://www.mit.edu/~gari/CODE/ECGtools/ecgBag/rpeakdetect.m): A beat detector for use with the ECG, written by Gari Clifford. Based on the algorithm described by Pan, Hamilton and Tompkins (refs: [1](http://doi.org/10.1109/TBME.1985.325532) and [2](http://doi.org/10.1109/TBME.1986.325695)). Available under the GNU GPL.
* [Arterial blood pressure beat detector](https://www.physionet.org/physiotools/cardiac-output/code/2analyze/wabp.m): A beat detector for use with the ABP signal, written by James Sun. Based on the code and algorithm developed by Wei Zong (ref: [1](http://doi.org/10.1109/CIC.2003.1291140) ).

### Signal Quality Assessment

* [Signal Quality Indices for ECG and PPG](http://peterhcharlton.github.io/RRest/algorithms.html): Signal quality indices for use with the ECG and PPG signals (ref: [1](https://doi.org/10.1109/JBHI.2014.2338351) ). They are contained within the *RRest* algorithms.
* [Signal Quality Index for ABP](https://www.physionet.org/physiotools/cardiac-output/code/2analyze/jSQI.m): written by James Sun.

### Physiological Parameter Estimation

* [Cardiac Output Estimation](https://www.physionet.org/physiotools/cardiac-output/): Scripts to estimate cardiac output from the ABP signal, written by James Sun.
* [Pulse Transit Time Estimation](http://uk.mathworks.com/matlabcentral/fileexchange/37746-ttalgorithm): Scripts to estimate pulse transit time using simultaneous pulsatile waveforms, written by Nick Gaddum.
* [Respiratory Rate Estimation](http://peterhcharlton.github.io/RRest/algorithms.html): Code for assessing the performance of respiratory rate algorithms applied to the ECG and PPG, written by Peter H Charlton.


## Data Repositories

I have used these data repositories to make resources publicly available:

* [Zenodo](https://zenodo.org/): Zenodo accepts many types of resources (such as datasets, images, posters, presentations, software ...). See [this page](https://zenodo.org/search?page=1&size=20&q=%22peter%20h%20charlton%22) for examples of resources I have uploaded.
* [PhysioNet](https://www.physionet.org/): PhysioNet is a subject-specific repository for physiological signals.
* [King's Research Data Management System](https://www.kcl.ac.uk/library/researchsupport/research-data-management/Preserve-and-Share/Deposit-your-data-with-Kings3.aspx): A repository available to members of King's College London.

## Matlab &reg; Scripts

I have found the following Matlab &reg; scripts very helpful:

* [export_fig](https://uk.mathworks.com/matlabcentral/fileexchange/23629-export-fig): Useful for saving Matlab &reg; figures in formats for publication. For instance, often publications require figures in *.eps* format with fonts embedded, which this script can provide.

[This publication](http://doi.org/10.1371/journal.pbio.1001745) provides some helpful tips on writing code.

## Textbooks

* [The Scientist and Engineer's Guide to Digital Signal Processing](http://www.dspguide.com/)
* [Advanced Methods and Tools for ECG Data Analysis](http://www.robots.ox.ac.uk/~gari/ecgbook.html)
* [Snapshots of Haemodynamics](https://doi.org/10.1007/978-1-4419-6363-5): A concise overview of several aspects of haemodynamics
* [Biomedical Instrumentation Lecture Notes](https://www.robots.ox.ac.uk/~neil/teaching/lectures/med_elec/): A helpful course introducing several types of physiological measurement (ECG, EEG, respiration, pulse oximetry and blood pressure).
* [An Introduction to Medical Statistics](https://www-users.york.ac.uk/~mb55/intro/introcon.htm): A comprehensive textbook on statistics for use in clinical studies.
* [Statistics Notes in the BMJ](https://www-users.york.ac.uk/~mb55/pubs/pbstnote.htm): Although not strictly a textbook, this series of notes provides a very helpful introduction to several statistical topics frequently encountered in medical research, written by Bland, Altman et al.
* [An Introduction to Cardiovascular Physiology](https://www.sciencedirect.com/science/book/9780750610285)

## Lecture Courses and Presentations

* [Biomedical Signal and Image Processing](https://ocw.mit.edu/courses/health-sciences-and-technology/hst-582j-biomedical-signal-and-image-processing-spring-2007/index.htm): Available from MIT OpenCourseWare, including lecture slides and lab practical resources.
* [Teaching Medical Physics](http://www.iop.org/education/teacher/resources/teaching-medical-physics/page_54690.html): A set of resources provided by the Institute of Physics covering some commonly used physiological measurement and imaging techniques.

## Datasets

* [Virtual Database of Pulse Waves](http://haemod.uk/virtual-database): Pulse waves simulated at several arterial sites under a range of cardiovascular conditions (refs: [1](http://doi.org/10.1152/ajpheart.00175.2015) and [2](https://doi.org/10.1016/j.jbiomech.2016.11.001)). Simulated using the Nektar1D model of pulse wave propagation (ref: [3](https://www.researchgate.net/profile/Jordi_Alastruey/publication/256009078_Arterial_pulse_wave_haemodynamics/links/00b7d52164d5dd7b3c000000/Arterial-pulse-wave-haemodynamics.pdf) ).
* [PhysioNet](https://physionet.org/): An invaluable collection of physiological datasets, many of which contain physiological signals such as the ECG.
* [CapnoBase](http://www.capnobase.org/database/pulse-oximeter-ieee-tbme-benchmark/): Recordings of ECG, PPG and capnography signals from patients during elective surgery and routine anaesthesia. Contains annotations of breaths. (ref: [1](http://doi.org/10.1109/TBME.2013.2246160) ).
* [Vortal](http://peterhcharlton.github.io/RRest/vortal_dataset.html): Recordings of ECG, PPG, impedance pneumography, and reference oral-nasal respiratory signals acquired from young and elderly healthy subjects at rest (ref: [1](http://doi.org/10.1088/0967-3334/37/4/610) [2](http://doi.org/10.1088/1361-6579/aa670e) ).

## Writing Grant Applications

I have benefited from the resources provided by [Parker Derrington Ltd](http://parkerderrington.com/), which are provided in their [blog](https://parkerderrington.com/catalogue/), including:
* [Preparing to write a grant application](http://parkerderrington.com/are-you-ready-to-start/)
* [Structuring the application around 10 key sentences](http://parkerderrington.com/get-the-framework-in-place-quickly/)
* [Writing 10 key sentences](http://parkerderrington.com/key-sentence-skeletons/)

## Ethics Resources

* [HRA Decision Tool](http://www.hra-decisiontools.org.uk/ethics/): This is helpful for determining whether your intended project requires ethical approval.
* [UK Policy for Health and Social Care Research](https://www.hra.nhs.uk/planning-and-improving-research/policies-standards-legislation/uk-policy-framework-health-social-care-research/): Principles for conducting health research.
* [Publishing Ethics](https://authorservices.wiley.com/asset/Best-Practice-Guidelines-on-Publishing-Ethics-2ed.pdf): Information on the ethics surrounding publications, with a helpful link to the International Committee of Medical Journal Editors' [recommendations](http://www.icmje.org/recommendations/browse/roles-and-responsibilities/defining-the-role-of-authors-and-contributors.html) for identifying authors. The IEEE also provide a helpful [definition of authorship](http://ieeeauthorcenter.ieee.org/publish-with-ieee/publishing-ethics/definition-of-authorship/).

## Careers Resources

* Deciding whether to do a PhD: The following websites provide some helpful insight into life as a PhD student: [FindAPhD](https://www.findaphd.com/advice/doing/), [Jobs.ac.uk](https://blog.jobs.ac.uk/phd-student/).
* Time management: [This website](https://www.ithinkwell.com.au/) is helpful for PhD students.
* [Interview Tips](http://www.jobs.ac.uk/careers-advice/interview-tips/): Guidance from *jobs.ac.uk* on preparing for job interviews, including their [top 5 academic interview questions and answers](http://www.jobs.ac.uk/careers-advice/interview-tips/1276/top-5-academic-interview-questions-and-answers).
* [A PhD is not enough](https://books.google.co.uk/books?id=ITOb1M1JXkUC): "Helpful tips on survival in academic science".

## Public Engagement Resouces

* [UK Research and Innovation Guides](https://www.ukri.org/public-engagement/research-council-partners-and-public-engagement-with-research/guides-policies-research-and-publications/): A collection of guides on public engagment, including one on the [benefits](https://www.ukri.org/files/legacy/scisoc/rcukbenefitsofpe-pdf/) of public engagement for researchers.
