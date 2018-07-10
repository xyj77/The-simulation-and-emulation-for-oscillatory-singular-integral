%��������guass-chebyshev�ͻ������ͱ任��Ļ������
function  [Er_chebyshev,Er_nptp1]=guasschebyshev( fun,n ) %�������Ϊ��������ͽ���
    p=2*atan((1e-15)^(1/n));
    syms x;
    g=fun/sqrt(1-x.*x);                         
    q=quadl(matlabFunction(g),-1,1);                    %����chebyshevȨ�����Ļ���ֵ
 a=0;
 b=0;
 for k=1:n
     yy(k)=cos(pi*(2*k-1)/(2*n));                       %chebyshev���
     xx(k)=asin(yy(k)*sin(p))/p;                        %�任��ĵ�
     a=a+fun(yy(k));
     b=b+fun(xx(k))/(cos(p*xx(k))*sqrt(1-xx(k)*xx(k)))*sqrt(1-((sin(p*xx(k))/sin(p))^2));
 end
    I1=a*pi/n;                                          %chebyshev����ֵ
    I2=b*pi*sin(p)/(n*p);                               %�任��Ļ���ֵ
    Er_chebyshev=abs(q-I1);                             %�������
    Er_nptp1=abs(q-I2);
end
