%函数返回guass-chebyshev型积分误差和变换后的积分误差
function  [Er_chebyshev,Er_nptp1]=guasschebyshev( fun,n ) %输入参数为句柄函数和阶数
    p=2*atan((1e-15)^(1/n));
    syms x;
    g=fun/sqrt(1-x.*x);                         
    q=quadl(matlabFunction(g),-1,1);                    %带有chebyshev权函数的积分值
 a=0;
 b=0;
 for k=1:n
     yy(k)=cos(pi*(2*k-1)/(2*n));                       %chebyshev零点
     xx(k)=asin(yy(k)*sin(p))/p;                        %变换后的点
     a=a+fun(yy(k));
     b=b+fun(xx(k))/(cos(p*xx(k))*sqrt(1-xx(k)*xx(k)))*sqrt(1-((sin(p*xx(k))/sin(p))^2));
 end
    I1=a*pi/n;                                          %chebyshev积分值
    I2=b*pi*sin(p)/(n*p);                               %变换后的积分值
    Er_chebyshev=abs(q-I1);                             %计算误差
    Er_nptp1=abs(q-I2);
end
