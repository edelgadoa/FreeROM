%% Representación de la energía en matlab
% matlabrun -nodesktop -r RepresentacionEnergia
clear, clc, close all

%% Lectura de datos
Re = 200;
tol = 4;
% Datos POD
errortol4 = openfile(['ErrorProyeccion_Re_',num2str(Re),'_PODtol_',num2str(tol),'.txt']);
errortol4 = errortol4(1:end-1);
% Datos PEN
tol = 8;
errortol8 = openfile(['ErrorProyeccion_Re_',num2str(Re),'_PODtol_',num2str(tol),'.txt']);
errortol8 = errortol8(1:end-1);

% Datos temporales
t0 = 6.5;
dt = 2.e-3;
tF = 7;

t = (t0+dt):dt:tF;
nt = length(t);

% Representación
figure()
semilogy(t,errortol4(1:nt));
hold on
semilogy(t,errortol8(1:nt));
grid on

legend('tol4','tol8');

%%%%%%%%%
errorProy = openfile(['ErrorFinal_Re_',num2str(Re),'.txt']);
errorProy = errorProy(1:end-1);
figure()
semilogy(1:length(errorProy),errorProy);
grid on