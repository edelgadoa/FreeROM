clear all
clc
close all
vRe=1000:625:16000;
kk=zeros(1,length(vRe));
cont=1;
for Re=vRe
    [kk(cont),k2]=energy(32,1.66667,Re,30);
    cont=cont+1;
end
close all
plot(kk)