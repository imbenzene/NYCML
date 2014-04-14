function[Acc, predictions1, predictions, model]=FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX)
W=TrainLabel;
Z=TrainX;
Y=TestLabel;
X=TestX;

model= svmlearn(Z,W, '-j 0.05 -c 1.0');

[err, predictions]= svmclassify(X,Y,model);

predictions1=predictions;
I=find(predictions>=0);
predictions1(I,:)=1;
I=find(predictions<0);
predictions1(I,:)=-1;

Correct= predictions1 - TestLabel;

Acc=length(find(Correct==0))/length(Correct);

