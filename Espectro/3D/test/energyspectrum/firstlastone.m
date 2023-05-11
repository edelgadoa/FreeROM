function [n,m]=firstlastone(v)
i=0;
n=0;
LN=floor(length(v)*sqrt(2));
m=LN/2;
while(v(i+1)==0)
    n=i+1;
    i=i+1;
end
i=length(v)-1;
while(v(i+1)==0)
    m=i-1;
    i=i-1;
end
