%按照递推公式求出Tk--chebyshev多项式基
function tk = T(m)
if m==0 
    tk = 1;
elseif m==1
    tk = [1 0]';
else   
    tkm2 = zeros(m+1,1);
    tkm2(m+1) = 1;
    tkm1 = zeros(m+1,1);
    tkm1(m) = 1;
    for k=2:m
        tk = zeros(m+1,1);
        for e=m-k+1:2:m
            tk(e) = 2*tkm1(e+1) - tkm2(e);
        end
        if mod(k,2)==0
            tk(m+1) = (-1)^(k/2);
        end
        if k<m
            tkm2 = tkm1;
            tkm1 = tk;
        end
    end
end

