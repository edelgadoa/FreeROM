clear
clc
close all
% Este programa genera una gr?fica donde representa el descenso del error
% en el EIM
errorname='ErrorHistory.txt';

% Leemos los datos
fileID = fopen(errorname,'r');
y = fscanf(fileID,'%f');
y = y(2:end-1);
fclose(fileID);

n=length(y);
x=1:n;

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create semilogy
semilogy(x,y,'DisplayName','max_{\mu\in D}|g(\mu)-I_M[g(\mu)]|_{\infty}',...
    'Marker','square',...
    'LineWidth',2,...
    'Color',[0 0 0]);


% Create xlabel
xlabel('M');
xlim(axes1,[1 n]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'YMinorTick','on','YScale','log');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'FontSize',10);

