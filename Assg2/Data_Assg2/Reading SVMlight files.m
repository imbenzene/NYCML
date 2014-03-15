%cd C:/Users/anjali/Desktop/NYCML/Assg1/Problem1_dat

cd C:/Users/anjali/Documents/GitHub/NYCML/Assg2/Data_Assg2

[Groups_train_Features, Groups_train_Label]= svmlread('groups.train');
[Groups_test_Features, Groups_test_Label]= svmlread('groups.test');


csvwrite('Groups_train_Features.csv',full(Groups_train_Features));
csvwrite('Groups_train_Label.csv',full(Groups_train_Label));


csvwrite('Groups_test_Features.csv',full(Groups_test_Features));
csvwrite('Groups_test_Label.csv',full(Groups_test_Label));




