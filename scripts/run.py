import pandas as pd
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
matplotlib.style.use('ggplot')

def run():
    df1 = pd.read_csv('../perceptual-ratings/similarity/akira_SongComparison_1223.csv',sep=',').drop(['Row'],axis=1)
    df2 = pd.read_csv('../perceptual-ratings/similarity/okazaki_SongComparison_1220.csv',sep=',').drop(['Row'],axis=1)
    df3 = pd.read_csv('../perceptual-ratings/similarity/satoru_SongComparison_1219.csv',sep=',').drop(['Row'],axis=1)
    # print(df1.head())
    # print(df2.head())
    # print(df3.head())
    x = []
    plt.scatter(df1, df2)
    plt.show()
    

if __name__=='__main__':
    run()