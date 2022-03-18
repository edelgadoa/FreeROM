clc
clear
% close all
it=27;
fname=strcat('delta',num2str(it),'.txt');
fileID = fopen(fname);

v=fscanf(fileID,'%f');
v=v(2:end);
min(v)
NN=length(v);
NN2=sqrt(NN);
errormatrix=zeros(NN2,NN2);
for k=1:NN2%NN2:NN-NN2
     errormatrix(k,:)=v((k-1)*NN2+1:k*NN2);
end
wmin=2;wmax=4;hmin=2.5;hmax=3;
vw=linspace(wmin,wmax,NN2);
vh=linspace(hmin,hmax,NN2);
% [vvh,vvw]=meshgrid(vh,vw);
% surf(vvh,vvw,errormatrix);
createfigure3D(vw,vh,errormatrix,it)
saveas(gcf,strcat('greedy',num2str(it+1)),'epsc')
