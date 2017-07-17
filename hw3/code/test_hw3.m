% Dataset
n = 100;
X = rand(n,2);
Y = zeros(n,1);

% X = [1 2
%       2 2
%      3 2];
% Y = [-1 -1 1]';
% n = 3;

for i = 1 : n

    if (X(i,1)-0.5)^2 + (X(i,2)-0.5)^2 > 0.25 
    %if  X(i,1) - 0.5 >0  && X(i,2) - 0.5 >0
        
        Y(i) = 1;
        
    else
        
        Y(i) = -1;
        
    end
end

figure;
hold on;
for i = 1 : n
    if Y(i) == 1;
        plot(X(i,1),X(i,2),'ob');
    else
        plot(X(i,1),X(i,2),'+r');
    end
end
%test
% D = 1/n*ones(n,1);
% [ ns, fs, xs, gains ] = getWeightedInfoGainForStumps( X, Y, D );
% [s, eps] = chooseBestStump( X, Y, D, fs, xs, gains);
% YPred = predictWithStump( X, s );

%keyboard;
Tmax = 1000;
[ alphas, stumps ] = trainAdaboostModel( X, Y, Tmax );
[ H ] = predictAdaBoost( X, alphas, stumps );
err = H - Y;
err_rate = sum(err~=0)/length(err);