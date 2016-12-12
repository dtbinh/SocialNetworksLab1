function components=FindComponents(adjacencyMatrix,N)
%FINDCOMPONENTS computes the number of connected 
%components of a network graph
%adjacencyMatrix is the matrix representation of the
%network graph
%N is the cardinality of the network's node set

if (nargin~=2)
    components=-1;                         %if number of arguments mistaken --> return error code
end

components=0;                              %number of components is initially zero
    for k=1:N   
        nodeVisited(k)=0;                  %initialize array indicating if a node is visited
        nodeStack(k)=0;                    %initialize the node stack
    end
    m=1;
    nodeVisited(m)=1;                       %start with node 1
    while (min(nodeVisited)==0)             %if not all nodes scanned, do the following
        nodeVisited(m)=1;                   %node 1 is visited
        for n=(m+1):N
            if adjacencyMatrix(m,n)==1      %begin with the neighbors of node 1
                nodeVisited(n)=1;           %mark them as visited
                nodeStack(n)=1;             %push them in the stack the neighbors
            end
        end
        while (max(nodeStack)==1)           %while the stack not empty
            k=1;                            %initialize counter to the beginning of the stack
            while (nodeStack(k)==0)         %find the first not visited element in the stack
                k=k+1;
            end
            nodeStack(k)=0;                 %pop it out of the stack
            for n=1:N
                if (adjacencyMatrix(k,n)==1)%scan its adjacency list
                    if (nodeVisited(n)==0)  %mark its neighbors as visited if not already
                        nodeVisited(n)=1;
                        nodeStack(n)=1;     %push its neighbors in the stack
                    end
                end
            end
        end
        components=components+1;            %this component was scanned and the counter increases by one
        b=1;
        m=1;
        while (b<N)                         %start a new component scan
            b=b+1;                          %find sequentially the first node  not visited
            if (nodeVisited(b)==0)
                m=b;                        %its id will be used for the new component scan
                b=N;                        %stop the search for not-visited
            end
        end
    end