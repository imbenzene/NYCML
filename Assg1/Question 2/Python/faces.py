##Credits- DWu39

import os
os.chdir("C:/Users/anjali/Desktop/NYCML/Assg1/Problem1_dat")

import numpy as np
#http://matplotlib.org/users/image_tutorial.html
from itertools import islice
import operator
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import math as m
from scipy import sparse
from sklearn.datasets import load_svmlight_file


X_train, y_train = load_svmlight_file("faces.train")
X_test, y_test = load_svmlight_file("faces.test")


train_data = X_train.toarray()
test_data = X_test.toarray()

#select a k
k = 10
tid = 0

for test in test_data:
        scores = {}
        id = 0
        test_data_X = test[:2048]
        for data in train_data:
            train_data_X = data[:2048]
            v4 = np.linalg.norm(test_data_X - train_data_X)
            if v4 == 0:
                scores[id] = 1
            else:
                scores[id] = 1/v4
            id+= 1
        sorted_scores = sorted(scores.iteritems(), key=operator.itemgetter(1),
        reverse=True)
        #take k scores from head of list
        sims = sorted_scores[:k]
        num = 0
        den = 0
        for sim in sims:
            sid = sim[0]
            similarity = sim[1]
            data = train_data[sid]
            data = data[2048:]
            num+= similarity * data
            den+= similarity
        bottomHalf = num/den
        #take bottom half of img and concatenate to top half of test
        img = np.concatenate([test_data_X, bottomHalf])
        img = np.reshape(img, (-1, 64))
        plt.gray()
        plt.imshow(img)
        plt.imsave('nsasubject_testID' + str(tid) + '_k' + str(k) + '.png', img)
        tid+= 1