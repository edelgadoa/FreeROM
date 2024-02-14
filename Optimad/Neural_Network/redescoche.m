function redescoche
[X,Y]=creacion(18000,3);
X=X'; Y=Y(:,3:4)';
net = fitnet([20, 30, 20]);
% view(net);
[net, entre] = train(net,X,Y); 
testX = X(:,entre.testInd); 
Real_testY = Y(:,entre.testInd); 
Pred_testY = net(testX); 
perf = mse(net,Real_testY, Pred_testY)

rand_points = randi(3*18000,10000,1);
X_test = X(:,rand_points);
Y_test= Y(:,rand_points); 
Pred_test = net(X_test); 
perf = mse(net, Y_test, Pred_test)
plotregression(Y_test(1,:),Pred_test(1,:))

% T=table(X_test(1,:)',X_test(2,:)',Pred_test(1,:)',Pred_test(2,:)',Pred_test(3,:)',Pred_test(4,:)');
% T.Properties.VariableNames={'Time','Angle','Drag Coefficient','Lift Coefficient', 'Mean Drag','Mean Lift'}
% filename = 'patientdata.xlsx';
% writetable(T,filename,'Sheet',1,'Range','A1')

