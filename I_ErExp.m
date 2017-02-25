function Er = I_ErExp( fun , w  , n  , t , tag)
%一次示例Exp(x)误差计算

%==============================例一精确值==================================
switch w
    case 8
        I=3.18735305970599894357062;
    case 16
        I=3.32606645594563327618547;
          
    case 32
        I=3.06086252408368626822456;
          
    case 64
%         I=3.1225389504240206317575712091637;
        %100 8 99 4
        I=3.1225389504240207706627867798048;
    case 128
        I=3.15826495753223053066698;
    otherwise
        syms k j1
        I=2*Si(w)-2*symsum((1/factorial(2*k))*symsum(factorial(j1)*...
        nchoosek(2*k-1,j1)*cos(w+pi*j1/2)/w^(j1+1),j1,0,2*k-1),k,1,32);   
end;

% syms k j1
% I=2*Si(w)-2*symsum((1/factorial(2*k))*symsum(factorial(j1)*...
% nchoosek(2*k-1,j1)*cos(w+pi*j1/2)/w^(j1+1),j1,0,2*k-1),k,1,32);

% l=0;
% I=2*Si(w);
% for k=1.0:1:32
%     for b=0:2*k-1
%         l=l+factorial(b)*Cnm(2*k-1,b)*cos(w+b*pi/2)/(w^(b+1));
%     end
%     l=double(l/factorial(2*k));
% %     if l<1e-16
% %         break;
% %     end
%     I=I-2*l;
% end

%==========================================================================


%=====================一、内置函数Gauss_Kronrod法则=========================
% [I_gk,Er_gk]=quadgk(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%==========================================================================

%========================二、内置函数integral()=============================
% I_integral=integral(fun,-1,1,'AbsTol',1e-20,'RelTol',1e-20);
%==========================================================================


%==================三、Gauss_Leguerre求积:毕设课题==========================
laguerre=Laguerre(n);
xk=roots(laguerre);
% digits(64);
ak=Ak(n);                       %求Laguerre系数
wk=ak./sum(ak);                 %求积权重
Q=0;
for a=1:n
    Q=Q+(1i*exp(-1*1i*w)/w)*wk(a)*exp(-1+1i*xk(a)/w)/(-1-t+1i*xk(a)/w)...
    -(1i*exp(1i*w)/w)*wk(a)*exp(1+1i*xk(a)/w)/(1-t+1i*xk(a)/w);
end
Q=Q+1i*exp(1i*w*t)*pi*exp(t);

%==========================================================================


%精确值I

%内置函数积分值
% Er=abs(I_gk);
%Er=abs(I_integral);

%内置函数积分误差
% Er=Er_gk;
% Er=abs(I_integral-I);
Er=abs(imag(Q)-I);


% if tag==1           %判断实虚部
%     Er=abs(real(Q)-I);
% else
%     Er=abs(imag(Q)-I);
% end

end

