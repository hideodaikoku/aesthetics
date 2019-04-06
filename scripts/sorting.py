from numpy import genfromtxt
import numpy
# F_NAME="data/preference/satoru_SongComparison_1219.csv'"
F_NAME="../perceptual-ratings/similarity/rater_5.csv"

def sort():
    #reads csv to pandas array
    data=genfromtxt(F_NAME, delimiter=',')
    print(data)
    for i in range(len(data)):
        for j in range(len(data[i])):

            #switches rows and columns
            if i>j:
                print('empty',data[i,j],data[j,i])
                data[i,j]=data[j,i] 
    
    print(data)

    numpy.savetxt(F_NAME, data.astype(int), fmt='%i', delimiter=",")

sort()