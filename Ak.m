function y = Ak( n )
digits(64);
if n<=0
    fprintf('n必须为正整数！\n');
    return;
else
%     format long;
    laguerre=factorial(n)*Laguerre(n);
    xk=roots(laguerre);
    %L=poly2sym(laguerre)
    L1=polyder(laguerre);
    t=vpa(polyval(L1,xk).*polyval(L1,xk));
    y=vpa(factorial(n)*factorial(n)./(xk.*t));
%     y=y./sum(y);%归一化
end
end

