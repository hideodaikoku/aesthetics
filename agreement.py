from nltk import agreement
from mpl_toolkits.mplot3d import Axes3D 
import numpy as np
import matplotlib.pyplot as plt
import csv


def toVector(fileName): # saves the column vector form the csv file as variable for each rater
	with open(fileName, 'r') as f:
		reader = csv.reader(f)
		vector = list(reader)

	a =np.array(vector)
	vector=a.flatten()

	vector = list(map(int, vector))

	return vector


def displayAgreement(feature, rater1, rater2, rater3): # displays the kappa, fleiss and alpha scores using matplotlib
	print(feature)
	k, f, a, s = calculateAgreement(rater1,rater2,rater3);

	text_file = open(str(feature)+".txt", "w")
	text_file.write("Kappa %s\n" % k)
	text_file.write("Fless %s\n" % f)
	text_file.write("Alpha %s\n" % a)
	text_file.write("Scotts %s\n" % s)
	text_file.close()

def display3D(feature, rater1, rater2, rater3):
	fig = plt.figure()
	ax = fig.add_subplot(111, projection='3d')

	n = 100

	
	ax.scatter(rater1, rater2, rater3)

	ax.set_xlabel('Rater 1')
	ax.set_ylabel('Rater 2')
	ax.set_zlabel('Rater 3')

	plt.savefig(str(feature)+'.pdf', dpi=300 )



def calculateAgreement(rater1,rater2,rater3): # calulates kappa, fleiss, alpha and scotts scores for inter rater agreement
	taskdata=[[0,str(i),str(rater1[i])] for i in range(0,len(rater1))]+[[1,str(i),str(rater2[i])] for i in range(0,len(rater2))]+[[2,str(i),str(rater3[i])] for i in range(0,len(rater3))]
	ratingtask = agreement.AnnotationTask(data=taskdata)
	
	kappa  = str(ratingtask.kappa())
	fless  = str(ratingtask.multi_kappa())
	alpha  = str(ratingtask.alpha())
	scotts = str(ratingtask.pi())

	return kappa, fless, alpha, scotts

def interRater():
	#prepare vector
	rater1 = toVector("Pat/groovy.csv");
	rater2 = toVector("Marino/groovy.csv");
	rater3 = toVector("Hideo/groovy.csv");

	print(rater1)
	print(rater2)
	print(rater3)

	featureName = "groovy"

	display3D(featureName, rater1, rater2, rater3)
	# displayAgreement(featureName, rater1, rater2, rater3)

interRater()