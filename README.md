## Lucie Preau-Petit's portfolio

This Portfolio currently contains programs used during my master, sorted by language. 

### Context of the scripts

These scripts were written as part of my Master thesis, analysing the usability of diphthongs for forensic voice analysis. In other words "can we differentiate between speakers based on the way they pronounce diphthongs?". The code presented here focuses on the following steps:
- from voice recordings the values of the formants are measured during each diphthong.
- the values are fitted against a sin wave to describe their trajectories.
- the trajectories are compared within an between each recording using a multivatiate kernel density function (MVKD) as described by Aitken and Lucy (2004)(DOI: 10.1046/j.0035-9254.2003.05271.x). It is expected that a pair of recording from the same speaker will produce a positive MVKD and a pair of recording from different speaker will produce a negative MVKD.
- the results of the MVKD for each pair of recordings are compared using a T-Test to evaluate the results.

### Programming languages used
- Praat
- Python

### Test data

Unfortunately at this time, no test data can be provided as voice recordings are sensitive information that requier anomymising and permission from the speakers to be made public. 