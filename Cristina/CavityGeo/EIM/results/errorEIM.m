clear
clc
close all
% Este programa genera una gr?fica donde representa el descenso del error
% en el EIM
errorname='ErrorHistory.txt';

% Leemos los datos
fileID = fopen(errorname,'r');
y = fscanf(fileID,'%f');
y = y(2:end);
y(1)=1;
n=length(y);
fclose(fileID);

%n=length(y);
x=0:n-1;

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
y(end)
% Create semilogy
semilogy(x,y,'DisplayName','max_{\mu\in D}|g(\mu)-I_M[g(\mu)]|_{\infty}/|g(\mu)|_{\infty}',...
    'MarkerFaceColor',[0.494117647409439 0.184313729405403 0.556862771511078],...
    'Marker','^',...
    'LineWidth',2,...
    'Color',[0.494117647409439 0.184313729405403 0.556862771511078]);


% Create xlabel
xlabel('M');
% xlim(axes1,[1 n+1]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'YMinorTick','on','YScale','log');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'FontSize',10);
annotation(figure1,'line',[0.130555555555556 0.904166666666667],...
    [0.27212020033389 0.27212020033389],'LineWidth',1,'LineStyle','--');
axis([x(1),x(end),1e-5,1])
grid on

