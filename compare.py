from nltk import agreement
from mpl_toolkits.mplot3d import Axes3D 
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import csv

files = ['data/songwise/okazaki_SongWise.csv','data/songwise/akira_SongWise.csv', 'data/songwise/satoru_SongWise.csv']
files = ['data/preference/okazaki_SongComparison_1220.csv','data/preference/akira_SongComparison_1223.csv', 'data/preference/satoru_SongComparison_1219.csv']
files = ['data/similarity/okazaki_SongComparison_1220.csv','data/similarity/akira_SongComparison_1223.csv', 'data/similarity/satoru_SongComparison_1219.csv']
users = ['','',''] 

# user data as stored in a numpy array
# read data from csv
# converts files to numpy arrays 
# convert numpy array to dataframe

def read_data(files):
    
    for i in range(len(files)):
        users[i] = pd.DataFrame(np.array(np.genfromtxt(files[i], delimiter=',')))
        
        # drop the first row of headers with NaN values
        users[i]=users[i].drop([0], axis=0) 
        
        print(users[i])

return users[i]

def stylistic_aesthetic():
    
    #returns stylsitic to aesthetic comparisons for all three participants as a dictionary
    return stylistic_aesthetic_output

def aesthetic():

    #returns aesthetic to aesthetic for all three participants as a dictionary
    return aesthetic_output

def stylistic():

    #returns aestetic 
    return stylsitic_output

def to_csv(filename):
    return
    #converts outputs ot csv and saves the filename

def main()
    readings = read_data(files)

