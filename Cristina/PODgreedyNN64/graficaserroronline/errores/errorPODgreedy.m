clear
clc
close all
NN=[30,72,98];
op=1;
if(op==1)
    name='deltaSmagoNN64N';
elseif(op==2)
    name='estiBRN';
end
Re=1000:625:16000;
for i=1:length(NN)
    v(:,i)=openfile(strcat(name,num2str(NN(i)),'.txt'));
end
if(op==2)
    name='estiEFN';
    i=length(NN)+1;
    v(:,i)=openfile(strcat(name,num2str(NN(i-1)),'.txt'));
end
createfigure(Re,v)
if(op==1)
    legend('\epsilon_{30}(\mu)','\epsilon_{72}(\mu)','\epsilon_{98}(\mu)','Location','northwest');
elseif(op==2)
    legend('\Delta_{30}(\mu)','\Delta_{72}(\mu)','\Delta_{98}(\mu)','\Delta_h(\mu)','Location','northwest');
end