clear all;
close all;
xs = (-10:0.02:10)'; 
ns = size(xs,1);
m = zeros(1,ns);
K = zeros(ns,ns);

% Gaussian kernel
d = 2;
lambda = 2;
select = 3;
K = kernel(xs,xs,select,d,lambda);

fs = mvnrnd(m,K,1);
sigma_s = [0.1 0.4 1];
%ys = zeros(ns,3);
for i = 1 : 3
    ys = mvnrnd(fs,sigma_s(i)*eye(ns),1);
    len{i} = ['Squared Exponential', ', \lambda = ', num2str(lambda),', \sigma^2 = ',num2str(sigma_s(i)),];
    figure;
    plot(xs,ys);
    ylabel('Y');
    xlabel('X');
    title(len(i));
end