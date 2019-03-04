# cross-cultural-aesthetics

A cross cultural study of perceptual features analysis of World Music. 

* Below is the tree structure of the repository. Please look at `/perceptual-ratings` for experiment data.
* Audio files are under thee directory `/audio` as WAV file, normalized and cropped to 10s samples.


```
|── audio
|── dsp-feature-extractions
│   |── chroma
│   |── mel
│   |── mfcc
├── feature-correlations
│   ├── README.md
│   ├── songwise_0.csv
│   ├── songwise_1.csv
│   └── songwise_2.csv
├── output
│   ├── avg-feature-correlations.csv
│   ├── avg-feature-correlations.xls
│   ├── avg-feature-ratings.csv
│   ├── avg-preference.csv
│   ├── avg-similarity.csv
│   └── similarity-icc.xlsx
├── perceptual-ratings
│   ├── preference
│   │   ├── akira_SongComparison_1223.csv
│   │   ├── okazaki_SongComparison_1220.csv
│   │   └── satoru_SongComparison_1219.csv
│   ├── similarity
│   │   ├── akira_SongComparison_1223.csv
│   │   ├── okazaki_SongComparison_1220.csv
│   │   └── satoru_SongComparison_1219.csv
│   └── songwise
│       ├── akira_SongWise.csv
│       ├── okazaki_SongWise.csv
│       └── satoru_SongWise.csv
├── requirements.txt
└── scripts
    ├── R_MDS.r
    ├── compare.py
    ├── full-similarity.py
    ├── icc.r
    ├── scratch2.r
    └── sorting.py
```
