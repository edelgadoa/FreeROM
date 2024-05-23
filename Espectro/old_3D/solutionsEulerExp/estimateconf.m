function estimateconf(NN)
close all
fileID = fopen('totalu.txt');
fileID2 = fopen('totaluhat.txt');
v=fscanf(fileID,'%f');
v2=fscanf(fileID2,'%f');
fclose(fileID);
fclose(fileID2);
v=v(2:end);
v2=v2(2:end);
% tt=1.6:1.6:200;
% fileID = fopen(strcat('totalenergyofvhatNS',num2str(LN),'.txt'));
% vhat=fscanf(fileID,'%f');
% fclose(fileID);
% vhat=vhat(2:end);
figure(1)
plot(v)
hold on
pause
plot(v2)
v2-v
