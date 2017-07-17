function [ alpha ] = computeAlpha( eps )
%COMPUTEALPHA 
    alpha = 0;
    alpha = 1/2*log((1-eps)/eps);
    
end

