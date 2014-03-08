
%Boundary of combined classifier
%pn = combine2(any(combine2== 1,2),:);
%nn= combine2(any(combine2== 0,2),:);


%Boundary of general classifier
%pn = combine(any(combine== 1,2),:);
%nn= combine(any(combine== 0,2),:);


%Boundary of 1 such pruned classifier
%pn = combine10(any(combine10== 1,2),:);
%nn = combine10(any(combine10== 0,2),:);

%Boundary of 2 such pruned classifier
%pn = combine11(any(combine11== 1,2),:);
%nn = combine11(any(combine11== 0,2),:);


%Boundary of the OverFitting trees
pn = combine20(any(combine20== 1,2),:);
nn = combine20(any(combine20== 0,2),:);



scatter( pn(:,2), pn(:,3),5, 'r');
hold on;
scatter (nn(:,2), nn(:,3),5, 'g');










