function [ w ] = pWeights( XTrain, yTrain, nIter)
    % Filler code, replace with your own.
    nFeat = size(XTrain,2);
    w = zeros(nFeat,1);
    nSample = size(XTrain,1);  
    %w_ = zeros(nFeat,1);
%%   
    for n = 1: nIter    
%        p = randperm(nSample);
%        numError = 0;
%         
%         for i = 1 : nSample
%             
%             if yTrain(p(i)) * XTrain(p(i),:) * w > 0 
%                 continue;
%             else
%                 w = w + yTrain(p(i)) * XTrain(p(i),:)';
%                 %numError = numError + 1;
%             end
%             
%         end
%        w_ = w_ + w;
%       
%        if numError == 0
%            break;
%        end
%        
        for i = 1 : nSample
            
            if yTrain(i) * XTrain(i,:) * w > 0 
                continue;
            else
                w = w + yTrain(i) * XTrain(i,:)';     
            end
            
        end

    end
%%
       %w = w_/n;
end

