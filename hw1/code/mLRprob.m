function [ p ] = mLRprob( x, W )
    % Filler code, replace with your own.
    c = size(W,1);
    p = ones(c,1);
    
    for i = 1 : c
        p(i,1) = exp(W(i,:)*x');
    end
    
    p = p / sum(p);
end