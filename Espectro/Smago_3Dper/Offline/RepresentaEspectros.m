%% Pintamos los espectros

NN = [34,67,88,96,108,109];
Re = 1000:625:16000;
addpath 'DataCompletePOD'
figure()
hold on
fID = fopen('EspectroFOM.txt','r');
vec = fscanf(fID, '%f');
sp = vec(2:end);
plot(Re,sp,'--','Linewidth',2)
grid on
for i=1:length(NN)
    fID = fopen(['DeltaN_',num2str(NN(i)),'.txt'],'r');
    vec = fscanf(fID, '%f');
    sp = vec(2:end); %El primer valor es el tamaño que no interesa, y el segundo vale cero que no lo pinta
    plot(Re,sp);
end

legend('FOM','N=34','N=67','N=88','N=96','N=108','N=109','location','Best');

figure()
fID = fopen('EspectroFOM.txt','r');
vec = fscanf(fID, '%f');
plot(Re,sp,'--','Linewidth',2)
hold on
for i=2:length(NN)
    fID = fopen(['DeltaN_',num2str(NN(i)),'.txt'],'r');
    vec = fscanf(fID, '%f');
    sp = vec(2:end); %El primer valor es el tamaño que no interesa, y el segundo vale cero que no lo pinta
    plot(Re,sp);
end

grid on
legend('FOM','N=67','N=88','N=96','N=108','N=109','location','Best');