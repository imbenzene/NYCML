
setwd("C:\\Users\\anjali\\Desktop\\Machine Learning 5780\\Assignment2\\data")
dir()
test<- read.table("circle1.txt",header=FALSE) #this data file is obtained after reading the SVMlight files.
test<- as.matrix(test)

t1<- cbind(test[,1],test[,3],test[,5])
t1<- as.data.frame(t1)
head(t1)


dtree<- function (traindata)
{
t1<-traindata;
igain<- function (dat)
{
	v2min<- ceiling(min(dat[,2]));
	v2max<- floor(max(dat[,2]));
	v3min<- ceiling(min(dat[,3]));
	v3max<- floor(max(dat[,3]));
	
	foo<- matrix(0,0,3);
	
	pnode<- nrow(dat[which(dat$V1==1),]);
	nnode<- nrow(dat[which(dat$V1==0),]);
	
	if (nrow(dat)==0 || pnode==0 || nnode==0){entropy_node= 0;
	} else{entropy_node= -((pnode/(pnode + nnode))*(log((pnode/(pnode+nnode)),2))) -((nnode/(pnode+nnode))*(log((nnode/(pnode+nnode)),2)));
	}
	
		for (i in v2min:v2max)
	{
		datleft<- dat[which(dat$V2>= i),];
		pleft<- nrow(datleft[which(datleft$V1==1),]);
		nleft<- nrow(datleft[which(datleft$V1==0),]);
		if (nrow(datleft)==0 || pleft==0 || nleft==0){entropy_left= 0;
		} else{entropy_left= -((pleft/(pleft+nleft))*(log((pleft/(pleft+nleft)),2))) -((nleft/(pleft+nleft))*(log((nleft/(pleft+nleft)),2)));
		}		

		datright<- dat[which(dat$V2< i),];
		pright<- nrow(datright[which(datright$V1==1),])
		nright<- nrow(datright[which(datright$V1==0),])
		if (nrow(datright)==0 || pright==0 || nright==0){entropy_right= 0;
		} else{entropy_right= -((pright/(pright+nright))*(log((pright/(pright+nright)),2))) -((nright/(pright+nright))*(log((nright/(pright+nright)),2)));
		}		

		info_gain<- entropy_node - (nrow(datleft)/nrow(dat))*entropy_left - (nrow(datright)/nrow(dat))*entropy_right;
		#print(info_gain);
		foo<- rbind(foo, cbind(0,i, info_gain));		
	}

		for (i in v3min:v3max)
	{
		datleft<- dat[which(dat$V3>= i),];
		pleft<- nrow(datleft[which(datleft$V1==1),]);
		nleft<- nrow(datleft[which(datleft$V1==0),]);
		if (nrow(datleft)==0 || pleft==0 || nleft==0){entropy_left= 0;
		} else{entropy_left= -((pleft/(pleft+nleft))*(log((pleft/(pleft+nleft)),2))) -((nleft/(pleft+nleft))*(log((nleft/(pleft+nleft)),2)));
		}		

		datright<- dat[which(dat$V3< i),];
		pright<- nrow(datright[which(datright$V1==1),])
		nright<- nrow(datright[which(datright$V1==0),])
		if (nrow(datright)==0 || pright==0 || nright==0){entropy_right= 0;
		} else{entropy_right= -((pright/(pright+nright))*(log((pright/(pright+nright)),2))) -((nright/(pright+nright))*(log((nright/(pright+nright)),2)));
		}		

		info_gain<- entropy_node - (nrow(datleft)/nrow(dat))*entropy_left - (nrow(datright)/nrow(dat))*entropy_right;
		#print(info_gain);
		foo<- rbind(foo, cbind(1,i, info_gain));		
	}

	colnames(foo)<- colnames(dat);
	foo<- as.data.frame(foo);
	foo_max<- foo[which(foo$V3== max(foo$V3)),]	
	return(foo_max);	
}


db<- matrix (0,0,4);

dat<- t1;
tu<- igain(t1);
## If there are more than maximum values of Info Gain, choose one at random
if (nrow(tu)>1) {samp<- floor((nrow(tu))*runif(1)) + 1;
tu<- tu[samp,];  }


	
	if ( tu$V3 !=0){
	if ( tu$V1==0){	datleft<- dat[which(dat$V2>= tu$V2),]; datright<- dat[which(dat$V2< tu$V2),];
	} else { datleft<- dat[which(dat$V3>= tu$V2),];  datright<- dat[which(dat$V3< tu$V2),];}
	}
	
	db<- rbind(db, cbind(tu$V1, tu$V2, 0, 0));
	parentno<- nrow(db);

options(expressions = 100000 );

helper<- function(parentno, dat, child, db)
{
	pn<- nrow(dat[which(dat$V1==1),]);
	nn<- nrow(dat[which(dat$V1==0),]);
	
	if (pn <= 2 || nn <=2){ if ( nrow(dat)!=0) { ##Checking if all the values belong to one class.
		if (pn >= nn){ ##If its the first case, then declare it as the leaf node. 0 means true.
			db<- rbind(db, cbind(1 , -1, -1, -1));
			foo1<- nrow(db);
			db[parentno,child]<- foo1;
			} else{ ##If its the second case, then declare it as the leaf node. 1 means false.
							db<- rbind(db, cbind(0 , -1, -1, -1));
							foo1<- nrow(db);
							db[parentno,child]<- foo1;
		}
			return(db);
			}		
	} else {
			
				tu<- igain(dat);
				## If there are more than maximum values of Info Gain, choose one at random
				if (nrow(tu)>1) {samp<- floor((nrow(tu))*runif(1)) + 1;
				tu<- tu[samp,];  }

				if ( tu$V3 !=0){
					if ( tu$V1==0){	datl<- dat[which(dat$V2>= tu$V2),]; datr<- dat[which(dat$V2< tu$V2),];
					} else { datl<- dat[which(dat$V3>= tu$V2),];  datr<- dat[which(dat$V3< tu$V2),];}
				}
	
				db<- rbind(db, cbind(tu$V1, tu$V2, -1, -1));
				foo2<- nrow(db);
				db[parentno, child]<- foo2;
				
				child<-3;
				db <- helper(foo2, datl, child,db);
				child<- 4;
				db <- helper(foo2, datr, child, db);
				
				return(db);
				
			}
}

child<- 3;
db<- helper(parentno, datleft, child, db);
child<- 4;
db<- helper(parentno, datright, child, db);
#print(db);
return (db);
}



