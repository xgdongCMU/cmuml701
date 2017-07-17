function [ grad ] = mLRgradient( X, y, W )
    % Filler code, replace with your own.
    f = size(X,2);
    numClass = max(y);
    grad = zeros(numClass,f); % grad is now a matrix
    n = size(X,1);
    
    for i = 1 : n
        for j = 1 : numClass
            p  = mLRprob( X(i,:), W );
            if y(i) == j
                grad(j,:) = grad(j,:) + X(i,:) - p(j)*X(i,:);
            else
                grad(j,:) = grad(j,:) + X(i,:)*0 - p(j)*X(i,:);
            end
        end
    end
    
end