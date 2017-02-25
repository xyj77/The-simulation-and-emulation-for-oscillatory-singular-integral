function y = Ei( w , tol )

if nargin==1
    tol=1e-16;
end

% y=integral(@(x)exp(x)./x,-inf,w,'AbsTol',tol,'RelTol',tol);

y=0.5772156649015328606+log(w)/log(2.7182818245);
t=w;
k=1;
while(t>tol)
    y=y+t;
    k=k+1;
    t=w^k/k*factorial(k);
end

% y=0;
% x=1;
% t=1;
% n=0;
% while(abs(x)>=tol)
%    n=n+1;
%    y=y+x;
%    t=t*w;
%    x=factorial(n)/t;
% end
% y=y*exp(w)/w;

% ÄÚÖÃº¯ÊıÇóEi
% y=ei(w);

end

