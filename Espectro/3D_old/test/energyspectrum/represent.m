clear, clc, close

%% Para diferentes mallas
figure()


str = 'EnergyNN8.txt';
spF = load(str); spF=spF';

k = 1:length(spF)-1;
loglog(k,spF(2:end));
hold on

% for kk=4:6
% 
% str = ['EnergyNN',num2str(2^kk),'.txt'];
% sp = load(str); sp=sp';
% 
% k = 1:length(sp)-1;
% loglog(k,sp(2:end));
% end

grid on

alpha = -5/3;
spk = spF(2)*k.^alpha;
loglog(k,spk)

