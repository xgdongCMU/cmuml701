function [ Ypred ] = predictWithStump( X, s )
%PREDICTWITHSTUMP 
    Ypred = zeros(size(X,1),1);
    Xw = X(:,s.f);
    Ypred(Xw <= s.x) = s.o;
    Ypred(Xw > s.x) = -s.o;
end

