function [ grad ] = LRgradient( X, y, w )
    % Filler code, replace with your own.
    f = size(X,2);
    grad = zeros(f,1);
    dataNum = size(X,1);
    for j = 1 : dataNum
        py = LRprob( X(j,:), w );
        grad = grad + (y(j) - py(2)) * X(j,:)';
    end

end