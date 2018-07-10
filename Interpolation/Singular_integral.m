%第二类求积公式误差分析
function [ er_singular_legendre,er_singular_nptp] = Singular_integral( fun,n )
nmd=0.5;
nt=1e-8;
p=2*atan((1e-15)^(1/n));
syms x;
 I1=0;
 I2=0;
pn=sym2poly(diff((x^2-1)^(n+1),n+1))/(2^n*factorial(n));
    xk=roots(pn);                                               
    Ak=zeros(n+1,1);       
     z=zeros(n+1,1);
     g=zeros(n+1,1);
    for i=1:n+1
        xkt=xk;
        xkt(i)=[];
        pn1=poly(xkt);                                           
        fp=@(x)polyval(pn1,x)/polyval(pn1,xk(i));              
        Ak(i)=quadl(fp,-1,1);
        z(i)=asin(xk(i)*sin(p))/p;
    end
%  nmd=xk(2);
    f1=fun/(x-nmd);
    I=quad(matlabFunction(f1),-1,nmd-nt)+quad(matlabFunction(f1),nmd+nt,1);     %原积分
   t=0;
    for i=1:n+1
        if xk(i)==nmd
            t=i;
            continue;
        else
         I1=I1+Ak(i)*((fun(xk(i))-fun(nmd))./(xk(i)-nmd)); 
         g(i)=((fun(z(i))/cos(p*z(i)))-(fun(nmd)/cos(p*nmd)))/(z(i)-nmd); 
         I2=I2+Ak(i)*g(i);
        end
    end
    w=(cos(p*x)-cos(p*nmd))./(x-nmd);
    if t==0
        I1=I1+fun(nmd)*log((1-nmd)/(1+nmd));
        I2=sin(p)*I2/p+fun(nmd)/cos(p*nmd)*quad(matlabFunction(w),-1,1)+fun(nmd)*log((1-nmd)/(1+nmd));
    else
    f2=diff(sym(fun),1);
    f3=matlabFunction(f2);
    I1=I1+Ak(t)*f3(nmd)+fun(nmd)*log((1-nmd)/(1+nmd));
   I2=sin(p)*I2/p+sin(p)/p*Ak(t)*((f3(nmd)*cos(p*nmd)+p*fun(nmd)*sin(p*nmd))/((cos(p*nmd))^2))+fun(nmd)/cos(p*nmd)*quad(matlabFunction(w),-1,1)+fun(nmd)*log((1-nmd)/(1+nmd));
   end 
   er_singular_legendre=abs(I-I1);
   er_singular_nptp=abs(I-I2);
end

