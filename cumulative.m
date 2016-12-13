function [cumData, dataU] = cumulative(data)

    dataU = unique(data);
    data = sort(data);
    n = length(data);
    nU = length(dataU);
    cumData = zeros(nU,1);
    
    m = 1;
    for i = 1:n
        if data(i) ~= dataU(m)
            m = m+1;
        end
        cumData(m) = cumData(m)+1;
    end
    
    for i = 2:nU
        cumData(i) = cumData(i-1) + cumData(i);
    end
   
    cumData = cumData/n;
    
end
