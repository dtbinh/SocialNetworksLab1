%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TITLE:     Cumulative Distribution Function 
%AUTHOR:    Eleni Stai
%DATE:      3/7/2010
%VERSION:   1.0
%DATE:      3/7/2010
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nodeDegree: vector with centrality values
%N: number of nodes in the network

function [supremum,cumdist]=cumulativecentrality(nodeDegree,N)


supremum=max(abs(nodeDegree));
m=1;
for k=0:supremum/100:supremum
    cumdist(m)=0;
    m=m+1;
end

m=1;
for k=0:supremum/100:supremum
    for i=1:N
        if abs(nodeDegree(i))<=k
            cumdist(m)=cumdist(m)+1;
            
        end
    end
    m=m+1;
end

cumdist=cumdist/N;
