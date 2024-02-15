function redescoche

%Datos del problema
nt = 18000;
na = 6; %numero de alphas calculados
alpha_min = 0.12018;
alpha_max = 0.199713;
nalpha = 100; %numero de alphas a interpolar
nrandom = 10000; %numero de puntos aleatorios para verificar la red

filename = "CoefficientData"+num2str(na)+".xlsx";

[X,Y]=creacion(nt,na);
X=X'; Y=Y(:,3:4)';

alphas = linspace(alpha_min, alpha_max, nalpha);
X_Data = [];
for k=1:nalpha
    X_aux = [X(1, 1:1000:nt); ones(1, nt/1000)*alphas(k)];
    X_Data = [X_Data X_aux];
end

net = fitnet([20, 30, 20]);

% view(net);
[net, entre] = train(net,X,Y); 
testX = X(:,entre.testInd); 
Real_testY = Y(:,entre.testInd); 
Pred_testY = net(testX); 
perf_Xtest = mse(net,Real_testY, Pred_testY)

% Para comprobar que la red es aceptable
rand_points = randi(nt*na,nrandom,1);
X_test = X(:,rand_points);
Y_test = Y(:,rand_points); 
Pred_test = net(X_test); 
perf_Random = mse(net, Y_test, Pred_test)
plotregression(Y_test(1,:),Pred_test(1,:))

%Calculo la media de los coeficientes para los datos deseados
Pred_Y = net(X_Data);
T=table(X_Data(1,:)',X_Data(2,:)',Pred_Y(1,:)',Pred_Y(2,:)');
T.Properties.VariableNames={'Time','Angle','Mean Drag','Mean Lift'};
writetable(T,filename,'Sheet',1,'Range','A1')

