function[Acc]=FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX)
W=TrainLabel;
Z=TrainX;
Y=TestLabel;
X=TestX;

%I1=find(W~=1);
%W1(I1,:)=-1;
%I1=find(W==1);
%W1(I1,:)=1;

model1 = svmlearn(Z,W,'-c 0.1');

[err1, pred] = svmclassify(X,Y,model1);

%[M,I]=max(pred,[],2);
I=find(pred>=0);
pred(I,:)=1;
I=find(pred<0);
pred(I,:)=-1;

Correct=pred-TestLabel;

Acc=length(find(Correct==0))/length(Correct);

