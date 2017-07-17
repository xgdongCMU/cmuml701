function [ logl ] = mLRlogLikelihood( X, y, W )
    % Filler code, replace with your own.
    n = size(X,1);
    logl = 0;
    
    for i = 1 : n
        p = mLRprob(X(i,:), W );
        %logl = logl + X(i,:)*W(y(i),:)' - logSum(exp(X(i,:)*W'));
        logl = logl + log(p(y(i)));
    end

end