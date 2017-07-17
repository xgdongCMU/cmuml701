function [ c ] = pClassify( XTest, w)
    % Filler code, replace with your own.
    nTest = size(XTest,1);
    c = zeros(nTest,1);
    
    for i = 1 : nTest
        
       if XTest(i,:) * w >0
           c(i,1) = 1;     
       else        
           c(i,1) = -1;           
       end
       
    end
    
end

