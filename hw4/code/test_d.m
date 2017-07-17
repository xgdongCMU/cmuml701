cal_pro1;
model = load_diagnosis;

% [unknown_variables, model] = init_mcmc(model, 5, 1, 50);
% probability = conditional_given_all(model, 1);
% 
%%
select = 3;
T = linspace(100,5000,50);
for k = 1:50
if select == 3
    
    model = mcmc(model, 5, 1, T(k));

    for i = 1 : 3

        pb3_appr(i) = sum(model{1}.samples == i-1)/T(k);

    end
    error3(k) = norm(pb3_appr-pb3)/norm(pb3);
elseif select == 1
    T = 1000;
    model = mcmc(model, [4 5 1], [1 1 0], T);

    for i = 1 : 2

        pb1_appr(i) = sum(model{3}.samples == i-1)/T;

    end
    
elseif select == 2
    T = 1000;
    model = mcmc(model, [4 5 1], [1 1 2], T);

    for i = 1 : 2

        pb2_appr(i) = sum(model{3}.samples == i-1)/T;

    end
    
elseif select == 4
    T = 500;
    model = mcmc(model, 5, 0, T);

    for i = 1 : 3

        pb4_appr(i) = sum(model{1}.samples == i-1)/T;

    end
        
end
end
figure;
plot(T,error3*100,'*-r');
set(gca,'FontSize',16);
hold on;line([0 5000],[1 1]);
xlabel('Iterations T','FontSize',16);ylabel('Error [%]','FontSize',16);