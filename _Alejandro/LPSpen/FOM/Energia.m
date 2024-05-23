%% Figura

% Lectura archivo

name=strcat('../Snapshots/Energy_Re_200.txt');
% close all
fileID = fopen(name);
v=fscanf(fileID,'%f');
fclose(fileID);

v = v(2:end);
tf = 7;
t0 = 0;
dt = 2e-3;
t = dt:dt:tf;

plot(t,v)