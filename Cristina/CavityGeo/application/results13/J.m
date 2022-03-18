function J
fileID = fopen(strcat('J','.txt'));
v=fscanf(fileID,'%f');
fclose(fileID);
v=v(2:end);
% for kk=1:length(v)
%     v(kk)=v(kk)*kk^3;
% end
NN=length(v);
NN2=sqrt(NN);
kk=linspace(2,4,NN2);
figure(1)
xlabel('w');
hold on
for k=1:NN2:NN-NN2
    plot(kk,v(k:k+NN2-1));
end