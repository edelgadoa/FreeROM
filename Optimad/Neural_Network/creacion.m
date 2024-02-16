function [X,Y]=creacion(nt,na)
%alpha = linspace(0.12018,0.212968,na); %Cuando tengamos todos los alphas calculados, cambiamos esto
alpha = [0.12018, 0.146691, 0.186457, 0.199713, 0.239479];
t = linspace(1,10,nt);
for i=1:na
    k = (i-1)*nt;
    for j=1:nt
        X(j+k,1) = t(j);
        X(j+k,2) = alpha(i);
    end
end
for i=1:na
    k = (i-1)*nt;
    C1 = load("c1_"+num2str(alpha(i),6)+".txt"); 
    C2 = load("c2_"+num2str(alpha(i),6)+".txt");
    %(abs(C1)>1e3) = 0;
    %C2(abs(C2)>1e3) = 0;% mean(C1(imax-9:2:imax+9));
    
    Y(k+1:k+nt,1) = C1;
    Y(k+1:k+nt,2) = C2;

    for j=1:nt
        C1mean(j) = mean(C1(1:j));
        C2mean(j) = mean(C2(1:j));
    end
    Y(k+1:k+nt,3) = C1mean;
    Y(k+1:k+nt,4) = C2mean;

    %%Dibujamos los lift y drags
    figure(i)
    sgtitle("alpha = "+alpha(i))
    subplot(2,1,1)
    plot(X(k+1:k+nt,1),Y(k+1:k+nt,1),X(k+1:k+nt,1),Y(k+1:k+nt,2))

    legend('Drag','Lift')
    subplot(2,1,2)
    plot(X(k+1:k+nt,1),Y(k+1:k+nt,3),X(k+1:k+nt,1),Y(k+1:k+nt,4))
    legend('Mean Drag','Mean Lift')
end




%contourf(alfa,t,c1)
%plot(alfa,c1(:,5))
% figure
% plot(t,c1m(5,:))

