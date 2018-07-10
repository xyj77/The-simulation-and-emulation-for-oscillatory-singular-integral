%chebyshev多项式逼近后的奇异积分误差分析
function [er_chebyshev_singular,er_nptp_singular]= singular3( fun,n )
p=2*atan((1e-15)^(1/n));
syms x
A=zeros(n+1,1);  
A1=zeros(n+1,1);
% fn=zeros(n+1,1);
B=zeros(n+1,1); 
B(1)=2;
B(2:n+1)=1;
I1=0;
nmd=0.5;
nt=1e-8;
f1=fun/(x-nmd);
I=quad(matlabFunction(f1),-1,nmd-nt)+quad(matlabFunction(f1),nmd+nt,1);   %原积分  
for i=1:n+1 
f=@(x)((polyval(T(i-1),x).*fun(x))./sqrt(1-x.*x));
A(i)=2*quad(f,-1,1)./(B(i)*pi);
g=@(x)((fun(asin(x*sin(p))/p).*polyval(T(i-1),x))./sqrt(1-x.*x));
A1(i)=2*quad(g,-1,1)./(B(i)*pi);
end
for i=3:n+1
    a=polyval(T(i-1),nmd);
    Tn=poly2sym(T(i-1),'x');
    s=(Tn-a)./(x-nmd);
    s1=simple(s);
    s2=quad(matlabFunction(s1),-1,1);
    I1=I1+A(i)*s2;
end
b=0;
for i=1:n+1
    b=b+A(i)*polyval(T(i-1),nmd);
end
   I1=I1+2*A(2)+b*log((1-nmd)/(1+nmd));

   I2=0;
   z=sin(p*x)/sin(p);
   for i=2:n+1
    a=polyval(T(i-1),sin(p*nmd)/sin(p));
    Tn=poly2sym(T(i-1),z);
    s=(Tn-a)./(x-nmd);
    s1=simple(s);
    s2=quad(matlabFunction(s1),-1,1);
    I2=I2+A1(i)*s2;
   end
   c=0;
   for i=1:n+1
      c=c+A1(i)*polyval(T(i-1),sin(p*nmd)/sin(p));
   end
   I2=I2+c*log((1-nmd)/(1+nmd));
   er_chebyshev_singular=abs(I-I1);
   er_nptp_singular=abs(I-I2);
end

