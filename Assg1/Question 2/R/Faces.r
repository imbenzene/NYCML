library(SparseM)
library(grid);

##Change the directory folder containing the dataset
setwd("C:\\Users\\anjali\\Desktop\\NYCML\\Assg1\\Problem1_dat")

test<- read.table("faces_data_test.txt",header=FALSE) #this data file is obtained after reading the SVMlight files.
test<- as.matrix(test)


train<- read.table("faces_data_train.txt",header=FALSE)  #this data file is obtained after reading the SVMlight files.
train<- as.matrix(train)


test1<- test[,1:2048];



#### Pick the value of K i.e. the number of nearest neighbours.  K should be more than 2 to maximum number of elements in the training dataset.
k1<- 50
## Plotting the image using the grid library in R. 
##Please install it, before using it.##
for (m in 1:5)
{
h<- test[m,1:2048]
h1<- matrix(0,300,2048)
for (i in 1:300)
{
	h1[i,]<- h ;
}
dim(h1);

comp<- train[,1:2048]
#dim(comp)

k<-(h1 - comp)*(h1 - comp)
k<- rowSums(as.matrix(k))
k<- sqrt(k)
length(k)

tmp=sort(k,index.return=TRUE);
s=tmp$x;
idx=tmp$ix

dummy<- NULL;
dummy<-  train[idx[1], 2049:4096]/s[1];
denom<- 1/s[1];

for (o in 2:k1)
{
	dummy <- dummy + ((train[idx[o], 2049:4096])/s[o]) ; 
	denom<- denom + 1/s[o];
}

dummy<- dummy/denom;
test[m,2049:4096]<- dummy;


##
#Plotting the Image in R
##
img<- matrix(1,64,64)
dim(img)
k<-1;
for(i in 1:64)
{
	img[i,]<- test[m,k:(k+63)]; ## Half Image-- img[i,]<- test[m,k:(k+63)];
	k<- (64*i +1);
}

library(grid);
dev.new();
grid.raster(img);
}























## Use this part of the script for k=1

k<-1
## Plotting the image using the grid library in R. Please install it, before using it.##
for (m in 1:5)
{
h<- test[m,1:2048]
h1<- matrix(0,300,2048)
for (i in 1:300)
{
	h1[i,]<- h ;
}
dim(h1);

comp<- train[,1:2048]
#dim(comp)

k<-(h1 - comp)*(h1 - comp)
k<- rowSums(as.matrix(k))
k<- sqrt(k)
length(k)

tmp=sort(k,index.return=TRUE);
s=tmp$x;
idx=tmp$ix

test[m,2049:4096]<- train[idx[1], 2049:4096]


##
#Plotting the Image in R
##
img<- matrix(1,64,64)
dim(img)
k<-1;
for(i in 1:64)
{
	img[i,]<- test[m,k:(k+63)]; ## Half Image-- img[i,]<- test[m,k:(k+63)];
	k<- (64*i +1);
}

library(grid);
grid.raster(img);
}










