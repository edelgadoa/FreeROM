clear
clc
close all
% Este programa genera una gr?fica donde representa el descenso del error
% en el EIM
errorname='TotalError.txt';

% Leemos los datos
fileID = fopen(errorname,'r');
y = fscanf(fileID,'%f');
y = y(2:end);
x=1000:625:16000;

nEF=length(y)/length(x);
i1=1;i2=nEF;
for i=1:length(x)
    Y(i,:)=y(i1:i2);
    i1=i1+nEF;i2=i2+nEF;
end
fclose(fileID);
max(y)
createfigureTotal(x, Y)
axis([1000,16000,1e-10,1e-1])
