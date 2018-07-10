%求分别用chebyshev基，和sin(p*x)./sin(p)变换后的基来逼近函数后产生的误差值
function  [er_chebyshev,er_nptp1]=nptp(fun,n)           %函数返回误差值，输入变量为句柄函数以及逼近多项式的阶数
p=2*atan((1e-15)^(1/n));                                %求p值
syms x
xx=-1:0.02:1;                                           %xx为计算误差的一组点
fn=zeros(1,length(xx));
fnp1=zeros(1,length(xx));
A=zeros(n+1,1);                                         %多项式系数赋初值
A1=zeros(n+1,1);
er=0;                                                   %误差初值            
er1=0;
B=zeros(n+1,1);                                         %为计算多项式系数做的准备工作
B(1)=2;
B(2:n+1)=1;

for i=1:n+1
f=@(x)((polyval(T(i-1),x).*fun(x))./sqrt(1-x.*x));      
A(i)=2*quad(f,-1,1)./(B(i)*pi);                          %chebyshev多项式系数
g=@(x)((fun(asin(x*sin(p))/p).*polyval(T(i-1),x))./sqrt(1-x.*x));
A1(i)=2*quad(g,-1,1)./(B(i)*pi);                         %变换后的多项式系数
end
for i=1:length(xx)                                       
    z(i)=sin(p*xx(i))/sin(p);
    for k=1:n+1
    fn(i)=fn(i)+A(k)*polyval(T(k-1),xx(i));              %多项式逼近后在xx处的值        
    fnp1(i)=fnp1(i)+A1(k).*polyval(T(k-1),z(i));
    end
    er=er+(fun(xx(i))-fn(i))^2;                             
    er1=er1+(fun(xx(i))-fnp1(i))^2;
end
er=sqrt(er);                                                %计算误差
er1=sqrt(er1);
er_chebyshev=er;                                            %返回误差
er_nptp1=er1;
end

