%plotp1_f
clear all;
close all;
xs = (-10:0.02:10)'; 
xt = [0.5 1 2 2.5 3]'; 
yt = [-1 1 3 1.5 0]';

ns = size(xs,1);
nt = size(xt,1);
sigma_s = 0.0005;
d=2;

select = 3;
lambda = [0.5 2 10];

for i = 1: length(lambda)

    K11 = kernel(xs,xs,select,d,lambda(i));

    K12 = kernel(xs,xt,select,d,lambda(i));

    K21 = kernel(xt,xs,select,d,lambda(i));

    K22 = kernel(xt,xt,select,d,lambda(i));

    m = K12*mldivide(K22 + sigma_s * eye(nt),yt);
    sig = K11 - K12*mldivide(K22 + sigma_s * eye(nt),K21);


    fs = mvnrnd(m,sig,1);

    fs_up = m + diag(sig);
    fs_b = m - diag(sig);
    figure;
    hold on;
    
    fill([xs;-xs], [fs_b;fliplr(fs_up)],'y');
    
    plot(xs,m,'b',xs,fs,'r');
    plot(xt,yt,'og');
    legend('Confidence band','mean','P(f(X|Y*))');
    
    len{i} = ['Squared exponential, \lambda = ', num2str(lambda(i))]; 
    ylabel('P(f(X)|Y*)');
    xlabel('X');
    title(len{i});
end

%legend(len);

