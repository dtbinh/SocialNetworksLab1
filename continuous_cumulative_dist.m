function continuous_cumulative_dist(data,N)
data=sort(data);
dsum = sum(data);
normalized_data = data/dsum;
for i = 1:length(data)
    y(i) = length(normalized_data(1:i))/N;
    x(i) = data(i);
end
plot(x,y);
end