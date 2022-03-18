close all
clc
clear
% Este programa genera una gr?fica donde se compara el estimador de error
% Delta y Tau
deltaname='deltatemp.txt';      % Delta
N=21;                            % N?mero de bases totales
 
fileID = fopen(deltaname,'r');
delta = fscanf(fileID,'%f');
fclose(fileID);
delta
xdelta=1:N;

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create semilogy
semilogy(xdelta,delta,...
    'DisplayName','max_{\mu \in D}\Delta_{\theta,N}(\mu)',...
    'Marker','square',...
    'LineWidth',2,...
    'Color',[0.600000023841858 0.200000002980232 0]);

% Create xlabel
xlabel('N');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[1 N]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'YMinorTick','on','YScale','log');
% Create legend
legend(axes1,'show');

% 
% % Create line
% annotation(figure1,'line',[0.129861111111111 0.905555555555556],[0.52 0.52],...
%     'LineStyle','--');
