function [ classPred ] = NBclassify( XTrain, XTest, yTrain )
    % Filler code, replace with your own.
    numTest = size(XTest,1);
    classPred = zeros(numTest, 1);
    probs = NBprior( yTrain );
    [mu, sigma] = NBparameters( XTrain, yTrain );
    p = zeros(size(probs,1),1);
    
    for i = 1 : numTest
        for j = 1 : size(probs,1)         
        del_mu = XTest(i,:) - mu(j,:);
        sigma_inv = diag(1./sigma(j,:));      
        p(j) = exp(-del_mu*sigma_inv*del_mu'/2)/sqrt(2*norm(sigma(j,:)))*probs(j);
        [~,classPred(i,1)] = max(p);
        end
    end
    
end



