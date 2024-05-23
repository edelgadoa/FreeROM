% Comparamos para un alpha conocido los valores obtenidos
nt = 18000;
na=5;
nrandom = 10000; %numero de puntos aleatorios para verificar la red
X=X'; Y=Y(:,3:4)';

rand_points = randi(nt*na,nrandom,1);
X_test = X(:,rand_points);
Y_test = Y(:,rand_points); 
Pred_test = net(X_test); 
perf_Random = mse(net, Y_test, Pred_test)
plotregression(Y_test(1,:),Pred_test(1,:))



alpha_test = 0.133435;
C1 = load("c1_"+num2str(alpha_test,6)+".txt")'; 
C2 = load("c2_"+num2str(alpha_test,6)+".txt")';
for j=1:nt
    C1mean(j) = mean(C1(1:j));
    C2mean(j) = mean(C2(1:j));
end


X_known = [linspace(1,10,nt); ones(1,nt)*alpha_test];
Y_known = net(X_known);


figure(10)
sgtitle("alpha = "+alpha_test)
subplot(2,1,1)
title("Computed values")

plot(X_known(1,:),C1mean,X_known(1,:),C2mean);
legend('Mean Drag','Mean Lift')

subplot(2,1,2)
title("Predicted values")
plot(X_known(1,:),Y_known(1,:),X_known(1,:),Y_known(2,:))
legend('Mean Drag','Mean Lift')

Error_C1 = mse(net, C1mean, Y_known(1,:));% norm(Y_known(1,:)-C1mean);
Error_C2 = mse(net, C2mean, Y_known(2,:));%norm(Y_known(2,:)-C2mean);

fprintf("Error for alpha = %7.6f in Drag: %6.5f\n", alpha_test, Error_C1)
fprintf("Error for alpha = %7.6f in Lift: %6.5f\n", alpha_test, Error_C2)