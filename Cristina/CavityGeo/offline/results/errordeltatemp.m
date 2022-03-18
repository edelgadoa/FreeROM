close all
clc
clear
% Este programa genera una gr?fica donde se compara el estimador de error
% Delta y Tau
deltaname='deltatemp.txt';      % Delta
                            % N?mero de bases totales
 
fileID = fopen(deltaname,'r');
delta = fscanf(fileID,'%f');
fclose(fileID);
N=length(delta);
xdelta=1:N;

errordeltatempfig(xdelta,delta)
