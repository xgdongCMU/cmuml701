function [ w, li ] = gradDescent( f, fgrad, w0, step, niter)
% GRADDESCENT Basic implementation of gradient descent (well, really ascent!) algorithm.
% We optimize concave function f, with gradient fgrad.
% We start from w0, with fixed step size "step", and fixed number of
% interations "niter".
% The function returns the final weight vector w, as well as a vector of 
% function values f(i) at each iteration i. 

    w = w0;
    li = size(niter,1);
    for i=1:niter
        w = w + step * fgrad(w);
        % li(i) = f(w);
    end
end

