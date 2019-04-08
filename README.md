# cross-cultural-aesthetics

A cross cultural study of perceptual features analysis of World Music. 

* Below is the tree structure of the repository. Please look at `/perceptual-ratings` for experiment data.
* Audio files are under thee directory `/audio` as WAV file, normalized and cropped to 10s samples.


```
|-- README.md
|-- audio
|-- dsp-feature-extractions
|   |-- chroma
|   |-- mel
|   |-- mfcc
|   `-- melodia
|-- feature-correlations
|-- features
|-- output
|   |-- IRR.csv
|   |-- avg-feature-correlations.csv
|   |-- avg-feature-correlations.xls
|   |-- avg-feature-ratings.csv
|   |-- avg-preference.csv
|   |-- avg-similarity.csv
|   |-- musly.csv
|   |-- pohle.csv
|   `-- similarity-icc.xlsx
|-- perceptual-ratings
|   |-- backup
|   |-- preference
|   |-- similarity
|   `-- songwise
|-- requirements.txt
`-- scripts
    |-- MDS.r
    |-- Plot_IRR.ipynb
    |-- full-similarity.py
    |-- icc.r
    `-- sorting.py
```
