function [s, eps] = chooseBestStump( X, Y, D, fs, xs, gains)
%CHOOSEBESTSTUMP Return the stump with the highest info gain. 
% Output: 
%   s - a struct with three fields: f, x, o. 
%       s.f - the feature along which you split
%       s.x - the value around which you split <= x, > x
%       s.o - the orientation of the stump = the label the stump assigns 
%               to the points <=x
%   eps - the weighted error of the stump s. 
%
% NOTE: The information gain only pins down f and x. The orientation 
% is given by whichever orientation leads to a lower stump error. 
% e.g. a stump separating -+ will have s.o = -1, and a stump separating 
% +- will have s.o = +1; In case of tie, take s.o = -1. 
    s.f = 0;
    s.x = 0;
    s.o = 0;
    eps = 0;
    
    [~,I] = max(gains);
    s.f = fs(I);
    s.x = xs(I);
    n = size(X,1);
    
    w_one = ones(n,1) .* D;
    
    % s.o = -1
    eps1 =  sum(w_one(X(:,s.f)<=s.x & Y>0)) + sum(w_one(X(:,s.f)>s.x & Y<0));
    % s.o = 1
    eps2 =  sum(w_one(X(:,s.f)<=s.x & Y<0)) + sum(w_one(X(:,s.f)>s.x & Y>0));
   % keyboard;
    
    if eps1 <= eps2
      s.o = -1;
      eps = eps1;
    else
      s.o = 1;
      eps = eps2;
    end   

    
end

