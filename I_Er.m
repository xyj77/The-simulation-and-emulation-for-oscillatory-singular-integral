function Er = I_Er( fun , f , w , n , t , tag , power )
%���⺯������������

%================================���־�ȷֵI===============================
%��ȷֵ
% I=0;
% if power==1
%     % ��һ��ȷֵ
% %     syms k j1
% %     I=2*Si(w)-2*symsum((1/factorial(2*k))*symsum(factorial(j1)*...
% %         nchoosek(2*k-1,j1)*cos(w+pi*j1/2)/w^(j1+1),j1,0,2*k-1),k,1,32);
%     % ������ȷֵ
%     I=(1/2)*(exp((1+1i*w)*t)*(ei((1+1i*w)*(1-t))-ei((1+1i*w)*(-1-t))-1i*pi)...
%         -exp((-1+1i*w)*t)*(ei((-1+1i*w)*(1-t))-ei((-1+1i*w)*(-1-t))-1i*pi));
% 
% elseif power==2
%     %��һ���ξ�ȷֵ
%     g=@(x)sin(w*x.^x);
%     I=2*quadgk(g,0,1,'AbsTol',1e-20,'RelTol',1e-10);
%     for a=1:128
%         g1=@(x)(x.^(2*a).*sin(w*x.^2)/factorial(2*a+1));
%         l=quadgk(g1,0,1,'AbsTol',1e-20,'RelTol',1e-10);
%         I=I+2*l;
%         if l>1e-16
%             break;
%         end
%     end
%     % syms k j1
%     % I=I+2*symsum((1/factorial(2*k))*symsum(factorial(j1)*...
%     %       nchoosek(2*k-1,j1)*cos(w+pi*j1/2)/w^(j1+1),j1,0,2*k-1),k,1,32);
% end
% 


%==========================================================================

%====================һ�����ú���Gauss_Kronrod����==========================
% [I_gk,Er_gk]=quadgk(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%==========================================================================

%========================�������ú���integral()=============================
% I_integral=integral(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%==========================================================================

%============����Gauss_Legendre���*******����ǳ�����ֵ�NaN=============
% syms x
% p=sym2poly(diff((x^2-1)^(n+1),n+1))/(2^n*factorial(n));
% xk=roots(p); % ����ڵ�
% % �������ϵ��
% Ak=zeros(n+1,1);
% for i=1:n+1
%     xkt=xk;
%     xkt(i)=[];
%     pn=poly(xkt);
%     fp=@(x)polyval(pn,x)/polyval(pn,xk(i));
%     Ak(i)=quadgk(fp,-1,1); % ���ϵ��
% end
% fun=fcnchk(fun,'vectorize');
%Gauss_Legendre�����ʽ����ֵ��**********���ֵ�NaN
%I_GL=sum(Ak.*fun(xk));
%==========================================================================


%==================�ġ�Gauss_Leguerre���:�������==========================
laguerre=Laguerre(n);
xk=roots(laguerre);
ak=Ak(n);                       %��Laguerreϵ��
wk=ak./sum(ak);                 %���Ȩ��
Q=0;

if power==1
% һ����
    for a=1:n
        Q=Q+(1i*exp(-1*1i*w)/w)*wk(a)*f(-1+1i*xk(a)/w)/(-1-t+1i*xk(a)/w)...
        -(1i*exp(1i*w)/w)*wk(a)*f(1+1i*xk(a)/w)/(1-t+1i*xk(a)/w);
    end
    Q=Q+1i*exp(1i*w*t)*pi*f(t);

    % ������
elseif power==2
    for a=1:n
            Q=Q+(1i*exp(1i*w)/2/w)*wk(a)*f(-1*sqrt(1+1i*xk(a)/w))/(1+1i*xk(a)/w+t*sqrt(1+1i*xk(a)/w))...
            -(1i/2/w)*wk(a)*f(-1*sqrt(1+1i*xk(a)/w))/(1i*xk(a)/w+t*sqrt(1i*xk(a)/w))...
            -(1i*exp(1i*w)/2/w)*wk(a)*f(sqrt(1+1i*xk(a)/w))/(1+1i*xk(a)/w-t*sqrt(1+1i*xk(a)/w))...
            +(1i/2/w)*wk(a)*f(sqrt(1i*xk(a)/w))/(1i*xk(a)/w-t*sqrt(1i*xk(a)/w));
    end
    if t==0||t<-1||t>1
        Q=Q+0;
    elseif t<0
        Q=Q-1i*exp(1i*w*t^2)*pi*f(t);
    else
        Q=Q+1i*exp(1i*w*t^2)*pi*f(t);
    end
end

%==========================================================================


%���ú�������ֵ
% Er=abs(I_gk);
% Er=Q;

%���ú����������
% Er=abs(Er_gk);
% Er=abs(imag(Q)-I_integral);
% Er=abs(imag(Q)-I_gk);
% Er=abs(imag(Q)-I);


%��ʾ���ֽ��
if tag==1           %�ж�ʵ�鲿
    Er=abs(real(Q));
else
    Er=abs(imag(Q));
end

end

