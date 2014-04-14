x=[ 1,5,1;
    3,5,1;
    4,7,1;
    4,9,1;
    6,9,1;
    3,1,1
   ];
y=[-1;-1;1;1;1;-1];
w=zeros(50,3);
k=1;
flag=0;

while(flag==0)
    j=1;
    for i=1:6
        if(y(i)*(sum(w(k,:).*x(i,:)))<=0)
            j=j+1;
            w(k+1,:)=w(k,:)+y(i)*x(i,:);
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
