function [ p ] = LRprob( x, w )
    % Filler code, replace with your own.
    p(1,1) = 1/(1+exp(x*w));%y =0
    p(2,1) = 1 - p(1,1);%y = 1
end