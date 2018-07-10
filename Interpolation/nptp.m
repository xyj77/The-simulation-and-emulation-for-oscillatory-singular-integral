%��ֱ���chebyshev������sin(p*x)./sin(p)�任��Ļ����ƽ���������������ֵ
function  [er_chebyshev,er_nptp1]=nptp(fun,n)           %�����������ֵ���������Ϊ��������Լ��ƽ�����ʽ�Ľ���
p=2*atan((1e-15)^(1/n));                                %��pֵ
syms x
xx=-1:0.02:1;                                           %xxΪ��������һ���
fn=zeros(1,length(xx));
fnp1=zeros(1,length(xx));
A=zeros(n+1,1);                                         %����ʽϵ������ֵ
A1=zeros(n+1,1);
er=0;                                                   %����ֵ            
er1=0;
B=zeros(n+1,1);                                         %Ϊ�������ʽϵ������׼������
B(1)=2;
B(2:n+1)=1;

for i=1:n+1
f=@(x)((polyval(T(i-1),x).*fun(x))./sqrt(1-x.*x));      
A(i)=2*quad(f,-1,1)./(B(i)*pi);                          %chebyshev����ʽϵ��
g=@(x)((fun(asin(x*sin(p))/p).*polyval(T(i-1),x))./sqrt(1-x.*x));
A1(i)=2*quad(g,-1,1)./(B(i)*pi);                         %�任��Ķ���ʽϵ��
end
for i=1:length(xx)                                       
    z(i)=sin(p*xx(i))/sin(p);
    for k=1:n+1
    fn(i)=fn(i)+A(k)*polyval(T(k-1),xx(i));              %����ʽ�ƽ�����xx����ֵ        
    fnp1(i)=fnp1(i)+A1(k).*polyval(T(k-1),z(i));
    end
    er=er+(fun(xx(i))-fn(i))^2;                             
    er1=er1+(fun(xx(i))-fnp1(i))^2;
end
er=sqrt(er);                                                %�������
er1=sqrt(er1);
er_chebyshev=er;                                            %�������
er_nptp1=er1;
end

