
%%The number of cross-validation folds is 5.
Arr=randperm(2000);
I1=Arr(1:400);
fold1Label=TrainLabel(I1,:);
fold1X=TrainX(I1,:);

I2=Arr(401:800);
fold2Label=TrainLabel(I2,:);
fold2X=TrainX(I2,:);

I3=Arr(801:1200);
fold3Label=TrainLabel(I3,:);
fold3X=TrainX(I3,:);

I4=Arr(1201:1600);
fold4Label=TrainLabel(I4,:);
fold4X=TrainX(I4,:);

I5=Arr(1601:2000);
fold5Label=TrainLabel(I5,:);
fold5X=TrainX(I5,:);

%Training accuracies
accuracy_fold1train = FindPredictedClass( [fold2Label;fold3Label;fold4Label;fold5Label], [fold2X; fold3X; fold4X; fold5X], [fold2Label;fold3Label;fold4Label;fold5Label], [fold2X; fold3X; fold4X; fold5X]);
accuracy_fold2train = FindPredictedClass( [fold1Label;fold3Label;fold4Label;fold5Label], [fold1X; fold3X; fold4X; fold5X], [fold1Label;fold3Label;fold4Label;fold5Label], [fold1X; fold3X; fold4X; fold5X]);
accuracy_fold3train = FindPredictedClass( [fold1Label;fold2Label;fold4Label;fold5Label], [fold1X; fold2X; fold4X; fold5X], [fold1Label;fold2Label;fold4Label;fold5Label], [fold1X; fold2X; fold4X; fold5X]);
accuracy_fold4train = FindPredictedClass( [fold1Label;fold2Label;fold3Label;fold5Label], [fold1X; fold2X; fold3X; fold5X], [fold1Label;fold2Label;fold3Label;fold5Label], [fold1X; fold2X; fold3X; fold5X]);
accuracy_fold5train = FindPredictedClass( [fold1Label;fold2Label;fold3Label;fold4Label], [fold1X; fold2X; fold3X; fold4X], [fold1Label;fold2Label;fold3Label;fold4Label], [fold1X; fold2X; fold3X; fold4X]);

%validation accuracies
accuracy_fold1val = FindPredictedClass( [fold2Label;fold3Label;fold4Label;fold5Label], [fold2X; fold3X; fold4X; fold5X], fold1Label, fold1X);
accuracy_fold2val = FindPredictedClass( [fold1Label;fold3Label;fold4Label;fold5Label], [fold1X; fold3X; fold4X; fold5X], fold2Label, fold2X);
accuracy_fold3val = FindPredictedClass( [fold1Label;fold2Label;fold4Label;fold5Label], [fold1X; fold2X; fold4X; fold5X], fold3Label, fold3X);
accuracy_fold4val = FindPredictedClass( [fold1Label;fold2Label;fold3Label;fold5Label], [fold1X; fold2X; fold3X; fold5X], fold4Label, fold4X);
accuracy_fold5val = FindPredictedClass( [fold1Label;fold2Label;fold3Label;fold4Label], [fold1X; fold2X; fold3X; fold4X], fold5Label, fold5X);


accum= [ accuracy_fold1train accuracy_fold1val ; accuracy_fold2train accuracy_fold2val ; accuracy_fold3train accuracy_fold3val ; accuracy_fold4train accuracy_fold4val ; accuracy_fold5train accuracy_fold5val];



































