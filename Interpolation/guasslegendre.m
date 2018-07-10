%计算guass-legendre型积分与sin(p*x)./sin(p)变换后的积分误差
function  [Er_legendre,Er_nptp1]=guasslegendre( fun,n ) 
    p=2*atan((1e-15)^(1/n));
    syms x
    pn=sym2poly(diff((x^2-1)^(n+1),n+1))/(2^n*factorial(n));        %计算勒让德多项式基
    xk=roots(pn);                                                   %计算n阶多项式零点
    Ak=zeros(n+1,1);                                                
    for i=1:n+1
        xkt=xk;
        xkt(i)=[];
        pn1=poly(xkt);                                           
        fp=@(x)polyval(pn1,x)/polyval(pn1,xk(i));              
        Ak(i)=quadl(fp,-1,1);                                       %计算勒让德多项式系数
        z(i)=asin(xk(i)*sin(p))/p;
        Ak1(i)=sin(p)/(p*cos(p*z(i)))*Ak(i);                        %变换后的系数                 
    end
    q_l=sum(Ak.*fun(xk));                                           %经典勒让德型积分值
    q_nptp1=sum(Ak1.*fun(z));                                       %变换后的积分值
    q=quadl(fun,-1,1);                                              %原函数积分值
    Er_legendre=abs(q-q_l);                                         %经典积分误差
    Er_nptp1=abs(q-q_nptp1);                                        %变换后积分误差
end
%{
检验函数正确性的语句：
 fun=(pi/4)^3*(1+x).^2.*cos((pi/4)*(1+x));
guasslegendre(fun,5)
%}
