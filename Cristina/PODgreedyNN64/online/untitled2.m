clc
clear
close all
LN=32;alpha=1.66667;t=30;N=102;

for Re=1000:5000/8:16000
    compare(LN,alpha,Re,t,N)
    title(strcat('Re=',num2str(Re)))
    pause
end