%由最优p值，求得多项式逼近的误差，方法类似于nptp函数中求基变换后的误差
function er_nptp2= nptp2( fun,n,p1 )            %输入变量为函数，多项式阶数，最优p
syms x
xx=-1:0.02:1;
fnp2=zeros(1,length(xx));
A2=zeros(n+1,1);
B=zeros(n+1,1); 
B(1)=2;
B(2:n+1)=1;
er2=0;
for i=1:n+1
w=@(x)((fun(asin(x*sin(p1))/p1).*polyval(T(i-1),x))./sqrt(1-x.*x));
A2(i)=2*quad(w,-1,1)./(B(i)*pi);
end
for i=1:length(xx)
     zz(i)=sin(p1*xx(i))/sin(p1);
    for k=1:n+1
     fnp2(i)=fnp2(i)+A2(k).*polyval(T(k-1),zz(i));
    end
    er2=er2+(fun(xx(i))-fnp2(i))^2;
end
er2=sqrt(er2);
er_nptp2=er2;
end

