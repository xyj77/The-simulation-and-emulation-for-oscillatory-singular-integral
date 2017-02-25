function Er = I_Er( fun , f , w , n , t , tag , power )
%任意函数积分误差计算

%================================积分精确值I===============================
%精确值
% I=0;
% if power==1
%     % 例一精确值
% %     syms k j1
% %     I=2*Si(w)-2*symsum((1/factorial(2*k))*symsum(factorial(j1)*...
% %         nchoosek(2*k-1,j1)*cos(w+pi*j1/2)/w^(j1+1),j1,0,2*k-1),k,1,32);
%     % 例二精确值
%     I=(1/2)*(exp((1+1i*w)*t)*(ei((1+1i*w)*(1-t))-ei((1+1i*w)*(-1-t))-1i*pi)...
%         -exp((-1+1i*w)*t)*(ei((-1+1i*w)*(1-t))-ei((-1+1i*w)*(-1-t))-1i*pi));
% 
% elseif power==2
%     %例一二次精确值
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

%====================一、内置函数Gauss_Kronrod法则==========================
% [I_gk,Er_gk]=quadgk(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%==========================================================================

%========================二、内置函数integral()=============================
% I_integral=integral(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%==========================================================================

%============三、Gauss_Legendre求积*******结果非常差，部分点NaN=============
% syms x
% p=sym2poly(diff((x^2-1)^(n+1),n+1))/(2^n*factorial(n));
% xk=roots(p); % 求积节点
% % 计算求积系数
% Ak=zeros(n+1,1);
% for i=1:n+1
%     xkt=xk;
%     xkt(i)=[];
%     pn=poly(xkt);
%     fp=@(x)polyval(pn,x)/polyval(pn,xk(i));
%     Ak(i)=quadgk(fp,-1,1); % 求积系数
% end
% fun=fcnchk(fun,'vectorize');
%Gauss_Legendre求积公式积分值，**********部分点NaN
%I_GL=sum(Ak.*fun(xk));
%==========================================================================


%==================四、Gauss_Leguerre求积:毕设课题==========================
laguerre=Laguerre(n);
xk=roots(laguerre);
ak=Ak(n);                       %求Laguerre系数
wk=ak./sum(ak);                 %求积权重
Q=0;

if power==1
% 一次振荡
    for a=1:n
        Q=Q+(1i*exp(-1*1i*w)/w)*wk(a)*f(-1+1i*xk(a)/w)/(-1-t+1i*xk(a)/w)...
        -(1i*exp(1i*w)/w)*wk(a)*f(1+1i*xk(a)/w)/(1-t+1i*xk(a)/w);
    end
    Q=Q+1i*exp(1i*w*t)*pi*f(t);

    % 二次振荡
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


%内置函数积分值
% Er=abs(I_gk);
% Er=Q;

%内置函数积分误差
% Er=abs(Er_gk);
% Er=abs(imag(Q)-I_integral);
% Er=abs(imag(Q)-I_gk);
% Er=abs(imag(Q)-I);


%显示积分结果
if tag==1           %判断实虚部
    Er=abs(real(Q));
else
    Er=abs(imag(Q));
end

end

