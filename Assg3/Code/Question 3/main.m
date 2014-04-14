
[TestX, TestLabel]= svmlread('groups2.test');
[TrainX, TrainLabel]= svmlread('groups2.train');



% W1=W; W2=W; W3=W; W4=W;
% I1=find(W~=1);
% W1(I1,:)=-1;
% I1=find(W==1);
% W1(I1,:)=1;
% 
% I2=find(W~=2);
% W2(I2,:)=-1;
% I2=find(W==2);
% W2(I2,:)=1;
% 
% 
% I3=find(W~=3);
% W3(I3,:)=-1;
% I3=find(W==3);
% W3(I3,:)=1;
% 
% I4=find(W~=4);
% W4(I4,:)=-1;
% I4=find(W==4);
% W4(I4,:)=1;
% 
% 
% model1 = svmlearn(Z,W1,'-c 0.5');
% model2 = svmlearn(Z,W2,'-c 0.5');
% model3 = svmlearn(Z,W3,'-c 0.5');
% model4 = svmlearn(Z,W4,'-c 0.5');
% 
% 
% [err1, predictions1] = svmclassify(X,Y,model1);
% [err2, predictions2] = svmclassify(X,Y,model2);
% [err3, predictions3] = svmclassify(X,Y,model3);
% [err4, predictions4] = svmclassify(X,Y,model4);
% 
% 
% pred= [predictions1 predictions2 predictions3 predictions4];
% 
% [M,I]=max(pred,[],2);
% 
accuracy= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);

























