import numpy as np
import matplotlib.pyplot as plt
import csv
from sklearn.metrics import cohen_kappa_score

a = [59.5808,15.8683,88.6228,20,11.976,77.8443,50,26.9461,100,67.6647,15.2695,82.0359,57.7844,70.9581,26.3473,29.0419,82.0359,79.9401,19.7605,71.8563]
b = [75.7485,94.3114,100,70.0599,32.0359,0.8982,96.4072,70,100,100,80.5389,93.7126,20.6587,95.2096,82.0359,94.012,99.4012,62.2755,97.006,6.5868]
c = [30,30,93.7126,0,20,60,70,60,80,90,20,17.6647,60,70,10,50,30,80,38.3234,8.0838]

# rater_12=cohen_kappa_score(a, b)
print(ICC_rep_anova(df))
def ICC_rep_anova(Y):
    '''
    the data Y are entered as a 'table' ie subjects are in rows and repeated
    measures in columns
    One Sample Repeated measure ANOVA
    Y = XB + E with X = [FaTor / Subjects]
    '''

    [nb_subjects, nb_conditions] = Y.shape
    dfc = nb_conditions - 1
    dfe = (nb_subjects - 1) * dfc
    dfr = nb_subjects - 1

    # Compute the repeated measure effect
    # ------------------------------------

    # Sum Square Total
    mean_Y = mean(Y)
    SST = ((Y - mean_Y)**2).sum()

    # create the design matrix for the different levels
    x = kron(eye(nb_conditions), ones((nb_subjects, 1)))  # sessions
    x0 = tile(eye(nb_subjects), (nb_conditions, 1))  # subjects
    X = hstack([x, x0])

    # Sum Square Error
    predicted_Y = dot(dot(dot(X, pinv(dot(X.T, X))), X.T), Y.flatten('F'))
    residuals = Y.flatten('F') - predicted_Y
    SSE = (residuals**2).sum()

    residuals.shape = Y.shape

    MSE = SSE / dfe

    # Sum square session effect - between colums/sessions
    SSC = ((mean(Y, 0) - mean_Y)**2).sum() * nb_subjects
    MSC = SSC / dfc / nb_subjects

    session_effect_F = MSC / MSE

    # Sum Square subject effect - between rows/subjects
    SSR = SST - SSC - SSE
    MSR = SSR / dfr

    # ICC(3,1) = (mean square subjeT - mean square error) /
    #            (mean square subjeT + (k-1)*-mean square error)
    ICC = (MSR - MSE) / (MSR + dfc * MSE)

    e_var = MSE  # variance of error
    r_var = (MSR - MSE) / nb_conditions  # variance between subjects

return ICC, r_var, e_var, session_effect_F, dfc, dfe