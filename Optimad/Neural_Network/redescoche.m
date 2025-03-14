function [net,X_Data,Pred_Y] = redescoche

%Datos del problema
nt = 18000;
na = 5; %numero de alphas calculados
alpha_min = 0.12018;
alpha_max = 0.239479;
nalpha = 100; %numero de alphas a interpolar
nrandom = 10000; %numero de puntos aleatorios para verificar la red
alpha_test = 0.133435;
C1 = load("c1_"+num2str(alpha_test,6)+".txt")'; 
C2 = load("c2_"+num2str(alpha_test,6)+".txt")';
for j=1:nt
    C1mean(j) = mean(C1(1:j));
    C2mean(j) = mean(C2(1:j));
end

filename = "CoefficientData"+num2str(na)+".xlsx";

[X,Y]=creacion(nt,na);
X=X'; Y=Y(:,3:4)';

alphas = linspace(alpha_min, alpha_max, nalpha);

X_Data = [];
for k=1:nalpha
    X_aux = [X(1, [1:1000:nt, nt]); ones(1, nt/1000+1)*alphas(k)];
    X_Data = [X_Data X_aux];
end

%net = fitnet([20 30 20]);
% view(net);
%[net, entre] = train(net,X,Y); 
%testX = X(:,entre.testInd); 
%Real_testY = Y(:,entre.testInd); 
%Pred_testY = net(testX); 
%perf_Xtest = mse(net,Real_testY, Pred_testY)

% Para comprobar que la red es aceptable
rand_points = randi(nt*na,nrandom,1);
X_test = X(:,rand_points);
Y_test = Y(:,rand_points); 
Pred_test = net(X_test); 
perf_Random = mse(net, Y_test, Pred_test)
%plotregression(Y_test(1,:),Pred_test(1,:))

% Comparamos para un alpha conocido los valores obtenidos
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


%Calculo la prediccion de los coeficientes para los datos deseados
Pred_Y = net(X_Data);
T=table(X_Data(1,:)',X_Data(2,:)',Pred_Y(1,:)',Pred_Y(2,:)');
T.Properties.VariableNames={'Time','Angle','Mean Drag','Mean Lift'};
writetable(T,filename,'Sheet',1,'Range','A1')

