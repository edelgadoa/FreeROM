close all
clc
clear
% Este programa genera una gr?fica donde se compara el estimador de error
% Delta y Tau
tauname='tau.txt';          % Tau
deltaname='delta.txt';      % Delta
N=28;                            % N?mero de bases totales
Ndelta=28-3;                       % N?mero de bases donde ya podemos aplicar delta
% Hay que mover la l?nea central en la ?ltima linea del c?digo

% Leemos los datos
fileID = fopen(tauname,'r');
tau = fscanf(fileID,'%f');
%tau = tau(2:end);
fclose(fileID);
 
fileID = fopen(deltaname,'r');
delta = fscanf(fileID,'%f');
delta = delta(Ndelta:end);
fclose(fileID);

xtau=1:N;
xdelta=Ndelta:N;

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create semilogy
semilogy(xtau,tau,'DisplayName','max_{\mu \in D}\tau_N(\mu)',...
    'MarkerFaceColor',[0.466666668653488 0.674509823322296 0.18823529779911],...
    'Marker','^',...
    'LineWidth',2,...
    'Color',[0.466666668653488 0.674509823322296 0.18823529779911]);

% Create semilogy
semilogy(xdelta,delta,...
    'DisplayName','max_{\mu \in D}\Delta_N(\mu)',...
    'MarkerFaceColor',[0.494117647409439 0.184313729405403 0.556862771511078],...
    'Marker','^',...
    'LineWidth',2,...
    'Color',[0.494117647409439 0.184313729405403 0.556862771511078]);

% Create xlabel
xlabel('N');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[1 N]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'YMinorTick','on','YScale','log');
% Create legend
legend(axes1,'show');


% Create line
annotation(figure1,'line',[0.129861111111111 0.905555555555556],[0.52 0.52],...
     'LineStyle','--');
