import numpy as np
import pandas as pd
from matplotlib import pyplot as plt
from sklearn import manifold

filepath='output/similarity.csv'

df = pd.read_csv(filepath, header= None, dtype=np.float64)
print(df.shape)

for i in range(0,20):
    for j in range(0,20):
        df[j][i]=df[i][j]
f= open('output/similarity.csv',"w+")
df.to_csv(path_or_buf='output/similarity.csv')
f.close()
print(df.shape)

# fig = plt.figure(1)
# ax = plt.axes([0., 0., 1., 1.])
# s = 100
# plt.scatter(pos[:, 0], pos[:, 1], color='turquoise', s=s, lw=0, label='MDS')
# plt.legend(scatterpoints=1, loc='best', shadow=False)

# values = np.abs(similarities)
# plt.show()