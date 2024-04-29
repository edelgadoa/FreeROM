
fileID = fopen('AutovalVConv_200.txt');
v=fscanf(fileID,'%f');
fclose(fileID);
v=v(2:end);

v = v(end:-1:1);
w = cumsum(v)/sum(v);

plot(w)

tol = 0.999;
info = 0 ;
N = 0;

while info<tol
    N=N+1;
    info = info + v(N)/sum(v);
end

disp(N)

% tol 0.60 -> 2
% tol 0.75 -> 3
% tol 0.85 -> 3
% tol 0.90 -> 4
% tol 0.95 -> 5
% tol 0.99 -> 8
% tol 0.999 -> 12