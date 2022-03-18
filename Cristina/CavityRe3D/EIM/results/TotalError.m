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
fclose(fileID);
max(y)
x=1000:25:5000;
createfigureTotal(x, y)
axis([1000,5000,1e-11,1e-3])
