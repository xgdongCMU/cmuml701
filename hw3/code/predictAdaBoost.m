function [ H ] = predictAdaBoost( X, alphas, stumps )
%PREDICTADABOOST 
    n = size(X,1);
    H = zeros(n, 1);
    Ypred =zeros(n,1); 
    %alphas = alphas/sum(alphas); 
    for i = 1 : length(alphas)   
        
            Xw = X(:,stumps{i}.f);
            Ypred(Xw <= stumps{i}.x) = stumps{i}.o;
            Ypred(Xw > stumps{i}.x) = -stumps{i}.o;
            H = H + alphas(i) * Ypred;
        
    end
    H(H <= 0) = -1;
    H(H > 0) = 1;
    
end

