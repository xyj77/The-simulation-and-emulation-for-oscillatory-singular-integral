function  y=Laguerre( n )
L=zeros(n+1);
digits(64);
switch n
    case 0
        L(1,:)=1;
    otherwise
        L(1,:)=[zeros(1,n), 1];
        L(2,:)=[zeros(1, n-1), -1, 1];
        for i=3:n+1
            A1 = vpa(1/(i-1) * (conv([zeros(1, n-1), -1, (2*(i-1)-1)], L(i-1,:))));
            A2 = vpa(1/(i-1) * (conv([zeros(1, n), ((i-1)-1)], L(i-2,:))));
            B1=A1(length(A1)-n:1:length(A1));
            B2=A2(length(A2)-n:1:length(A2));
            L(i,:)=B1-B2;
        end;
end;
y=L(n+1,:);
end

