%% Representación de la energía en matlab
% matlabrun -nodesktop -r RepresentacionEnergia
clear, clc, close all

%% Lectura de datos
Re = 200;
tol = 4;
% Datos POD
errorPOD = openfile(['ErrorPOD_Re_',num2str(Re),'_PODtol_',num2str(tol),'.txt']);
errorPOD = errorPOD(1:end-1);
% Datos PEN
errorPEN = openfile(['ErrorPEN_Re_',num2str(Re),'_PODtol_',num2str(tol),'.txt']);
errorPEN = errorPEN(1:end-1);
% Datos FIL
for i=1:4
    errorFIL(i,:) = openfile(['ErrorFIL_',num2str(i),'_Re_',num2str(Re),'_PODtol_',num2str(tol),'.txt']);
end
errorFIL = errorFIL(:,1:end-1);

% Datos temporales
t0 = 7;
dt = 2.e-3;
tF = 8;

t = (t0+dt):dt:tF;
nt = length(t);

% Representación
figure()
hold on
plot(t,errorPOD(1:nt));
plot(t,errorPEN(1:nt));
for i=1:4
    plot(t,errorFIL(i,1:nt));
end
grid on

legend('POD','PEN','FIL 1','FIL 2','FIL 3','FIL 4');