function estimateconf(NN)
close all
fileID = fopen(strcat('lefttermNN',num2str(NN),'Reynold10000.txt'));
fileID2 = fopen(strcat('righttermNN',num2str(NN),'Reynold10000.txt'));
v=fscanf(fileID,'%f');
v2=fscanf(fileID2,'%f');
fclose(fileID);
fclose(fileID2);
v=v(2:end);
v2=v2(2:end);
dt=1./32*10;%40-39.6875;
tt=dt:dt:30;
figure(1)
plot(tt,v)
hold on
plot(tt,v2)
legend('left','right')
%plot(v3)
% 
% fileID = fopen(strcat('term7NN',num2str(NN),'Reynold10000.txt'));
% v=fscanf(fileID,'%f');
% fclose(fileID);
% v=v(2:end);
% dt=1./32*20;
% epsilon=-(v(2:end)-v(1:end-1))./dt;
% epsilon=abs(epsilon);
% nu=1./10000;
% t0=(nu./epsilon).^(1/2)
% figure(2)
% plot(t0)
% mean(t0)
% % Calculo de eps=-dk/dt con k energia cinetica, es decir, term1

