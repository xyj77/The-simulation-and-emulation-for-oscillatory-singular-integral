%����ʹ�����С��pֵ
function  p_best=p(fun,n)
r=zeros(1,30);   %r:30�������
r= -1+2*rand(1,30);
p1=0.01:0.01:pi/2;    %p1:Ҫ�������p�ļ��ϣ�������һ��p_best
p_length=length(p1);  
B=zeros(n+1,1); 
B(1)=2;
B(2:n+1)=1;
syms x 
fnp2=zeros(1,30);    %�ƽ�����ʽ����ͽ��
E=zeros(1,p_length);   
A2=zeros(1,n+1);
for k=1:p_length
    for i=1:n+1     %��֪p1��A  
        w=@(x)((fun(asin(x*sin(p1(k)))/p1(k)).*polyval(T(i-1),x))./sqrt(1-x.*x));
        A2(i)=2*(quad(w,-1,1))/(B(i)*pi);
    end
    fnp2=zeros(1,30);
    for i=1:30     %fnp2  iΪj
        zz(i)=sin(p1(k)*r(i))/sin(p1(k));
        for j=1:n+1
        fnp2(i)=fnp2(i)+A2(j)*polyval(T(j-1),zz(i));
        end   
        E(k)=E(k)+abs(fnp2(i)-fun(r(i)));                                                                                                        %��֪p1��E
    end
end
[er i]=min(E);
p_best=p1(i);
end
%{
fun=@(x)exp((-30)*x.*x);
p_best=p(fun,10)
%}