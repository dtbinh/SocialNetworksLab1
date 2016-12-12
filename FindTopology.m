function [adjacencyMatrix, nodeDegree]=FindTopology(coordinateMatrix,N,R)
%FINDTOPOLOGY the adjacency matrix and nodegree distribution
%adjacencyMatrix is the matrix representation of the
%network graph
%N is the cardinality of the network's node set

if (nargin~=3)
    adjacencyMatrix=-1;                         %if number of arguments mistaken --> return error code
end

for k=1:N
    nodeDegree(k)=0;    %matrix with the node degree of each node
end

distancePairs=pdist(coordinateMatrix);      %distances between all possible pairs of nodes
nodeDistances=squareform(distancePairs);    %distances between nodes in square form matrix

for k=1:N
    for n=1:N
        if (nodeDistances(k,n)<=R)          %when a node is in transmission range,it's a neighbor
            adjacencyMatrix(k,n)=1;         %build the adjacency matrix
            nodeDegree(k)=nodeDegree(k)+1;  %increase the number of neighbors
        else
            adjacencyMatrix(k,n)=0;         %otherwise it's not a neighbor
        end
    end
    nodeDegree(k)=nodeDegree(k)-1;          %exclude the node itself,included in the adjacencyMatrix diagonal
end