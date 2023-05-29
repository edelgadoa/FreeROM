clc
clear
close all
LN = 32;
% lectura
name=strcat('./Espectro_inicial.txt');
% close all
fileID = fopen(name);
v=fscanf(fileID,'%f');
fclose(fileID);


v = v(2:end);
% Best ployfit line wih slope -k/3
alpha = 5/3;
k1 = ceil(LN/4); k2 = floor(LN/2);
%k1 = 12; k2 = 16;

kk = k1:k2; kk = kk';

C = zeros(length(kk),1);
for l=k1:k2
    C(l-k1+1) = v(l)*l^(alpha);
end
cmin = min(C);        cmax = max(C);
iter = 0; dist = zeros(100,1);

figure()
loglog(v,'LineWidth',2)
hold on
for m = cmin:(cmax-cmin)/99:cmax
    iter = iter +1 ;
    vv = m*kk.^(-alpha);
    loglog(kk,vv)
    hold on
    dist(iter) = sum((vv-v(k1:k2)).^2);
end
% plot(dist)
[~,imin] = min(dist);
C = cmin+(cmax-cmin)*(imin-1)/99;

NN=length(v);
kk=0:(NN-1);
vv=kk.^(-alpha)*C;
%v(v<1e-10)=0

v(:,2)=vv;
vv=v(:,1);
v(:,1)=v(:,2);
v(:,2)=vv;
createfigure(kk, v)
% axis([1 6 1e-10 1e-2])
legend(strcat('k^{-5/3}'));
%title(strcat('N=',num2str(LN),', t=' ,num2str(t)))
diferencia=log(v(:,1))-log(v(:,2));
pendiente=abs(diferencia)<1;
[k1,k2]=firstlastone(pendiente);
disp(['k1=',num2str(k1),', k2=',num2str(k2)])
