function [v]=mat2vec(M)
[m,n]=size(M);
for i=1:m
    for j=1:n
        v(j+n*(i-1))=M(i,j);
    end 
end
%ahora quito los que sean 0
nn=length(v);
for i=nn:-1:1
    if isnan(v(i)) 
        v(i)=[];
    elseif v(i)==0
        v(i)=[];
    end
end