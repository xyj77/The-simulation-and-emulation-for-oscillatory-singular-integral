%����guass-legendre�ͻ�����sin(p*x)./sin(p)�任��Ļ������
function  [Er_legendre,Er_nptp1]=guasslegendre( fun,n ) 
    p=2*atan((1e-15)^(1/n));
    syms x
    pn=sym2poly(diff((x^2-1)^(n+1),n+1))/(2^n*factorial(n));        %�������õ¶���ʽ��
    xk=roots(pn);                                                   %����n�׶���ʽ���
    Ak=zeros(n+1,1);                                                
    for i=1:n+1
        xkt=xk;
        xkt(i)=[];
        pn1=poly(xkt);                                           
        fp=@(x)polyval(pn1,x)/polyval(pn1,xk(i));              
        Ak(i)=quadl(fp,-1,1);                                       %�������õ¶���ʽϵ��
        z(i)=asin(xk(i)*sin(p))/p;
        Ak1(i)=sin(p)/(p*cos(p*z(i)))*Ak(i);                        %�任���ϵ��                 
    end
    q_l=sum(Ak.*fun(xk));                                           %�������õ��ͻ���ֵ
    q_nptp1=sum(Ak1.*fun(z));                                       %�任��Ļ���ֵ
    q=quadl(fun,-1,1);                                              %ԭ��������ֵ
    Er_legendre=abs(q-q_l);                                         %����������
    Er_nptp1=abs(q-q_nptp1);                                        %�任��������
end
%{
���麯����ȷ�Ե���䣺
 fun=(pi/4)^3*(1+x).^2.*cos((pi/4)*(1+x));
guasslegendre(fun,5)
%}
