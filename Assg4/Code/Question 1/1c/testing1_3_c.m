% Reading the files
[TestX, TestLabel]= svmlread('digits.test');
accuracy = FindPredictedClass(TestLabel, TestX);





