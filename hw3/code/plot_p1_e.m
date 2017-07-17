%plot_1_e
clear all;
close all;
xs = (-10:0.02:10)'; 
xt = [0.5 1 2 2.5 3]'; 
yt = [-1 1 3 1.5 0]';

ns = size(xs,1);
nt = size(xt,1);
sigma_s = 5;
d=2;
lambda = 2;
alpha = 2;
select = [3 4 5];
len{1} = ['Squared exponential kernel \lambda = ',num2str(lambda),', \sigma^2 = ', num2str(sigma_s)];
len{2} = ['Exponential \lambda = ',num2str(lambda),', \sigma^2 = ', num2str(sigma_s)];
len{3} = ['Peroidic \alpha = ',num2str(alpha),', \sigma^2 = ', num2str(sigma_s)];

for i = 1 : length(select)

    K11 = kernel(xs,xs,select(i),d,lambda);

    K12 = kernel(xs,xt,select(i),d,lambda);

    K21 = kernel(xt,xs,select(i),d,lambda);

    K22 = kernel(xt,xt,select(i),d,lambda);

    m = K12*mldivide(K22 + sigma_s * eye(nt),yt);
    sig = K11 - K12*mldivide(K22 + sigma_s * eye(nt),K21);


    fs = mvnrnd(m,sig,3);

    fs_up = m + diag(sig);
    fs_b = m - diag(sig);

    figure;
    hold on;
    fill([xs;-xs], [fs_b;fliplr(fs_up)],'y');
    plot(xs,m,'b',xs,fs,'r');
    legend('Confidence band','mean','P(f(X|Y*))');
    plot(xt,yt,'og');
    
    ylabel('P(f(X)|Y*)');
    xlabel('X');
    title(len{i});
end
