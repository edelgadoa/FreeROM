%% Comparativa bases de fourier

kmax = 64;
NN = 64;
x = linspace(-0.5, 0.5, NN+1);


f = @(x,k) exp(-1i*2*pi*x*k/(NN+1));

for k = kmax-5:kmax
    wk = exp(-1i*2*pi/(NN+1));
    figure()
    title(['k=',num2str(k)])
    subplot(1,2,1)
    plot(x,real(f(x,k)))
    hold on 
    plot(x,real(wk.^(k*x)),'*')
    subplot(1,2,2)
    plot(x,imag(f(x,k)))
    hold on 
    plot(x,imag(wk.^(k*x)),'*')

end