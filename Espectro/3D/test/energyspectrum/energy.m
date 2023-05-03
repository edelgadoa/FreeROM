function [k1,k2]=energy(LN,alpha,Re,t)

% lectura
if nargin < 4
    t = 0;
    name=strcat('./energykSmagoNN',num2str(LN),'Reynold',num2str(Re),'alpha',num2str(alpha,6),'ic.txt');
else
    if(t==0)
        name=strcat('./energykSmagoNN',num2str(LN),'Reynold',num2str(Re),'alpha',num2str(alpha,6),'ic.txt');
    else
        name=strcat('./energykSmagoNN',num2str(LN),'Reynold',num2str(Re),'alpha',num2str(alpha,6),'t',num2str(t),'.txt');
    end
end
% close all
fileID = fopen(name);
v=fscanf(fileID,'%f');
fclose(fileID);
v=v(2:end);

NN=length(v);
kk=0:(NN-1);
if(t==0)
    alpha=5/3;
    k=2;
else
    alpha=5/3;
    k=LN/2;
end
C=v(k)/(k-1)^(-alpha);
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
if(t~=0)
    diferencia=log(v(:,1))-log(v(:,2));
    pendiente=abs(diferencia)<1;
      [k1,k2]=firstlastone(pendiente);
    disp(['k1=',num2str(k1),', k2=',num2str(k2)])
end