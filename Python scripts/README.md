## Python scripts

This folder is dedicated to the python scripts that I wrote. 

#### FormantTrajectoryAnalysis

This script reads the .csv file containing the result from the formant extractions in Praat (see Praat scripts). Transforms the single values into trajectories, that is sine waves, and compares the variances within and between each group to asses the probability of their common origin, as described by Aitken and Lucy (2004).

#### MVKD_Implementation

This script contains an exerpt from the previous one, focusing on the implementaion of the MVKD analysis, as introduced by Aitken and Lucy (2004).

#### T-Test

This script applies a T-test to the previous results to estimate whether the results from the MVKD did reliably differentiate between speakers.