function Er = I_ErExp2( fun , w  , n  , t , tag)
%����ʾ��Exp(x)������


%==============================��1��ȷֵ===================================
%��1���ξ�ȷֵ
I=0;
for a=0:inf
    l=integral(@(x)(x.^(2*a).*sin(w*x.^2)/factorial(2*a+1)),0,1,'AbsTol',1e-20,'RelTol',1e-10);
    I=I+2*l;
    if l>1e-16
       break;
    end
end


% for a=0:512
%     l=integral(@(x)(x.^(a-0.5).*sin(w*x)),0,1,'AbsTol',1e-20,'RelTol',1e-10);
%     I=I+l/factorial(2*a+1);
%     if l>1e-16
%        break;
%     end
% end

%==========================================================================


%=====================һ�����ú���Gauss_Kronrod����=========================
% [I_gk,Er_gk]=quadgk(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%==========================================================================

%========================�������ú���integral()=============================
I_integral=integral(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%==========================================================================


%==================����Gauss_Leguerre���:�������==========================
laguerre=Laguerre(n);
xk=roots(laguerre);
ak=Ak(n);                       %��Laguerreϵ��
wk=ak./sum(ak);                 %���Ȩ��
Q=0;
for a=1:n
        Q=Q+(1i*exp(1i*w)/2/w)*wk(a)*exp(-1*sqrt(1+1i*xk(a)/w))/(1+1i*xk(a)/w+t*sqrt(1+1i*xk(a)/w))...
        -(1i/2/w)*wk(a)*exp(-1*sqrt(1+1i*xk(a)/w))/(1i*xk(a)/w+t*sqrt(1i*xk(a)/w))...
        -(1i*exp(1i*w)/2/w)*wk(a)*exp(sqrt(1+1i*xk(a)/w))/(1+1i*xk(a)/w-t*sqrt(1+1i*xk(a)/w))...
        +(1i/2/w)*wk(a)*exp(sqrt(1+1i*xk(a)/w))/(1i*xk(a)/w-t*sqrt(1i*xk(a)/w));
end
if t==0||t<-1||t>1
    Q=Q+0;
elseif t<0
    Q=Q-1i*exp(1i*w*t^2)*pi*exp(t);
else
    Q=Q+1i*exp(1i*w*t^2)*pi*exp(t);
end

%==========================================================================


%��ȷֵI

%���ú�������ֵ
% Er=I;
% Er=imag(Q);
% Er=I_gk;
Er=I_integral;

%���ú����������
% Er=abs(I_integral-I);
% Er=abs(I_gk-I);
% Er=Er_gk;
% Er=abs(imag(Q)-I_integral);

% Er=abs(imag(Q)-I);

% if tag==1           %�ж�ʵ�鲿
%     Er=abs(real(Q)-I);
% else
%     Er=abs(imag(Q)-I);
% end

end


