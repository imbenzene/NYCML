
% For C=1 or 100 and nneg= 100
%[accuracy, Pred, z, model]= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);
%[accuracy, Pred, z, model]= FindPredictedClass(TrainLabel, TrainX, TrainLabel, TrainX);

%%For C=1 or 100 and nneg= 50
%  TrainX= TrainX(1:150,:);
%  TrainLabel= TrainLabel(1:150,:);
% [accuracy, Pred, z, model]= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);
% [accuracy, Pred, z, model]= FindPredictedClass(TrainLabel, TrainX, TrainLabel, TrainX);

%For C=1 or 100 and nneg= 10
 TrainX= TrainX(1:110,:);
 TrainLabel= TrainLabel(1:110,:);
 [accuracy, Pred, z, model]= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);
%[accuracy, Pred, z, model]= FindPredictedClass(TrainLabel, TrainX,TrainLabel, TrainX);
 
 [Confmat,order] = confusionmat(TestLabel,Pred);



%%Saving the Values of Z for Test Data Sets
Output= [TestX z];
csvwrite('D:\Python\Output.csv',Output);


Outputp= [TestX z];
I=find(Pred==1);
pn=Outputp(I,:);
csvwrite('D:\Python\Outputp.csv',pn);

 
Outputn= [TestX z];
I=find(Pred==-1);
nn=Outputn(I,:);
csvwrite('D:\Python\Outputn.csv',nn);




% 
% 
% %%Saving the Values of Z for train datasets
% Output= [TrainX z];
% csvwrite('D:\Python\Output.csv',Output);
% 
% 
% Outputp= [TrainX z];
% I=find(Pred==1);
% pn=Outputp(I,:);
% csvwrite('D:\Python\Outputp.csv',pn);
% 
%  
% Outputn= [TrainX z];
% I=find(Pred==-1);
% nn=Outputn(I,:);
% csvwrite('D:\Python\Outputn.csv',nn);
% 
% 
% 
% 




















