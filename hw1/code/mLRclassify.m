function [ cls ] = mLRclassify( XTrain, yTrain, XTest )
    f = size(XTrain,2);
    numClass = max(yTrain);
    m = size(XTest,1);
    
    % Train the model
    fgrad = @(W) mLRgradient( XTrain, yTrain, W ); % Switched to mLR
    flogl = @(W) mLRlogLikelihood( XTrain, yTrain, W ); % Switched to mLR
    W0 = zeros(numClass, f); % W is now a matrix
    step = 0.05;
    niter = 1000;
    W = gradDescent(flogl, fgrad, W0, step, niter);
    cls = zeros(m,1);
    for i = 1 : m
       p = mLRprob( XTest(i,:), W );
       [~,I] = max(p);
       cls(i,1) = I;
    end
   
end