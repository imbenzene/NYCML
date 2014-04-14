I=find(Pred==1);
pn=TestX(I,:);
I=find(Pred==-1);
nn=TestX(I,:);




scatter( pn(:,1), pn(:,2),5, 'r');
hold on;
scatter (nn(:,1), nn(:,2),5, 'g');

hold on;
scatter (Hplane(:,1), Hplane(:,2),5, 'b');















