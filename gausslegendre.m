function ql=gausslegendre(fun,a,b,n,tol)
% 高斯-勒让德数值积分
%
% 参数说明
% fun：积分表达式，可以是函数句柄、inline函数、匿名函数、字符串表达式，但是必须可以接受矢量输入
% a,b：积分上下限，注意积分区间太大会降低精度，此时建议使用复化求积公式，默认[-1 1]
% n：积分阶数，可以任意正整数，但是不建议设置过大，大不一定能得到更好的精度，默认7
% tol：积分精度，默认1e-6
% ql：积分结果
% Ak：求积系数
% xk：求积节点，满足ql=sum(Ak.*fun(xk))
%
% 举例说明
% fun=@(x)exp(x).*cos(x); % 必须可以接受矢量输入
% quadl(fun,0,pi) % 调用MATLAB内部积分函数检验
% [ql,Ak,xk]=guasslegendre(fun,0,pi)
%
% 高斯积分说明
% 1.高斯积分是精度最高的插值型数值积分，具有2n+1阶精度，并且高斯积分总是稳定。一般插值型数值积分精度为至少n阶，且具有高阶不稳定性
% 2.高斯求积节点就是对应n阶正交多项式的根，构建首项系数为1的正交多项式参见
% 3.高斯求积系数，可以由Lagrange多项式插值系数进行积分得到
% 4.由高斯求积节点为根构成的多项式，与任何不超过n阶的多项式正交
%
% 勒让德正交多项式说明
% 1.区间[-1,1]上关于权rho(x)=1的正交多项式系，满足
%                       |-   2/(2j+1)  (i=j)
% ∫(Pi(x)*Pj(x),-1,1)= |
%                       |-   0         (i≠j)
% 2.勒让德正交多项式的通式为：P0=1, Pn=1/(2^n*n!) * diff((x^2-1)^n,n)  (n=1,2,...)
% 3.关于高斯-勒让德的数值积分的求积系数和节点，由于表达式不便于书写，感兴趣的网友可以参考相关书籍
%
% by dynamic of Matlab技术论坛
% see also http://www.matlabsky.com
% contact me matlabsky@gmail.com
% 2010-01-15 23:05:33
%
% 输入参数有效性检验
if nargin==1
    a=-1;b=1;n=7;tol=1e-8;
elseif nargin==3
    n=7;tol=1e-8;
elseif nargin==4
    tol=1e-8;
elseif nargin==2|nargin>5
    error('The Number of Input Arguments Is Wrong!');
end
% 计算求积节点
syms x
p=sym2poly(diff((x^2-1)^(n+1),n+1))/(2^n*factorial(n));
tk=roots(p); % 求积节点
% 计算求积系数
Ak=zeros(n+1,1);
for i=1:n+1
    xkt=tk;
    xkt(i)=[];
    pn=poly(xkt);
    fp=@(x)polyval(pn,x)/polyval(pn,tk(i));
    Ak(i)=quadl(fp,-1,1,tol); % 求积系数
end
% 积分变量代换，将[a,b]变换到[-1,1]
xk=(b-a)/2*tk+(b+a)/2;
% 检验积分函数fun有效性
fun=fcnchk(fun,'vectorize');
% 计算变量代换之后积分函数的值
fx=fun(xk)*(b-a)/2;
% 计算积分值
ql=sum(Ak.*fx);

