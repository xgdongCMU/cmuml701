function [ cls ] = LRclassify( XTrain, yTrain, XTest )
    %XTrain = [ones(size(XTrain,1),1) XTrain];
    %XTest = [ones(size(XTest,1),1) XTest];
    
    f = size(XTrain,2);
    m = size(XTest,1);
    
    % Train the model
    fgrad = @(w) LRgradient( XTrain, yTrain, w );
    flogl = @(w) LRlogLikelihood( XTrain, yTrain, w );
    w0 = zeros(f,1);
    step = 0.1;
    niter = 500;
    [w] = gradDescent(flogl, fgrad, w0, step, niter)
    size(w)
   % keyboard;
    cls = zeros(m,1);
    for i = 1 : m
        p  = LRprob( XTest(i,:), w );
        if p(2) >= 0.5
            cls(i) = 1;
        end
    end
    % Use the model to classify 
    % (!!) Filler code, replace with your own.

end