import numpy as np
import sys
import matplotlib.pyplot as plt
from matplotlib.mlab import griddata
from mpl_toolkits.mplot3d import Axes3D


data = np.genfromtxt('D:\Python\Output.csv', dtype=[('x',float),('y',float),('z',float)],
                     comments='"', delimiter=',')

x = data['x']
y = data['y']
z = data['z']
                     
                                                               
datap = np.genfromtxt('D:\Python\Outputp.csv', dtype=[('x',float),('y',float),('z',float)],
                     comments='"', delimiter=',')
                     
datan = np.genfromtxt('D:\Python\Outputn.csv', dtype=[('x',float),('y',float),('z',float)],
                        comments='"', delimiter=',')                                                               

pX = datap['x']
pY = datap['y']
pZ = datap['z']

nX = datan['x']
nY = datan['y']
nZ = datan['z']

ngrid = 100

xi = np.linspace(-1,1,ngrid)
yi = np.linspace(-1,1,ngrid)

zi = griddata(x,y,z,xi,yi)



plt.contour(xi,yi,zi,1,linewidths=1)
plt.scatter(pX,pY,c='r',s=20,marker='+') 
plt.scatter(nX,nY,c='b', s=20,marker='o')
plt.xlim(0,1)
plt.ylim(0,1)
plt.show()

