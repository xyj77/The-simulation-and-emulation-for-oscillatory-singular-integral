%变换后的奇异积分误差分析
function er_nptp1_singular = singular3_nptp1( fun,n,p1 )
syms x
A2=zeros(n+1,1);
B=zeros(n+1,1); 
B(1)=2;
B(2:n+1)=1;
I3=0;
nmd=0.5;
nt=1e-8;
f1=fun/(x-nmd);
I=quad(matlabFunction(f1),-1,nmd-nt)+quad(matlabFunction(f1),nmd+nt,1);   %原积分  
for i=1:n+1 
g=@(x)((fun(asin(x*sin(p1))/p1).*polyval(T(i-1),x))./sqrt(1-x.*x));
A2(i)=2*quad(g,-1,1)./(B(i)*pi);
end
   z=sin(p1*x)/sin(p1);
   for i=2:n+1
    a=polyval(T(i-1),sin(p1*nmd)/sin(p1));
    Tn=poly2sym(T(i-1),z);
    s=(Tn-a)./(x-nmd);
    s1=simple(s);
    s2=quad(matlabFunction(s1),-1,1);
    I3=I3+A2(i)*s2;
   end
   c=0;
   for i=1:n+1
      c=c+A2(i)*polyval(T(i-1),sin(p1*nmd)/sin(p1));
   end
   I3=I3+c*log((1-nmd)/(1+nmd));
   er_nptp1_singular=abs(I-I3);

end

