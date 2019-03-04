# from nltk import agreement
import seaborn as sn
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import csv
import os
import errno
from scipy.stats import pearsonr

# Songwise Feature Comparison
# files = ['../data/songwise/okazaki_SongWise.csv','../data/songwise/akira_SongWise.csv', '../data/songwise/satoru_SongWise.csv']

# Pairwise Preference Comparison
# files = ['../data/preference/okazaki_SongComparison_1220.csv','../data/preference/akira_SongComparison_1223.csv', '../data/preference/satoru_SongComparison_1219.csv']

# Pairwise Similarity Comparison
files = ['../data/similarity/okazaki_SongComparison_1220.csv','../data/similarity/akira_SongComparison_1223.csv', '../data/similarity/satoru_SongComparison_1219.csv']

# Data Sorting
# file = '../data/similarity/satoru_SongComparison_1219.csv'
# file = '../'data/preference/satoru_SongComparison_1219.csv'

users = [] 
feat = []

# reads data from csv and converts to dataframes
def format(file):
    df = pd.read_csv(file, dtype=np.float64)
    df=df.drop(['Row'],axis=1)

    df.columns=range(df.shape[1])

    for column in df:
        for i in range(20):
            df[i][column]=df[column][i]
            df[column][i]=0
        
    filename = "data/preference/satoru_SongComparison.csv"
    # filename = "data/similiarity/satoru_SongComparison.csv"
    if not os.path.exists(os.path.dirname(filename)):
        try:
            os.makedirs(os.path.dirname(filename))
        except OSError as exc: # Guard against race condition
            if exc.errno != errno.EEXIST:
                raise

    f= open(filename,"w+")
    df.to_csv(path_or_buf=filename)    
    f.close()
    print(df)

# plots the feature correlations as a heatmap -- not used for final paper
def feature_wise(files):
  
    df_mean = pd.read_csv("output/songwise_average.csv", dtype=np.float64)
        
    plt.figure(figsize = (10,6))
    mask = np.zeros_like(df_mean)
    mask[np.triu_indices_from(mask)] = True
    with sn.axes_style("white"):
        sn.heatmap(df_mean, mask=mask, annot=True, vmin=-1, vmax=1, square=False)
    plt.xticks(rotation=45, ha='right')
    plt.yticks(fontsize=6,va='center')
    plt.title('Average Feature Correlation',fontsize=16) 
    plt.show()

    return users

# sorts the files by row
def sort(files):
    sorter =[]
    for i in range(len(files)):
        df = pd.read_csv(files[i], dtype=np.float64)
        users.append(df)
        users[i]= users[i].drop(['Row'],axis=1)
        for col in df:
            sorter.append(df[col].values)
        # snort.sort(reverse=True)
        snort=[]
        sorter= sorter[1:20]
        for item in sorter:
            for element in item:
                snort.append(element)
        print("User ", i)
        print(snort)
    return 


# calculates the mean preference ratings -- not used for paper
def preference(files):
    for i in range(len(files)):
        df = pd.read_csv(files[i], dtype=np.float64)
        users.append(df)
        users[i]= users[i].drop(['Row'],axis=1)

    df_concat = pd.concat((users[0],users[1],users[2])).groupby(level=0)
    df_mean= df_concat.mean()
    df_mean.columns=['Central Africa', 'Bali','Java','Korea','Spain','Japan','Cuba','Central Asia', 'Central America','Australia','Brazil','Jazz', 'Ballad','Bulgaria','South India','China','Europe','Chamber Music','North India','Boston']
    df_mean.index=['Central Africa', 'Bali','Java','Korea','Spain','Japan','Cuba','Central Asia', 'Central America','Australia','Brazil','Jazz', 'Ballad','Bulgaria','South India','China','Europe','Chamber Music','North India','Boston']
    df_mean= df_mean.round(2)
    plt.figure(figsize = (10,6))
    mask = np.zeros_like(df_mean)
    mask[np.triu_indices_from(mask)] = True
    with sn.axes_style("white"):
        sn.heatmap(df_mean, annot=True, mask=mask, vmin=0, vmax=100, square=False)
    
    plt.xticks(rotation=45, fontsize=6, ha='right')
    plt.yticks(fontsize=6,va='center')
    plt.title('Average User Preference Ratings',fontsize=16)
    plt.show()

    filename = "output/preference.csv"
    if not os.path.exists(os.path.dirname(filename)):
        try:
            os.makedirs(os.path.dirname(filename))
        except OSError as exc: # Guard against race condition
            if exc.errno != errno.EEXIST:
                raise

    f= open(filename,"w+")
    df_mean.to_csv(path_or_buf=filename)    
    f.close()
    
    return users

# calculates average similarity ratings
def similarity(files):
    
    for i in range(len(files)):
        df = pd.read_csv(files[i], dtype=np.float64)
        users.append(df)
        users[i]= users[i].drop(['Row'],axis=1)

    df_concat = pd.concat((users[0],users[1],users[2])).groupby(level=0)
    
    df_mean= df_concat.mean()
    df_mean.columns=['Central Africa', 'Bali','Java','Korea','Spain','Japan','Cuba','Central Asia', 'Central America','Australia','Brazil','Jazz', 'Ballad','Bulgaria','South India','China','Europe','Chamber Music','North India','Boston']
    df_mean.index=['Central Africa', 'Bali','Java','Korea','Spain','Japan','Cuba','Central Asia', 'Central America','Australia','Brazil','Jazz', 'Ballad','Bulgaria','South India','China','Europe','Chamber Music','North India','Boston']
    df_mean= df_mean.round(2)
    

    # plots as heatmap
    plt.figure(figsize = (12,6))
    mask = np.zeros_like(df_mean)
    mask[np.triu_indices_from(mask)] = True
    with sn.axes_style("white"):
        sn.heatmap(df_mean, annot=True, mask=mask, vmin=0, vmax=100, cmap="YlGnBu",square=False)
    
    plt.xticks(rotation=45, fontsize=4, ha='right')
    plt.yticks(fontsize=6,va='center')

    plt.title('Average User Similarity Ratings',fontsize=16)
    plt.show()
    
    filename = "output/similarity.csv"
    #saves the result to a file
    if not os.path.exists(os.path.dirname(filename)):
        try:
            os.makedirs(os.path.dirname(filename))
        except OSError as exc: # Guard against race condition
            if exc.errno != errno.EEXIST:
                raise

    f= open(filename,"w+")
    df_mean.to_csv(path_or_buf=filename)    
    f.close()

    return users

# format(file)
# similarity(files)
# preference(files)
# feature_wise(files)
sort(files)