fid15 = fopen('Espectro_inicial15_Medio.txt','r');
vec15 = fscanf(fid15, '%f');

fid00 = fopen('Espectro_inicial_Medio.txt','r');
vec00 = fscanf(fid00,'%f');

sp00 = vec00(3:end); %El primer valor es el tamaño que no interesa, y el segundo vale cero que no lo pinta
sp15 = vec15(3:end);
kk = 1:length(sp15);
kk53 = 7e-4*kk.^(-5/3);

%figure()
loglog(kk,kk53);
hold on
loglog(kk,sp00);
loglog(kk,sp15);
grid on