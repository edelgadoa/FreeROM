f = @(x) (pi-x).*(pi+x);
% f = @(x) exp(-x.^2);
med = integral(f,-pi,pi)/(2*pi);
g = @(x,k) exp(-1i*k*x);

M = 6;
a = zeros(1,2^M+1);
for jj = 0:2^M
    g = @(x) exp(-1i*jj*x);
    a(jj+1) = integral(@(x) (f(x)-med).*g(x),-pi,pi,'RelTol',1e-12)/(2*pi);
end

N = 10;
x3 = linspace(-pi,pi,2^5);
x4 = linspace(-pi,pi,2^6);
x5 = linspace(-pi,pi,2^N);

k3 = fft(f(x3)-med)/2^5;
k4 = fft(f(x4)-med)/2^6;
k5 = fft(f(x5)-med)/2^N;

figure()
plot(0:2^5-1,abs(k3))
hold on
plot(0:2^6-1,abs(k4))
plot(0:2^N-1,abs(k5),'LineWidth',2)
plot(0:2^M,abs(a),'LineWidth',2)
xlim([0 32])
% 
% % f1 = ifft(k3(1:end));
% % f2 = ifft(k4(1:2^4));
% % f3 = ifft(k5(1:2^4));
% % f3 = ifft(k5(1:2^4));
% % 
% % figure()
% % plot(x,f(x));
% % hold on 
% % plot(x3,f1+med3);
% % plot(x3,f2+med4);
% % plot(x3,f3+med5);
% % 
% % legend('Perfil parabólico','N = 16','N = 32','N = 64','Location','Best');