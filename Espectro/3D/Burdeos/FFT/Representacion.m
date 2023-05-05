clear, clc, close

%% Para diferentes mallas
figure()

str = ['EnergyNN',num2str(2^5),'_Forzado.txt'];
spF = load(str); spF=spF';

k = 1:length(spF)-1;
loglog(k,spF(2:end));
hold on

for kk=4:6

str = ['EnergyNN',num2str(2^kk),'.txt'];
sp = load(str); sp=sp';

k = 1:length(sp)-1;
loglog(k,sp(2:end));
end

grid on

k = 1:length(sp)-1;
alpha = -5/3;
spk = sp(2)*k.^alpha;
loglog(k,spk)


% %% Comparativa añadiendo la funcion regular
% figure()
% kk = 4;
% str = ['EnergyNN',num2str(2^kk),'.txt'];
% sp = load(str); sp=sp';
% 
% k = 1:length(sp)-1;
% % axis([1 1e2 1e-5 1e1])
% loglog(k,sp(2:end),'-o')
% hold on
% grid on
% 
% % str = ['EnergyNNp',num2str(2^kk),'.txt'];
% % sp = load(str); sp=sp';
% % k = 1:length(sp)-1;
% % loglog(k,sp(2:end),'-s')
% 
% spk = sp(2)*k.^(-5/3);
% loglog(k,spk)
% 
% % legend('Forzado','Ampliado','Teórico','Location','Best')
% 
% str = ['EnergyNN',num2str(2^kk),'_ConRegular.txt'];
% sp = load(str); sp=sp';
% loglog(k,sp(2:end),'-s')
% str = ['EnergyNN',num2str(2^kk),'_ConRegularSustraida.txt'];
% sp = load(str); sp=sp';
% loglog(k,sp(2:end),'-d')
% legend('Forzado','Teórico','Con F. Regular','Sin F. Regular','Location','Best')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Cavidad 3D
% kk = 6;
% str = ['EnergyNN',num2str(2^kk),'_SinLevantamiento.txt'];
% sp = load(str); sp=sp';
% k = 1:length(sp)-1;
% loglog(k,sp(2:end),'-s')
% hold on
% grid on
% str = ['EnergyNN',num2str(2^kk),'_ConLevantamiento.txt'];
% sp = load(str); sp=sp';
% loglog(k,sp(2:end),'-o')
% spk = k.^(-5/3);
% loglog(k,spk,'LineWidth',2)
% legend('Cavidad. Sin levantamiento','Cavidad. Con levantamiento','Recta k-5/3','Location','Best')
