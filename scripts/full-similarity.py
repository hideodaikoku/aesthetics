import matplotlib.pyplot as plt
import librosa
import numpy as np
import pandas as pd
import librosa.display
import matplotlib.style as ms
from scipy.spatial import distance
import scipy
ms.use('seaborn-muted')
from IPython.display import Audio

def compute(filename):
    #load file from local directory
    y2, sr2 = librosa.load('Files/'+str(filename)+'.wav')
    #adjust hop length to 512 samples between each frame and store in a Data Frame
    D = librosa.stft(y2,hop_length=512)
    #Calculate total time of recording in seconds
    librosa.samples_to_time(len(y2), sr2)
    # Calculate the magphase of the waveform
    S, phase = librosa.magphase(D)
    mel(S,y2,sr2)
    mfcc(y2,sr2)
    chroma(y2,sr2)

def mel(S,y2,sr2):
    #melspec data
    melspec = librosa.feature.melspectrogram(y=y2, sr=sr2)
    #Melspec assumes power, not energy as input
    melspec_stft = librosa.feature.melspectrogram(S=S**2, sr=sr2)
    np.allclose(melspec,melspec_stft)
    #save melspec data stft data to a numpy array
    mel=np.array(melspec)
    #convert to 1D array
    m=mel.ravel()
    #store array in Data Frame
    df = pd.DataFrame(m)
    #Write to local CSV file
    df.to_csv('Mel/'+str(filename)+'.csv')

def mfcc(y2,sr2):
    #calculate mfcc values
    mfcc = librosa.feature.mfcc(y=y2, sr=sr2)
    librosa.display.specshow(mfcc, x_axis='time')
    #store mfcc data in an numpy array
    mfcc_data=np.array(mfcc)
    #convert to one dimensional dataframe
    mfd=mfcc_data.ravel()
    df2=pd.DataFrame(mfd)
    #write to local csv file
    df2.to_csv('MFCC/'+str(filename)+'.csv')


def chroma(y2, sr2):

    chroma=librosa.feature.chroma_stft(y=y2, sr=sr2)
    #store chroma in a numpy array
    chroma_data= np.array(chroma)
    #write to one dimensional array and evntually csv file
    chrm=chroma_data.ravel()
    df3=pd.DataFrame(chrm)
    df3.to_csv('Chroma/'+str(filename)+'.csv')
  
if __name__ == "__main__:'
    for i in range(1,21):
