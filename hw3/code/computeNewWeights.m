function [ Dnew ] = computeNewWeights( X, Y, D, alpha, s)
%COMPUTENEWWEIGHTS 
    Dnew = zeros(size(D));
    Ypred  = predictWithStump( X, s );
    %keyboard;
    for i = 1 : length(Y)
        Dnew(i) = D(i) * exp(-Y(i) * alpha * Ypred(i));
    end
    Dnew = Dnew/sum(Dnew);
end

