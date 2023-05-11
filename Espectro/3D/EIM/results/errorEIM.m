clear
clc
close all
% Este programa genera una gr?fica donde representa el descenso del error
% en el EIM
errorname='ErrorHistory.txt';

% Leemos los datos
fileID = fopen(errorname,'r');
y = fscanf(fileID,'%f');
y = y(2:end);
y(1)=1;
n=length(y);
fclose(fileID);

%n=length(y);
x=0:n-1;

createfigure(x,y)