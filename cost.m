function [x] = cost(L)
    N=sum(L);
    si=length(L);
    x=0;
    for i=1:si-1
        for j=i+1:si
            x=x+L(i)*L(j);
        end
    end
    x=2*x/(N*(N-1));
end
