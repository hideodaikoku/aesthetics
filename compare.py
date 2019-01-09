from nltk import agreement
from mpl_toolkits.mplot3d import Axes3D 
import numpy as np
import matplotlib.pyplot as plt
import csv

files = ['data/songwise/okazaki_SongWise.csv','data/songwise/akira_SongWise.csv', 'data/songwise/satoru_SongWise.csv']

users = ['','',''] 
# user data as stored in a numpy array

# read data from csv
# converts files to numpy arrays 

def read_data(files):
    
    for i in range(len(files)):
        users[i] = np.array(np.genfromtxt(files[i], delimiter=','))
    
    songwise=np.array(users)
   
    

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

read_data(files)
    # output_1 = stylistic_aesthetic()
    # to_csv(output_1)

    # output_2 = stylistic()
    # to_csv(output_1)
    
    # output_3 = aesthetic()
    # to_csv(output_1)
