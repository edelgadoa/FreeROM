function estimateconf(NN)
close all
fileID = fopen(strcat('exactNN',num2str(NN),'Reynold10000.txt'));
v=fscanf(fileID,'%f');
fclose(fileID);
fileID = fopen(strcat('approxuNN',num2str(NN),'Reynold10000.txt'));
v2=fscanf(fileID,'%f');
fclose(fileID);
fileID = fopen(strcat('approxspectrumNN',num2str(NN),'Reynold10000.txt'));
v4=fscanf(fileID,'%f');
fclose(fileID);
v=v(2:end);
v2=v2(2:end);
v4=v4(2:end);
figure(1)
plot(v)
hold on
plot(v2)
plot(v4)
legend('exact','approxu','approxuspectrum');
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

