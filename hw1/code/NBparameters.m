function [ mu, sigma ] = NBparameters( X, y )
    % Filler code, replace with your own.
    numFeat = size(X,2);
    numClass = max(y);
    mu = zeros(numClass,numFeat);
    sigma = zeros(numClass,numFeat);
    for i = 1 : numClass
      row = find(y == i); 
      mu(i,:) = mean(X(row,:),1);
      sigma(i,:)= std(X(row,:),0,1).^2;
    end
    
end

