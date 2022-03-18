function time
fileID = fopen(strcat('time','.txt'));
v=fscanf(fileID,'%f');
fclose(fileID);
v=v(2:end);
% for kk=1:length(v)
%     v(kk)=v(kk)*kk^3;
% end
NN=length(v);
kk=1:NN;
meantime=mean(v);

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create semilogy
semilogy(kk,v,'DisplayName','Computational time','Marker','pentagram',...
    'LineWidth',2,...
    'Color',[0 0.447058826684952 0.74117648601532]);

% Create semilogy
semilogy([1,NN],[meantime,meantime],'DisplayName','Mean time','LineWidth',2,...
    'Color',[0.600000023841858 0.200000002980232 0]);

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[1 NN]);
% Set the remaining axes properties
set(axes1,'YMinorTick','on','YScale','log');
% Create legend
legend(axes1,'show');

