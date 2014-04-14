x=[ 1,5,1;
    3,5,1;
    4,7,1;
    4,9,1;
    6,9,1;
    3,1,1
   ];
y=[-1;-1;1;1;1;-1];
w=zeros(50,3);
normk=zeros(50,1);
normk(1,:)=1;
k=1;
flag=0;

gama= 5/sqrt(20);
beta=0.5;
BetaGama= gama*beta;
for m=1:100
    j=1;
    for i=1:6
        Check(k)=y(i)*(sum(w(k,:).*x(i,:)))/normk(k);
        if(y(i)*(sum(w(k,:).*x(i,:))/normk(k))<=BetaGama)
            j=j+1;
            w(k+1,:)=w(k,:)+y(i)*x(i,:);
            normk(k+1)=sqrt(sum((w(k+1,1:2)).^2,2));
            k=k+1;
        end
    end
    if(j==1) 
        break;
    end
    
end

Yaxis=1:10;
scatter(x([3,4,5],1),x([3,4,5],2),'r');
hold on;
scatter(x([1,2,6],1),x([1,2,6],2),'g');
hold on;
Xaxis=0:7;
Yaxis=(-w(k,1)*Xaxis-w(k,3))/w(k,2);
plot(Xaxis,Yaxis);


