function [ c ] = kpClassify( XTrain, XTest, w, d )
    % Filler code, replace with your own.
    nTest = size(XTest,1);
    c = zeros(nTest,1);
    f = zeros(nTest,1);
    
    for i = 1 : nTest
           
        f(i) = w' * (XTrain * XTest(i,:)' ).^d;
        
        if f(i) > 0     
            c(i) = 1;      
        else           
            c(i) = -1;     
        end
        
    end
end

