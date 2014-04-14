
% Reading the files
[TestX, TestLabel]= svmlread('boxes.test');
[TrainX, TrainLabel]= svmlread('boxes.train');

TestX= TestX(:,2:3);
TrainX= TrainX(:,2:3);










