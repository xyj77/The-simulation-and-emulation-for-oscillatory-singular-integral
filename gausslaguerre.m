function Q = gausslaguerre( f , n )
%GAUSSLAGUERRE Summary of this function goes here
%   Detailed explanation goes here
laguerre=Laguerre(n);
xk=roots(laguerre);
% digits(64);
ak=Ak(n);                       %求Laguerre系数
wk=ak./sum(ak);                 %求积权重


% f=@(x)1./(1+exp(-2*x));
fun=@(x)f(x)./exp(-x);

Q=sum(wk.*fun(xk));

end

