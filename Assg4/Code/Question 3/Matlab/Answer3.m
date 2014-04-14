[Y, X] =svmlread2('arxiv.train');
[Z, W] =svmlread2('arxiv.test');

PredictedClass=zeros(32487,1);
Ypositive=Y(X==1,:);
Ynegative=Y(X==-1,:);

TotalPositiveWordOccurence= sum(Ypositive);
TotalNegativeWordOccurence=sum(Ynegative);

%[x,y,v]=find(Ypositive(:,:))
%TotalPositiveWords=length(unique(y))

vocab=99758;
TotalPositiveWords=sum(sum(Ypositive));
TotalNegativeWords=sum(sum(Ynegative));
%TotalPositiveWords=38799;
%TotalNegativeWords=76242;
ProbPostiveClass=length(find(X==1))/length(X);
ProbNegativeClass=length(find(X==-1))/length(X);

for k=1: 32487
WordIndex=find(Z(k,:)>0);
PositiveWordOccur=TotalPositiveWordOccurence(1,WordIndex);
ProbWordOccurPos=(PositiveWordOccur+1)/(vocab+TotalPositiveWords);
TotPosProb=prod(ProbWordOccurPos)*ProbPostiveClass;
TotPosProbLog=sum(log(ProbWordOccurPos))+ log(ProbPostiveClass)*(-1);

NegativeWordOccur=TotalNegativeWordOccurence(1,WordIndex);
ProbWordOccurNeg=(NegativeWordOccur+1)/(vocab+TotalNegativeWords);
TotNegProb=prod(ProbWordOccurNeg)*ProbNegativeClass;
TotNegProbLog=sum(log(ProbWordOccurNeg))+ log(ProbNegativeClass)*(-1);

if(TotNegProbLog<=(10)*TotPosProbLog )
    PredictedClass(k,1)= 1;
else
    PredictedClass(k,1)= -1;
end

end





