function [ w ] = kpWeights( XTrain, yTrain, nIter, d )
    % Filler code, replace with your own.
    nTrain = size(XTrain,1);
    w = zeros(nTrain,1);
    
    for n = 1 : nIter
        
        numError = 0;
        
        for i = 1 : nTrain
                
                f =  (w .* yTrain)' * (XTrain * XTrain(i,:)').^d;
                
                if f * yTrain(i) > 0                   
                    continue;                    
                else
                    w(i,1) = w(i,1) + 1;
                    numError = numError +1;
                end
       
        end
        
        if numError == 0
            break;
        end      
        
    end
    
    w = w .* yTrain;
    
end

