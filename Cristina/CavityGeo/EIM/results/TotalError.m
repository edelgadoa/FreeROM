clear
clc
close all
% Este programa genera una gr?fica donde representa el descenso del error
% en el EIM
errorname='TotalError.txt';

% Leemos los datos
fileID = fopen(errorname,'r');
y = fscanf(fileID,'%f');
y = y(2:end);
fclose(fileID);
max(y)
NN=length(y);
NN2=sqrt(NN);
errormatrix=zeros(NN2,NN2);
for k=1:NN2%NN2:NN-NN2
     errormatrix(k,:)=y((k-1)*NN2+1:k*NN2);
end
wmin=2;wmax=4;hmin=2.5;hmax=3;
vw=linspace(wmin,wmax,NN2);
vh=linspace(hmin,hmax,NN2);
createfigure(vw,vh,errormatrix)

% cd 
% %n=length(y);
% x=2:n+1;
% 
% % Create figure
% figure1 = figure;
% 
% % Create axes
% axes1 = axes('Parent',figure1);
% hold(axes1,'on');
% y(end)
% % Create semilogy
% semilogy(x,y,'DisplayName','max_{\mu\in D}|g(\mu)-I_M[g(\mu)]|_{\infty}',...
%     'MarkerFaceColor',[0.494117647409439 0.184313729405403 0.556862771511078],...
%     'Marker','^',...
%     'LineWidth',2,...
%     'Color',[0.494117647409439 0.184313729405403 0.556862771511078]);
% 
% 
% % Create xlabel
% xlabel('M');
% % xlim(axes1,[1 n+1]);
% box(axes1,'on');
% % Set the remaining axes properties
% set(axes1,'YMinorTick','on','YScale','log');
% % Create legend
% legend1 = legend(axes1,'show');
% set(legend1,'FontSize',10);
% 
% 
