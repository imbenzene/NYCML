clc
clear all
close all

%% Read files

[LabelTrain FeatureVectorTrain] = svmlread('books.train');
[LabelTest FeatureVectorTest] = svmlread('books.test');
LabelAssigned = -1*ones(size(LabelTest));

%% Pre-compute Norms for every vector
NormTrain = zeros(1,length(FeatureVectorTrain(:,1)));
NormTest = zeros(1,length(FeatureVectorTest(:,1)));
tic
fprintf('Computing Training Vector Norms...\n');
for i=1:length(NormTrain)
    NormTrain(1,i) = norm(FeatureVectorTrain(i,:));
end
toc
tic
fprintf('Computing Testing Vector Norms...\n');
for i=1:length(NormTest)
    NormTest(1,i) = norm(FeatureVectorTest(i,:));
end
toc
%% Compute Similarity
AllKs=[1 2 5 10 100 200 300 500 1000 2000 3000 4000 4850 5000];

Accuracy = zeros(1,length(AllKs));
Precision = zeros(length(AllKs),5);
Recall = zeros(length(AllKs),5);

Similarity = zeros(length(NormTest),length(NormTrain));
Sorted = zeros(length(NormTest),length(NormTrain));
Index = zeros(length(NormTest),length(NormTrain));
Vote = zeros(1,5);

NormMatrix = NormTest' * NormTrain;
Mat=find(NormMatrix==0);

for i=1:length(Mat)
    NormMatrix(Mat(i))=1;
end
%% 
tic
for i=1:length(NormTest)
        Similarity(i,:) = (FeatureVectorTest(i,:)*FeatureVectorTrain')./(NormMatrix(i,:));
        [Sorted(i,:) Index(i,:)] = sort(Similarity(i,:),2,'descend');
        
        if (rem(i,100)==0)
           fprintf(' %i Similarity sorted.\n', i);
        end
end
toc
%%
AllKs=[1 2 5 10 100 200 300 500 1000 2000 3000 4000 4850 5000];
for k=1:length(AllKs)
    K = AllKs(k)
    for i=1:length(NormTest)

        NearestNeighbors = Index(i,1:K);
        Vote = zeros(1,5);

        for j=1:K
            Vote(LabelTrain(Index(i,j))+1) = Vote(LabelTrain(Index(i,j))+1) + 1;
        end

        [MaxVotes Category] = max(Vote);
        LabelAssigned(i)=Category-1;

%         if (rem(i,100)==0)
%            fprintf(' %i labels assigned.\n', i);
%         end

    end  
    Accuracy(k) = length(find(LabelAssigned - LabelTest==0))/(length(LabelAssigned));

    for i=1:5

        Precision(k,i) = length(find(LabelAssigned == i-1 & LabelTest == i-1))/( length(find(LabelAssigned == i-1)) );
        Recall(k,i) = length(find(LabelAssigned == i-1 & LabelTest == i-1))/( length(find(LabelTest == i-1)) );

%         if(isnan(Precision(k,i)))
%             Precision(k,i)=0;
%         end
% 
%         if(isnan(Recall(k,i)))
%             Recall(k,i)=0;
%         end

    end
end

fprintf('Computed all Labels for all Ks\n');
Accuracy
figure, plot(log(AllKs),Accuracy)
Precision
Recall