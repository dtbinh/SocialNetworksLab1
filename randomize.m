function randomInt=randomize()
%RANDOMIZE returns a unique integer
%the unique integer is the sum of the 
%partial components of the system clock

if (nargin~=0)
    newmat=0;
end
value=fix(clock);
[M N]=size(value);    %find the size of the matrix
randomInt=0;
for k=1:N
    randomInt=randomInt+value(k);
end

