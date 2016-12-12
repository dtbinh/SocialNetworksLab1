function A = randomize_array(A)

[n,m]=size(A);
for i = 1:n*m
    if A(i) == 1
        A(i) = randi([1 10],1,1);
    end
end
