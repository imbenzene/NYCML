function[Acc]=FindPredictedClass(TestLabel, TestX)

W=TestLabel;
I1=find(W==10);
W(I1,:)=1;
I1=find(W~=1);
W(I1,:)=-1;
[TrainX, TrainLabel]= svmlread('digits0.train');
model = svmlearn(TrainX,TrainLabel,'-c 0.0001');
[err1, pred0] = svmclassify(TestX,W,model);

W=TestLabel;
I1=find(W==1);
W(I1,:)=1;
I1=find(W~=1);
W(I1,:)=-1;
[TrainX, TrainLabel]= svmlread('digits1.train');
model = svmlearn(TrainX,TrainLabel,'-c 0.005');
[err1, pred1] = svmclassify(TestX,W,model);


W=TestLabel;
I1=find(W==2);
W(I1,:)=1;
I1=find(W~=1);
W(I1,:)=-1;
[TrainX, TrainLabel]= svmlread('digits2.train');
model = svmlearn(TrainX,TrainLabel,'-c 0.0001');
[err1, pred2] = svmclassify(TestX,W,model);


W=TestLabel;
I1=find(W==3);
W(I1,:)=1;
I1=find(W~=1);
W(I1,:)=-1;
[TrainX, TrainLabel]= svmlread('digits3.train');
model = svmlearn(TrainX,TrainLabel,'-c 0.0001');
[err1, pred3] = svmclassify(TestX,W,model);


W=TestLabel;
I1=find(W==4);
W(I1,:)=1;
I1=find(W~=1);
W(I1,:)=-1;
[TrainX, TrainLabel]= svmlread('digits4.train');
model = svmlearn(TrainX,TrainLabel,'-c 0.01');
[err1, pred4] = svmclassify(TestX,W,model);

W=TestLabel;
I1=find(W==5);
W(I1,:)=1;
I1=find(W~=1);
W(I1,:)=-1;
[TrainX, TrainLabel]= svmlread('digits5.train');
model = svmlearn(TrainX,TrainLabel,'-c 0.0005');
[err1, pred5] = svmclassify(TestX,W,model);

W=TestLabel;
I1=find(W==6);
W(I1,:)=1;
I1=find(W~=1);
W(I1,:)=-1;
[TrainX, TrainLabel]= svmlread('digits6.train');
model = svmlearn(TrainX,TrainLabel,'-c 0.0005');
[err1, pred6] = svmclassify(TestX,W,model);

W=TestLabel;
I1=find(W==7);
W(I1,:)=1;
I1=find(W~=1);
W(I1,:)=-1;
[TrainX, TrainLabel]= svmlread('digits7.train');
model = svmlearn(TrainX,TrainLabel,'-c 0.0005');
[err1, pred7] = svmclassify(TestX,W,model);

W=TestLabel;
I1=find(W==8);
W(I1,:)=1;
I1=find(W~=1);
W(I1,:)=-1;
[TrainX, TrainLabel]= svmlread('digits8.train');
model = svmlearn(TrainX,TrainLabel,'-c 0.1');
[err1, pred8] = svmclassify(TestX,W,model);



W=TestLabel;
I1=find(W==9);
W(I1,:)=1;
I1=find(W~=1);
W(I1,:)=-1;
[TrainX, TrainLabel]= svmlread('digits9.train');
model = svmlearn(TrainX,TrainLabel,'-c 0.001');
[err1, pred9] = svmclassify(TestX,W,model);



pred= [pred1 pred2 pred3 pred4 pred5 pred6 pred7 pred8 pred9 pred0];

[M,I]=max(pred,[],2);

Correct=I-TestLabel;

Acc=length(find(Correct==0))/length(Correct);




















