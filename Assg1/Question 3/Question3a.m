clc
clear all
close all

%% Read SMVLight file
tic
[Label FeatureVector] = svmlread('books.train');
toc

%% Q3(a)

K=10;
% Book = FeatureVector(2166,:); %% Uncomment for "Fifty Shades of Grey"
% Norm = norm(Book);
Book = FeatureVector(3540,:); %% Uncomment for "Brains"
Norm = norm(Book);

[Rows Cols] = size(FeatureVector);
Similarity = zeros(Rows,1);

fprintf('Computing Similarity Measure...\n');
tic
for i=1:Rows

    NormFeatureVector = norm(FeatureVector(i,:));
    if(NormFeatureVector==0)
        continue;
    end
    
    Val = dot(Book,FeatureVector(i,:))/(Norm * NormFeatureVector);
    
    if(~isnan(Val))
        Similarity(i) = Val;
    end
    
    if (rem(i,500)==0),
       fprintf(' %i similarity measures computed.\n', i);
    end
end

%%
[Sorted Index] = sort(Similarity,2,'descend');

Top10Recommendations = Index(1:K+1);
Titles = textread('books.train.titles','%s','delimiter','\n');

for i = 1:K+1
    fprintf('Category:%i %s\n',Label(Top10Recommendations(i)),Titles{Top10Recommendations(i)})
end
% Vote = zeros(5,1);
% 
% for i=1:K+1
%     Vote(Label(Index(i))) = Vote(Label(Index(i))) + 1;
% end
% 
% [Votes Category] = max(Vote);
% Category
% Category = Index

aaa
toc
