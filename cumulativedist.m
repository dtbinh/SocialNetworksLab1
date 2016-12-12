%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TITLE:     Cumulative Distribution Function 
%AUTHOR:    Eleni Stai
%DATE:      3/7/2010
%VERSION:   1.0
%DATE:      3/7/2010
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nodeDegree: vector with node degree values, nodeDegree(i) is the degree of
%node i
%N: number of nodes in the network

function [supremum,cumdist,dist]=cumulativedist(nodeDegree,N)

supremum=max(nodeDegree);

for i=1:supremum
    cumdist(i)=0;
    dist(i)=0;
end

m=1;
for k=1:1:supremum
    for i=1:N
        if nodeDegree(i)==k
            dist(m)=dist(m)+1;
            
        end
    end
    m=m+1;
end



m=1;
for k=1:1:supremum
    for i=1:N
        if nodeDegree(i)<=k
            cumdist(m)=cumdist(m)+1;
            
        end
    end
    m=m+1;
end

cumdist=cumdist/N;

