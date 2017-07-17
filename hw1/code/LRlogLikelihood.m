function [ logl ] = LRlogLikelihood( X, y, w )
    % Filler code, replace with your own.
    logl = 0;
    dataNum = size(y,1);
    for i = 1 : dataNum
        logl = logl + y(i)*(X(i,:)*w)-log(1+exp(X(i,:)*w));
    end
           
end