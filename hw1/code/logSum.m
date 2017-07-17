function [ sumX ] = logSum( X )
    % Filler code, replace with your own.
    p = max(X);
    sumX = p + log(sum(exp(X-p)));
end

