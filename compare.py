# from nltk import agreement
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import csv
import os
import errno

# files = ['data/songwise/okazaki_SongWise.csv','data/songwise/akira_SongWise.csv', 'data/songwise/satoru_SongWise.csv']
files = ['data/preference/okazaki_SongComparison_1220.csv','data/preference/akira_SongComparison_1223.csv', 'data/preference/satoru_SongComparison_1219.csv']
# files = ['data/similarity/okazaki_SongComparison_1220.csv','data/similarity/akira_SongComparison_1223.csv', 'data/similarity/satoru_SongComparison_1219.csv']

# file = 'data/similarity/satoru_SongComparison_1219.csv'
# file = 'data/preference/satoru_SongComparison_1219.csv'

users = [] 

# user data as stored in a numpy array
# read data from csv
# converts files to numpy arrays 
# convert numpy array to dataframe
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

def feature_wise(files):
    
    for i in range(len(files)):
        df = pd.read_csv(files[i], dtype=np.float64)
        users.append(df)
        
        focus_cols = ['texture', 'consonance','rhythmic', 'familiarity','valence', 'excitement','liking', 'ornamentation','grooviness','tempo','pitch','timbre','sound_quality']
        cor=df.corr().filter(focus_cols)
        # drop the first row of headers with NaN values
        users[i]= users[i].drop([0],axis=0)
        # print(users[i])
        path='output/songwise_'+str(i)+'.csv'
        
        f= open(path,"w+")
        
        cor.to_csv(path_or_buf=path)
        
        f.close()
    return users              

def preference(files):
    
    for i in range(len(files)):
        df = pd.read_csv(files[i], dtype=np.float64)
        users.append(df)
        users[i]= users[i].drop(['Row'],axis=1)

    df_concat = pd.concat((users[0],users[1],users[2])).groupby(level=0)
    df_mean= df_concat.mean()
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

def similarity(files):
    
    for i in range(len(files)):
        df = pd.read_csv(files[i], dtype=np.float64)
        users.append(df)
        users[i]= users[i].drop(['Row'],axis=1)

    df_concat = pd.concat((users[0],users[1],users[2])).groupby(level=0)
    df_mean= df_concat.mean()
    filename = "output/similarity.csv"
    
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
preference(files)
# feature_wise(files)
