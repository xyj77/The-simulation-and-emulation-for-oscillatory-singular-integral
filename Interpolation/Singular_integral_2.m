%第三类求积公式误差分析
function [ er_singular_legendre_3,er_singular_nptp_3] = Singular_integral_2( fun,n )
nmd=0.5;
nt=1e-8;
p=2*atan((1e-15)^(1/n));
syms x;
I1=0;
I2=0;
if n==0
    pn=1;
else
    pn=sym2poly(diff((x^2-1)^n,n))/(2^n*factorial(n));
end
    xk=roots(pn);
    ppn=poly2sym(pn,'x');
    pnk=matlabFunction(ppn);
    dpn=diff(ppn,1);
    dp=matlabFunction(dpn)  ;
    b=pnk(nmd);
    f1=fun/(x-nmd);
    I=quad(matlabFunction(f1),-1,nmd-nt)+quad(matlabFunction(f1),nmd+nt,1);   %原积分  
    for i=1:n
        a=xk(i);
        g=simple((pnk./(x-a)-b/(nmd-a))./(x-nmd));
        w=simple(g);
        s=quad(matlabFunction(w),-1,1);
        I1=I1+fun(xk(i))/dp(xk(i))*s;
    end
    b2=sin(p*nmd)/sin(p);
    c=pnk(b2);
    for i=1:n
        a2=sin(p*xk(i))/sin(p);
        d=c/(b2-xk(i));
        dpz=dp(xk(i));
        g2=(pnk(sin(p*x)/sin(p))./(sin(p*x)/sin(p)-xk(i))-d)./(x-nmd);
        g2=simple(g2);
        g2=g2.*cos(p*x);
        w2=matlabFunction(simple(g2));
        s2=quad(w2,-1,1);
        I2=I2+fun(asin(p*xk(i))/p)*s2/(dpz*sqrt(1-xk(i)^2));
    end
   I1=I1+fun(nmd)*log((1-nmd)/(1+nmd));
   I2=I2+fun(nmd)/cos(p*nmd)*quad(matlabFunction((cos(p*x)-cos(p*nmd))./(x-nmd)),-1,1);
   er_singular_legendre_3=abs(I-I1);
   er_singular_nptp_3=abs(I-I2);   
end

