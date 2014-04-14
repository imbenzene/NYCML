
% Reading the files
[TestX, TestLabel]= svmlread('groups2.test');
[TrainX, TrainLabel]= svmlread('groups2.train');

TestX= normr(TestX);
TrainX=normr(TrainX);


%FindPredictedClass(TrainLabel, TrainX, TrainLabel, TrainX)
%FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX)
