%zh

% w=1:128;
% % w=[4,8,16,32,64,128];
% Q=zeros(length(w),1);
% I=zeros(length(w),1);
% for i=1:length(w),
%     f=@(x)x.^2.*sin(w(i).*x.^2);
%     Q(i)=gausslegendre(f,-1,1,5);
% %     Q(i)=gausslaguerre(f,5);
%     I(i)=integral(f,-1,1,'AbsTol',1e-16,'RelTol',1e-8);   
% end
% Er=abs(Q-I);
% plot(w,Er),xlabel('w'),ylabel('Gauss-Legendre求积误差');
% 

%一次振荡
% w=[1,2,3,4,5,6,7,8];
% f=@(x)sinh(x);
% t=-0.13;
% n=[1,2,3,4];
% Q=zeros(length(w),1);
% I=zeros(length(w),1);
% for j=1:length(n),
%     for i=1:length(w),
%         fun=@(x)sin(w(i).*x).*f(x)./(x-t);
%         Q(i)=I_Er(fun,f,w(i),n(j),t,0,1);
% %         I(i)=integral(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%         I(i)=integral(fun,-1,t-1e-8);
%         I(i)=I(i)+integral(fun,t+1e-8,1);
%     end
%     subplot(2,2,j);plot(w,Q,'r-*',w,I,'b-^'),
%     xlabel('w'),ylabel('积分值'),
%     str=strcat('n=',num2str(n(j)+1));
%     text(6,-0.4,str);legend('Gauss-Laguerre','精确值');
%     format short e;
%     abs(Q-I)
% end
% 


% 
% % 二次sin(x),t=0.1
w=20:35;
f=@(x)sin(x);
t=0.1;
n=[8,12,16,20];
Q=zeros(length(w),1);
I=zeros(length(w),1);
Er=zeros(length(w),length(n));
for j=1:length(n),
    for i=1:length(w),
        fun=@(x)sin(w(i).*x.^2).*f(x)./(x-t);
        Q(i)=I_Er(fun,f,w(i),n(j),t,0,2);
        I(i)=quadgk(fun,-1,t-1e-8);
        I(i)=I(i)+quadgk(fun,t+1e-8,1);
        Er(i,j)=abs(imag(Q(i))-I(i));%计算结果的虚部误差
    end
    subplot(2,2,j);
    plot(w,imag(Q),'r-*',w,I,'b-^'),
    xlabel('w'),ylabel('积分值'),
    str=strcat('n=',num2str(n(j)));
    text(31,0.38,str);legend('Gauss-Laguerre','参考值'); 
end
Er


% % exp(x)t=0
% w=20:35;
% f=@(x)exp(x);
% t=0;
% n=[8,12,16,20];
% Q=zeros(length(w),1);
% I=zeros(length(w),1);
% for j=1:length(n),
%     for i=1:length(w),
%         fun=@(x)sin(w(i).*x.^2).*f(x)./(x-t);
%         Q(i)=I_Er(fun,f,w(i),n(j),t,0,2);
% %         I(i)=integral(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%         I(i)=quadgk(fun,-1,t-1e-8);
%         I(i)=I(i)+quadgk(fun,t+1e-8,1);
%     end
%     subplot(2,2,j);
%     plot(w,Q,'r-*',w,I,'b-^'),
%     xlabel('w'),ylabel('积分值'),
%     str=strcat('n=',num2str(n(j)));
%     text(31,0.38,str);legend('Gauss-Laguerre','参考值'); 
%     abs(Q-I)
% end


% % x.^3,t=0
% w=5:20;
% f=@(x)(x.^3+0.03);
% t=0.2;
% n=[4,8,12,16];
% Q=zeros(length(w),1);
% I=zeros(length(w),1);
% for j=1:length(n),
%     for i=1:length(w),
%         fun=@(x)sin(w(i).*x.^2).*f(x)./(x-t);
%         Q(i)=I_Er(fun,f,w(i),n(j),t,0,2);
% %         I(i)=integral(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%         I(i)=quadgk(fun,-1,t-1e-8);
%         I(i)=I(i)+quadgk(fun,t+1e-8,1);
%     end
%     subplot(2,2,j);
%     plot(w,Q,'r-*',w,I,'b-^'),
%     xlabel('w'),ylabel('积分值'),
%     str=strcat('n=',num2str(n(j)));
%     text(16,-0.05,str);legend('Gauss-Laguerre','参考值'); 
%     abs(Q-I)
% end

% sinx+cosx,t=0.19
% w=25:40;
% f=@(x)(sin(x)+cos(x));
% t=0.19;
% n=[10,15,20,25];
% Q=zeros(length(w),1);
% I=zeros(length(w),1);
% Er=zeros(length(w),length(n));
% for j=1:length(n),
%     for i=1:length(w),
%         fun=@(x)sin(w(i).*x.^2).*f(x)./(x-t);
%         Q(i)=I_Er(fun,f,w(i),n(j),t,0,2);
% %         I(i)=integral(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%         I(i)=quadgk(fun,-1,t-1e-8);
%         I(i)=I(i)+quadgk(fun,t+1e-8,1);
%         Er(i,j)=abs(Q(i)-I(i));
%     end
%     subplot(2,2,j);
%     plot(w,Q,'r-*',w,I,'b-^'),
%     xlabel('w'),ylabel('积分值'),
%     str=strcat('n=',num2str(n(j)));
%     text(28,-0.5,str);legend('Gauss-Laguerre','参考值'); 
% end
% Er

% % exp(x)+sin(2*x),t=0.1
% w=30:45;
% f=@(x)(sin(2*x)+exp(x));
% t=0.1;
% n=[15,20,25,30];
% Q=zeros(length(w),1);
% I=zeros(length(w),1);
% Er=zeros(length(w),length(n));
% for j=1:length(n),
%     for i=1:length(w),
%         fun=@(x)sin(w(i).*x.^2).*f(x)./(x-t);
%         Q(i)=I_Er(fun,f,w(i),n(j),t,0,2);
% %         I(i)=integral(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%         I(i)=quadgk(fun,-1,t-1e-8);
%         I(i)=I(i)+quadgk(fun,t+1e-8,1);
%         Er(i,j)=abs(Q(i)-I(i));
%     end
%     subplot(2,2,j);
%     plot(w,Q,'r-*',w,I,'b-^'),
%     xlabel('w'),ylabel('积分值'),
%     str=strcat('n=',num2str(n(j)));
%     text(32,2.13,str);legend('Gauss-Laguerre','参考值'); 
% end
% Er

% x*sin(x),t=0.13
% w=20:35;
% f=@(x)(x.*sin(x));
% t=0.13;
% n=[5,10,15,20];
% Q=zeros(length(w),1);
% I=zeros(length(w),1);
% Er=zeros(length(w),length(n));
% for j=1:length(n),
%     for i=1:length(w),
%         fun=@(x)sin(w(i).*x.^2).*f(x)./(x-t);%计算虚部，在I_Er函数中要返回虚部
%         Q(i)=I_Er(fun,f,w(i),n(j),t,0,2);
% %         I(i)=integral(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
%         I(i)=quadgk(fun,-1,t-1e-8);
%         I(i)=I(i)+quadgk(fun,t+1e-8,1);
%         Er(i,j)=abs(imag(Q(i))-I(i));
%     end
%     subplot(2,2,j);
%     plot(w,imag(Q),'r-*',w,I,'b-^'),
%     xlabel('w'),ylabel('积分值'),
%     str=strcat('n=',num2str(n(j)));
%     text(23,0.043,str);legend('Gauss-Laguerre','参考值'); 
% end
% format long;
% Er

% % x*sin(x),t=0.13
% w=20:35;
% f=@(x)(x.^2);
% t=0;
% n=[5,10,15,20];
% Q=zeros(length(w),1);
% I=zeros(length(w),1);
% Er=zeros(length(w),length(n));
% for j=1:length(n),
%     for i=1:length(w),
%         fun=@(x)sin(w(i).*x.^2).*f(x)./(x-t);
%         Q(i)=I_Er(fun,f,w(i),n(j),t,0,2);
% %         I(i)=integral(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
% %         I(i)=quadgk(fun,-1,t-1e-8);
% %         I(i)=I(i)+quadgk(fun,t+1e-8,1);
%         I(i)=0;
%         Er(i,j)=abs(Q(i)-I(i));
%     end
%     subplot(2,2,j);
%     plot(w,Q,'r-*',w,I,'b-^'),
%     xlabel('w'),ylabel('积分值'),
%     str=strcat('n=',num2str(n(j)));
%     text(23,0.043,str);legend('Gauss-Laguerre','参考值'); 
% end
% format long;
% Er



% w=[16,20,24,28];
% f=@(x)exp(x);
% t=0;
% n=10:2:24;
% Q=zeros(length(n),1);
% I=zeros(length(n),1);
% for j=1:length(w),
% fun=@(x)sin(w(j).*x.^2).*f(x)./(x-t);
% for i=1:length(n),
%     Q(i)=I_Er(fun,f,w(j),n(i),t,0,2);
% %     I(i)=integral(fun,-1,1,'AbsTol',1e-16,'RelTol',1e-8);
% %     I(i)=quadgk(fun,-1,t-1e-8);
% %     I(i)=I(i)+quadgk(fun,t+1e-8,1);  
%     I(i)=quadgk(fun,-1,t-1e-08);
%     I(i)=I(i)+quadgk(fun,t+1e-8,1);  
% end
% str=strcat('w=',num2str(w(j)));
% subplot(2,2,j),plot(n,Q,'r-*',n,I,'b-^'),legend('Gauss-Laguerre','参考值'),xlabel('n'),ylabel('积分值');
% axis([10,25,0.2,0.4]);
% text(21,0.3,str);
% end
% 



%  plot(n,Er(1,:),'r-*',n,Er(6,:),'b-^',n,Er(11,:),'c-p',n,Er(16,:),'g-o'),...
%      legend('w=20','w=25','w=30','w=35'), xlabel('n'),ylabel('相对误差Er');
% 
% 




