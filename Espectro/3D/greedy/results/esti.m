clear all
close all
clc
estiEF=openfile('estiEF0.txt');
estiBR0=openfile('estiBR0.txt');
estiBR1=openfile('estiBR1.txt');
estiBR2=openfile('estiBR2.txt');
Re=1000:625:16000;
plot(Re,estiEF)
hold on
plot(Re,estiBR0)
plot(Re,estiBR1)
plot(Re,estiBR2)
legend('estiEF','estiBR 0','estiBR 1','estiBR 2')
axis([Re(1),Re(end),0,0.007]);