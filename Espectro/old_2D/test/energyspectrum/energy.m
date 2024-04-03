function [k1,k2]=energy(LN,alpha,Re,t)
close all
% lectura
if(t==0)
    name=strcat('./energykNSNN',num2str(LN),'alpha',num2str(alpha,6),'t0.txt');
else
    name=strcat('./energykNSNN',num2str(LN),'Reynold',num2str(Re),'alpha',num2str(alpha,6),'t',num2str(t),'.txt');
end
fileID = fopen(name);
v=fscanf(fileID,'%f');
fclose(fileID);
v=v(2:end);

NN=length(v);
kk=0:(NN-1);
if(t==0)
    alpha=3;
    k=2;
else
    alpha=5/3;
    k=LN/2;
end
C=v(k)/(k-1)^(-alpha);
vv=kk.^(-alpha)*C;

v(:,2)=vv;
createfigure(kk, v)
legend('Aprox',strcat('k^{-',num2str(alpha),'}'));
title(strcat('LN=',num2str(LN),' t=' ,num2str(t)))
if(t~=0)
    diferencia=log(v(:,1))-log(v(:,2));
    pendiente=abs(diferencia)<1;
      [k1,k2]=firstlastone(pendiente);
    disp(['k1=',num2str(k1),', k2=',num2str(k2)])
end