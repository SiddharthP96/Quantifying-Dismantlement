%function to compute the measure how dismantled a network is.
%Assuming the given list of nodes L, when removed, gives us a dismantled network.
%Original network has adjacency matrix A.

function [F] = main(A,L)
N=length(A);
%expected number of nodes for the network to become disconnected.
n=length(L);
A=delnode(A,L);
con=dismantle(A);
c=max(con);
m=c;
sizes=zeros(c,1);
for i=1:length(A)
    for j=1:c
        if con(i)==j
            sizes(con(i),1) = sizes(con(i),1)+1;
        end
    end
end
sizes
k=1/sqrt(N);
sigma=var(sizes);
sigmax = (N-m)^(2)*(m-1)/(m)^(2);
F=m^(k)*(2*sigmax-sigma)/(2*sigmax);
%correct the 100* in the above equation.
state=sprintf('Cost(%i,%f)=%f',c,sigma,100*F);
disp(state);
disp(n);
end