test_instance<- function(X1, X2, db)
{
	exit<- db[1,2];
	i<-1;
	while ( exit != -1 )
	{
		if( db[i,1]==0){
			if (X1>= db[i,2]) {
				i<- db[i,3];
			} else {
				i<- db[i,4];
			}
		} else {
			if (X2>= db[i,2]) {
				i<- db[i,3];
			} else {
				i<- db[i,4];
			}		
		}
	    exit<- db[i,2];
	}	
	return(db[i,1]);
}


################### COMBINING TREES FOR PART 3C for the QUESTION
#########################################################
all_trees<- list();
for( treeno in 1:101)
{
no<-(nrow(t1)/5);
train_indice=sample(nrow(t1),no)
traindata<- matrix (0,0,3);

for (i in train_indice)
{
		traindata<- rbind(traindata, t1[i,]); 
}
row.names(traindata) <- NULL; 
colnames(traindata)<- colnames(t1);
traindata<- as.data.frame(traindata);

nrow(traindata);
db<- dtree(traindata);
db;
all_trees[[treeno]]<- db;
}

treecombine<- function(X1, X2)
{	
	neg<- 0;
	pos<- 0;
	for (k in 1:length(all_trees))
	{
		label1<- test_instance(i,j, all_trees[[k]]);
		if (label1==0) { neg<- neg+1;
		} else {pos<- pos+1;}
	}
	if (neg>pos){ final<- 0}
	else { final<- 1;}
	return(final);	
}



	
 testdata<- matrix (0,0,3);
 for (i in seq(0,10,len=50))
 {
	 for (j in seq(0,10,len=50))
	 {
	 label<- treecombine(i, j);
	 testdata<- rbind(testdata, cbind(label,i, j)); 
	 }
}

dim(testdata);
head(testdata);

dim(testdata);
head(testdata);
testdata<- as.matrix(testdata);
write.table(testdata,file="combine2.csv",sep=",",row.names=F,col.names=F)





###################################################3
#SAMPLING
######
######Growing the tree for two such trees. Question 2b part.....
######
#no<-(nrow(t1)/5);
#train_indice=sample(1:nrow(t1),no,replace=TRUE)
#traindata<- matrix (0,0,3);

#for (i in train_indice)
#{
#		traindata<- rbind(traindata, t1[i,]); 
#}
#row.names(traindata) <- NULL; 
#colnames(traindata)<- colnames(t1);
#traindata<- as.data.frame(traindata);

#nrow(traindata);
#db<- dtree(traindata);
#db;


#### Decision Boundary of 2 such trees.
## First tree
db<- all_trees[[2]];

testdata1<- matrix (0,0,3);
 for (i in seq(0,10,len=100))
 {
	 for (j in seq(0,10,len=100))
	 {
	 label<- test_instance(i, j, db);
	 testdata1<- rbind(testdata1, cbind(label,i, j)); 
	 }
 }

dim(testdata1);
head(testdata1);
testdata1<- as.matrix(testdata1);
write.table(testdata1,file="combine10.csv",sep=",",row.names=F,col.names=F)

##Second tree
db<- all_trees[[3]];

testdata2<- matrix (0,0,3);
 for (i in seq(0,10,len=100))
 {
	 for (j in seq(0,10,len=100))
	 {
	 label<- test_instance(i, j, db);
	 testdata2<- rbind(testdata2, cbind(label,i, j)); 
	 }
 }

dim(testdata2);
head(testdata2);
testdata2<- as.matrix(testdata2);
write.table(testdata2,file="combine11.csv",sep=",",row.names=F,col.names=F)





##Finding the OVERFITTING trees
db<- all_trees[[29]];

testdata2<- matrix (0,0,3);
 for (i in seq(0,10,len=100))
 {
	 for (j in seq(0,10,len=100))
	 {
	 label<- test_instance(i, j, db);
	 testdata2<- rbind(testdata2, cbind(label,i, j)); 
	 }
 }

dim(testdata2);
head(testdata2);
testdata2<- as.matrix(testdata2);
write.table(testdata2,file="combine20.csv",sep=",",row.names=F,col.names=F)






















