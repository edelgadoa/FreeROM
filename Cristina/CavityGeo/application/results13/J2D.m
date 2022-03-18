function J2D
close all
fileID = fopen(strcat('J','.txt'));
v=fscanf(fileID,'%f');
fclose(fileID);
v=v(2:end);
% for kk=1:length(v)
%     v(kk)=v(kk)*kk^3;
% end
NN=length(v);
NN2=sqrt(NN);
Jmatrix=zeros(NN2,NN2);
for k=1:NN2%NN2:NN-NN2
     Jmatrix(k,:)=v((k-1)*NN2+1:k*NN2)*(22+273.15)^2;
end
wmin=2;wmax=4;hmin=2.5;hmax=3;
vw=linspace(wmin,wmax,NN2);
vh=linspace(hmin,hmax,NN2);
[vvh,vvw]=meshgrid(vh,vw);
surf(vvh,vvw,Jmatrix);
xlabel('\sigma')
ylabel('\omega')
c = colorbar;
c.Label.String = 'K';
min(min(Jmatrix))

% 
% kk=linspace(2,4,NN2);
% figure(1)
% xlabel('w');
% hold on