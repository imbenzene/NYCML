clc
clear all
close all

%% Read SMVLight file
tic
[Label FeatureVector] = svmlread('books.train');
toc

%% Compute Centroid feature vector for each class

Centroids=zeros(5,length(FeatureVector));

for Category=0:4
    
    Index=find(Label==Category);
    
    for i=1:length(Index)
        Vector=FeatureVector(Index(i),:);
        Norm=norm(Vector);
        if(Norm==0)
            continue;
        end
        Vector=Vector./norm(Vector);        
        Centroids(Category+1,:)=Centroids(Category+1,:)+Vector;
    end
    
end

%% Read books.test

[LabelTest FeatureVectorTest] = svmlread('books.test');

%% Compute Labels

NormCentroids = zeros(1,5);
for i=1:5
    
    NormCentroids(i) = norm(Centroids(i,:));
    
end

Similarity = zeros(1,5);
AssignedLabels = zeros(size(LabelTest));

for i=1:length(LabelTest)
    
    Vector = FeatureVectorTest(i,:);
    Norm = norm(FeatureVectorTest(i,:));
    
    for Category = 0:4
        
        Similarity(1,Category+1) = dot(Centroids(Category+1,:),FeatureVectorTest(i,:))/(NormCentroids(1,Category+1) * Norm);
        
    end
    
    [MaxSimilarity Index] = max(Similarity);
    AssignedLabels(i) = Index - 1;
    
    if (rem(i,100)==0),
       fprintf(' %i labels assigned.\n', i);
    end
    
end

%% Compute Metrics

Accuracy = length(find(AssignedLabels - LabelTest)==0)/(length(AssignedLabels))
Precision = zeros(1,5);
Recall = zeros(1,5);

for i=1:5
    
    Precision(1,i) = length(find(AssignedLabels == i-1 & LabelTest == i-1))/( length(find(AssignedLabels == i-1)) );
    Recall(1,i) = length(find(AssignedLabels == i-1 & LabelTest == i-1))/( length(find(LabelTest == i-1)) );
    
end

Precision
Recall

aaa