% Reading the files
[TestX, TestLabel]= svmlread('digits.test');
accuracy = FindPredictedClass2(TestLabel, TestX);





