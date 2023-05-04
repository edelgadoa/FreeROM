clear all
close all
clc

estiEF=openfile('../../online/errores/estiEFN175.txt');
estiBR=zeros(length(estiEF),10);
for i=0:19
    v=openfile(strcat('estiBR',num2str(i),'.txt'));
    estiBR(:,i+1)=v;
end
Re=8000:125:13000;

for i=0:19
    plot(Re,estiEF,Re,estiBR(:,i+1))
    title(num2str(i))
    pause
    v=estiEF-estiBR(:,i+1);
    v=abs(v);
    e(i+1)=max(v);
end
 plot(e)
