function grafica(nombre,indice)
hmin=2.5;wmin=2;
hmax=3;wmax=4;
fileID = fopen(strcat(nombre,num2str(indice),'.txt'));
formatSpec = '%f';
n=fscanf(fileID,formatSpec);
nbases=sqrt(n(1));
h=linspace(hmin,hmax,nbases);
w=linspace(wmin,wmax,nbases);
n=n(2:end);
data=zeros(nbases,nbases);
for k=0:nbases-1
    data(:,k+1)=n(k*25+1:(k+1)*25);
end
createfigure(h,data);
title(strcat('w=',num2str(w(indice+1))));
end