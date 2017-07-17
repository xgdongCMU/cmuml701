%plot_1_a
clear all;
close all;
xs = (-10:0.02:10)'; 
ns = size(xs,1);
m = zeros(1,ns);
K = zeros(ns,ns);
d = 2;
lambda = 4;
select = 1;
%Linear kernel
K = kernel(xs,xs,select,d,lambda);

fs = mvnrnd(m,K,3);
fs_up = m' + diag(K);
fs_b = m' - diag(K);

figure;
hold on;
fill([xs;-xs], [fs_b;fliplr(fs_up)],'y');
plot(xs,m,'b',xs,fs,'r');
legend('Confidence band','mean','P(f(X|Y*))');
ylabel('P(f(X))');
xlabel('X');
title('Linear kernel')

%Polynomial kernel
d=2;
select = 2;
K = kernel(xs,xs,select,d,lambda);

fs = mvnrnd(m,K,3);
fs_up = m' + diag(K);
fs_b = m' - diag(K);

figure;
hold on;
fill([xs;-xs], [fs_b;fliplr(fs_up)],'y');
plot(xs,m,'b',xs,fs,'r');
ylabel('P(f(X))');
xlabel('X');
legend('Confidence band','mean','P(f(X|Y*))');
title(['Polynomial d = ',num2str(d)]);

% Gaussian kernel
lambda = 2;
select = 3;
K = kernel(xs,xs,select,d,lambda);

fs = mvnrnd(m,K,3);
fs_up = m' + diag(K);
fs_b = m' - diag(K);

figure;
hold on;
fill([xs;-xs], [fs_b;fliplr(fs_up)],'y');
plot(xs,m,'b',xs,fs,'r');
ylabel('P(f(X))');
xlabel('X');
legend('Confidence band','mean','P(f(X|Y*))');
title(['Squared exponential \lambda = ', num2str(lambda)]);