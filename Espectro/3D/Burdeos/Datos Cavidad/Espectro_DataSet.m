%% Obtención del espectro de la cavidad

A = importdata('liftNN13Reynold3000.txt');
A = A(:,2:end);
imagesc(A);
[nrow,ncol] = size(A);

Cavity = zeros(ncol*nrow,1);
for i=1:ncol
    Cavity((i-1)*nrow+1:i*nrow) = A(:,i);
end

%% Recuperación del 3D
rr = nthroot(length(Cavity),3);