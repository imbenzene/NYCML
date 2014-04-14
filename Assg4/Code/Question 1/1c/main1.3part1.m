
[TestX, TestLabel]= svmlread('digits0.val');
[TrainX, TrainLabel]= svmlread('digits0.train');
acc0= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);

[TestX, TestLabel]= svmlread('digits1.val');
[TrainX, TrainLabel]= svmlread('digits1.train');
acc1= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);

[TestX, TestLabel]= svmlread('digits2.val');
[TrainX, TrainLabel]= svmlread('digits2.train');
acc2= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);

[TestX, TestLabel]= svmlread('digits3.val');
[TrainX, TrainLabel]= svmlread('digits3.train');
acc3= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);

[TestX, TestLabel]= svmlread('digits4.val');
[TrainX, TrainLabel]= svmlread('digits4.train');
acc4= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);

[TestX, TestLabel]= svmlread('digits5.val');
[TrainX, TrainLabel]= svmlread('digits5.train');
acc5= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);

[TestX, TestLabel]= svmlread('digits6.val');
[TrainX, TrainLabel]= svmlread('digits6.train');
acc6= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);

[TestX, TestLabel]= svmlread('digits7.val');
[TrainX, TrainLabel]= svmlread('digits7.train');
acc7= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);

[TestX, TestLabel]= svmlread('digits8.val');
[TrainX, TrainLabel]= svmlread('digits8.train');
acc8= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);

[TestX, TestLabel]= svmlread('digits9.val');
[TrainX, TrainLabel]= svmlread('digits9.train');
acc9= FindPredictedClass(TrainLabel, TrainX, TestLabel, TestX);

Accuracy= [acc0; acc1; acc2; acc3; acc4; acc5; acc6; acc7; acc8; acc9];

