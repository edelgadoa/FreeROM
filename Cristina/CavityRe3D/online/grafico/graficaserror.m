clc
clear
% close all
caso=3;
if(caso==0)fileID = fopen(strcat('estimador','.txt'));end
if(caso==1)fileID = fopen(strcat('errorT','.txt'));end
if(caso==2)fileID = fopen(strcat('errorH1temp','.txt'));end
if(caso==3)fileID = fopen(strcat('estimadortemp','.txt'));end

v=fscanf(fileID,'%f');
v=v(3:end);
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
createfigure(vw,vh,errormatrix,caso)
