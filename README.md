[README.md](https://github.com/user-attachments/files/32561635/README.md)
# HBS Health Phenome Analysis

Code accompanying: **"Health phenome of Parkinson's patients reveals prominent mood-sleep cluster"**

Olsen AL, Locascio JJ, Tuncali I, Laroussi N, Abatzis E, Kamenskaya P, Kuras Y, Yi T, Videnovic A, Hayes MT, Ho GPH, Paulson J, Khurana V, Herrington TM, Hyman BT, Selkoe DJ, Growdon JH, Gomperts SN, Riise T, Schwarzschild MA, Hung AY, Wills AM, Scherzer CR.

Published in *Parkinsonism & Related Disorders* (2026 Aug 6;151:108923, doi: [10.1016/j.parkreldis.2026.108923](https://doi.org/10.1016/j.parkreldis.2026.108923)). An earlier version of this manuscript was posted to medRxiv on February 1, 2022 (doi: [10.1101/2022.02.01.22270276](https://doi.org/10.1101/2022.02.01.22270276)); the most recent preprint version was posted May 4, 2026.

## Project Overview

This repository contains the analysis code used to evaluate associations between 64 clinical, pharmacological, and environmental variables and Parkinson's disease (PD) status in the Harvard Biomarkers Study (HBS; now the Yale Harvard Biomarkers Study, YHBS).

- **Input data:** De-identified subject-level clinical questionnaire data (binary yes/no variables covering comorbidities, medications, supplements, and exposures), plus demographic covariates (age, sex) and diagnostic group (PD vs. healthy control). Patient-level data are not included in this repository (see Data Availability below).
- **What the code does:** Tests each of the 64 clinical variables individually for association with PD diagnosis using age- and sex-adjusted logistic regression, then clusters the variables by their pairwise correlation structure to identify co-occurring trait groups.
- **Outputs:** Odds ratios, confidence intervals, and p-values for each variable-PD association (SAS); a Pearson correlation matrix and hierarchical-clustering heatmap figures (R, PDF output).

The analysis included 933 PD cases and 291 healthy controls (494 PD and 142 controls after excluding subjects with missing data).

## Documentation and Working Example

### 1. Logistic regression (SAS)

`HBS_PD_analysis.sas` expects a SAS dataset named `PD` (loaded via `SET Work.PD`) with one row per subject, containing `Subj_UID`, `Dx` (PD vs. control), `Age`, `Sex`, and the 64 binary clinical/exposure variables listed in Supplemental Table 1 of the manuscript.

Example run from the SAS command line, after placing your dataset where SAS can find it:
```
sas HBS_PD_analysis.sas -log HBS_PD_analysis.log
```
This produces:
- Descriptive statistics (`PROC FREQ`, `PROC TTEST`) comparing cases and controls
- A full multivariable logistic regression model (all 64 variables + age + sex)
- 64 separate single-variable models, each adjusted for age and sex (used to generate Figure 1 and Supplemental Tables 1–2)

Multiple-testing correction (FDR < 0.05) is applied to the resulting p-values outside of this script.

### 2. Correlation clustering (R)

`HBS_correlations.R` expects a CSV of pairwise Pearson correlation coefficients (`HBS_correlations_diagtozero_minus4.csv`, with diagonal values set to zero), placed in an `input/` subfolder of the working directory set at the top of the script.

Example run from the command line:
```
Rscript HBS_correlations.R
```
This produces heatmap PDF figures (saved to an `output/` subfolder) showing hierarchically clustered correlation structure across the 64 variables, corresponding to Figure 2A-B of the manuscript.

## System Requirements & Dependencies

- **SAS:** version 9.4. No other versions have been tested.
- **R:** version not pinned by the original authors; developed/tested with the following packages:
  - `tidyr`
  - `corrplot` (v1.1.423 used for the published figures)
  - `RColorBrewer`
- **GraphPad Prism:** version 8.4.3, used for additional figure formatting outside of the R script.
- No specific CPU/memory requirements; these are standard statistical scripts run on a single dataset (n ≈ 1,224 subjects) and do not require a cluster.
- **OS:** not restricted; scripts were run on macOS (file paths in `HBS_correlations.R` reflect this — see Limitations).

If data are required to run this code, they are not contained within this repository. See **Data Availability** below for how to request access.

## Installation

Clone the repository:
```
git clone https://github.com/abbyolsen/HBS.git
cd HBS
```
No build step or package installation script is provided. Install the R packages listed above via `install.packages(c("tidyr", "corrplot", "RColorBrewer"))` before running `HBS_correlations.R`. SAS is a licensed, locally installed application; no additional installation is handled by this repository.

## Folder Structure

| File | Description |
|---|---|
| `HBS_PD_analysis.sas` | SAS script for the primary age- and sex-adjusted logistic regression analysis |
| `HBS_correlations.R` | R script for correlation matrix clustering and heatmap generation |
| `README.md` | This file |

There are no subfolders in this repository; input/output paths referenced by the scripts (`input/`, `output/`) must be created locally by the user.

## Limitations

- This code was written to clean and analyze data for this specific study; it is not a general-purpose package and variable names are hard-coded to match the HBS questionnaire.
- `HBS_correlations.R` contains a hard-coded, machine-specific file path (`/Volumes/Macintosh HD/Users/Abby/Documents/HBS/`) that must be edited before running.
- The SAS script has only been tested in SAS 9.4; the R script's package versions have only been tested as listed above.
- Results and associations reported from this code are correlative, not causal (cross-sectional case-control design).
- Subjects with any missing data across the 64 variables were excluded from all analyses, which may introduce bias relative to the full cohort.

## Citation

If you use this code, please cite the associated publication:

Olsen A, Locascio J, Tuncali I, Laroussi N, Abatzis E, Kamenskaya P, Kuras Y, Yi T, Videnovic A, Hayes M, Ho G, Paulson J, Khurana V, Herrington T, Hyman B, Selkoe D, Growdon J, Gomperts S, Riise T, Schwarzschild M, Hung A, Wills A, Scherzer C. Health phenome of Parkinson's patients reveals prominent mood-sleep cluster. *Parkinsonism Relat Disord*. 2026 Aug 6;151:108923. doi: [10.1016/j.parkreldis.2026.108923](https://doi.org/10.1016/j.parkreldis.2026.108923). PubMed: https://pubmed.ncbi.nlm.nih.gov/42579898/

Preprint: https://doi.org/10.1101/2022.02.01.22270276

A citation file (`CITATION.cff`) can be generated for this repository using the [Citation File Format generator](https://citation-file-format.github.io/cff-initializer-javascript/).

## License

This project is licensed under the MIT License. See [`LICENSE.txt`](LICENSE.txt) for details.

## Acknowledgements

This research was funded in part by Aligning Science Across Parkinson's [ASAP-000301] through the Michael J. Fox Foundation for Parkinson's Research (MJFF).

The Harvard Biomarkers Study (HBS) was founded and co-directed by Dr. Clemens Scherzer and Dr. Bradley T. Hyman. After his move to Yale, Dr. Scherzer is directing its expansion, the Yale Harvard Biomarkers Study (YHBS). HBS was seeded by the Harvard NeuroDiscovery Center, with contributions from APDA Center for Advanced Research awards (to C.R.S.), the Michael J Fox Foundation (to C.R.S.), NINDS U01NS082157 (to C.R.S.), U01NS100603 (to C.R.S.), and the Massachusetts Alzheimer's Disease Research Center NIA P50AG005134.

C.R.S.'s work is supported by NIH grants U01NS095736, U01NS100603, R01AG057331, and R01NS115144, and the American Parkinson Disease Association Center for Advanced Parkinson Research at BWH and Yale.

`HBS_correlations.R` was written by Joanna DiSpirito.

## Data Availability

Patient-level HBS data are not publicly deposited but are available from the corresponding author upon request. Supplemental materials, a Key Resource Table, and persistent identifiers for data, code, protocols, and key lab materials are deposited in Zenodo:
- Supplemental materials: https://doi.org/10.5281/zenodo.19583021
- Key Resource Table: https://doi.org/10.5281/zenodo.19924992

## Contact

Abby L. Olsen, MD, PhD — University of Pittsburgh — abby.olsen@pitt.edu
Clemens R. Scherzer, MD — Yale School of Medicine — clemens.scherzer@yale.edu
