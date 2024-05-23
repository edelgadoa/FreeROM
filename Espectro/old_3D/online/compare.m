function compare(LN,alpha,Re,t,N)
nameBR=strcat('energyspectrumN',num2str(N),'/energykSmagoNN',num2str(LN),'Reynold',num2str(Re),'alpha',num2str(alpha,6),'t',num2str(t),'.txt');
nameEF=strcat('energyspectrumEF/energykSmagoNN',num2str(LN),'Reynold',num2str(Re),'alpha',num2str(alpha,6),'t',num2str(t),'.txt');
vBR=openfile(nameBR);
vEF=openfile(nameEF);

NN=length(vBR);
kk=0:(NN-1);

createfigure(kk, [vBR,vEF])
err=norm(vBR-vEF)/norm(vEF)