%% Cargar datos

ErrorVelRelSnap = load('ErrorVelRelSnap_out.txt');
ErrorTempRelSnap = load('ErrorTempRelSnap_out.txt');
ErrorPresRelSnap = load('ErrorPresRelSnap_out.txt');
ErrorNusRelSnap = load('ErrorNusRelSnap_out.txt');
autVis = load('AutovaloresVis.txt');
autVel = load('AutovaloresVel.txt');
autTemp = load('AutovaloresTemp.txt');
autTau = load('AutovaloresTau.txt');
autPres = load('AutovaloresPres.txt');

Ramin = 1.e5;
Ramax = 1.e6;

for i=1:101
    vRa(i) = Ramin+(i-1)*(Ramax-Ramin)/(101);
end

r = 1:1:101;

%% Graficas


%autovalores
figure 
plot(r,autVel,r,autTemp,r,autPres,r,autVis,r,autTau)
legend('Eigenvalues Vel','Eigenvalues Temp', 'Eigenvalues Pres', 'Eigenvalues Vis', 'Eigenvalues Tau')

%Errores snapshots

figure
plot(vRa,ErrorVelRelSnap)
title('Velocity relative error')
xlabel('Rayleigh')
legend('$\|u_h - u_r \|^2_{L^2} / \|u_h\|^2_{L^2}$','Interpreter','latex')

figure
plot(vRa,ErrorTempRelSnap)
title('Temperature relative error')
xlabel('Rayleigh')
legend('$\|t_h - t_r \|^2_{L^2} / \|t_h\|^2_{L^2}$','Interpreter','latex')

figure
plot(vRa,ErrorPresRelSnap)
title('Pressure relative error')
xlabel('Rayleigh')
legend('$\|p_h - p_r \|^2_{L^2} / \|p_h\|^2_{L^2}$','Interpreter','latex')

figure
plot(vRa,ErrorNusRelSnap)
xlabel('Rayleigh')
title('Average Nusselt number relative error')
