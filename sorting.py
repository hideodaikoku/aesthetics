from numpy import genfromtxt
import numpy
# F_NAME="data/preference/satoru_SongComparison_1219.csv'"
F_NAME="data/similarity/satoru_SongComparison_1219.csv"

def sort():
    #reads csv to pandas array
    data=genfromtxt(F_NAME, delimiter=',')

    #delete header row and column
    data = numpy.delete(data, (0), axis=0)
    data = numpy.delete(data, (0), axis=1)
   
    for i in range(len(data)):
        for j in range(len(data[i])):

            #switches rows and columns
            if i>j:
                if data[i,j]==0:
                    print('empty',data[i,j],data[j,i])
                    data[i,j]=data[j,i]
                    data[j,i]=0
            

    numpy.savetxt(F_NAME, data.astype(int), fmt='%i', delimiter=",")
sort()