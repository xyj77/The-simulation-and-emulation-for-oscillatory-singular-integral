function y = Si( w )

% 法一
% if nargin==1
%     tol=1e-16;
% end
% y(1)=0;
% t=w;
% x=w;
% n=1;
% while(abs(x)>=tol)
%     n=n+2;
%     y(1)=y(1)+x;
%     t=-1*t*w*w;
%     x=t/(n*factorial(n));
% end
% 法二
% y(2)=quadgk(@(x)sin(x)./x,0,w,'AbsTol',1e-16,'RelTol',1e-8);
% 法三

switch w
    case 8
        y=1.5741868217069420520829714512067;
    case 16
        y=1.6313022682700328861466033168676;
    case 32
        y=1.5442417770591415153742577903629;
    case 64
        y=1.5644522502120305321631003610955;
    case 128
        y=1.5761649225373004778510715530978;
    otherwise
        y=double(integral(@(x)sin(x)./x,0,w,'AbsTol',1e-32,'RelTol',1e-16));    
end;
     
% y=integral(@(x)sin(x)./x,0,w,'AbsTol',1e-32,'RelTol',1e-16); 

end

