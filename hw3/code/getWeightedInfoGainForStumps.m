function [ ns, fs, xs, gains ] = getWeightedInfoGainForStumps( X, Y, D )
%GETWEIGHTEDINFOGAINFORSTUMPS Compute the weighted info gain 
% for every possible split along every possible dimension. 
% 
% Output: 
% A list of ns splits and associated gains, each split i described via:
%   fs(i) - the feature along which we split
%   xs(i) - the value according to which we split Xi <= xs(i), Xi > xs(i)
%   gains(i) - the information gain obtained by splitting acording to fs(i), xs(i)
% fs, xs, gains are vectors of equal size (ns x 1), equal to the
% total # of distinct splits. 
% 
% NOTE: "All possible splits along dimension i" = all splits obtained by 
% sorting X according to coordinate i, and taking the midpoint 
% between each two consecutive distinct points. As not all points may be 
% distinct, the total # of splits ns migth be < (n-1)*k. 

    n = size(X,1);
    k = size(X,2);
    ns = 0;
    
    % Pre-allocate max memory we might need for efficiency 
    fs = zeros((n-1)*k,1); 
    xs = zeros((n-1)*k,1);
    gains = zeros((n-1)*k,1);
    
    
    % TODO: Fill in your code here! 
    % -----------------------------
    % data weighting
    p = 0;
    % splitting
    for i = 1 : k
        
        temp = unique(X(:,i));
        
        xs(p + 1 : p + length(temp) - 1) = (temp(1:end-1) + temp(2:end))/2;
        
        fs(p + 1 : p + length(temp) - 1) = i;
        
        p = p + length(temp) - 1;
        
    end
    xs = xs(xs ~= 0);
    fs = fs(fs ~= 0);
    ns = length(xs);

    Yw = Y.*D;
    % Calculate marginal entropy H(y)
    Py = sum(Yw(Yw > 0));
    
    H = -Py * log2(Py) - (1-Py) * log2(1-Py);
    
    P11 = 0;
    P12 = 0;
    P21 = 0;
    P22 = 0;
    w_one = ones(n,1).*D;
    % Calculate matrix of conditional entropies H(Y | Xi)  
        for j = 1 : ns
            
            Py1 = sum(w_one(X(:,fs(j))<=xs(j) & Yw>0))/sum(w_one(X(:,fs(j))<=xs(j)));
            Py2 = sum(w_one(X(:,fs(j))>xs(j) & Yw>0))/sum(w_one(X(:,fs(j))>xs(j)));
            Px = sum(w_one(X(:,fs(j)) <= xs(j)));
            
            
            if Py1 == 0 || Py1 == 1
                P11 = 0; 
                P12 = 0;
            else
                P11 = Py1 * log2(Py1);
                P12 = (1-Py1) * log2(1-Py1);
            end
            
            if Py2 == 0 || Py2 == 1
                P21 = 0;
                P22 = 0;
            else
                P21 = Py2 * log2(Py2);
                P22 = (1-Py2) * log2(1-Py2);
            end
            
            Hc(j) = -Px * (P11 + P12) - (1-Px) * (P21 + P22);
            
        end
    % Gain = difference in entropies H(y) - H(y | Xi)
        gains = H - Hc;
        
    % Only return the ns splits (remove zero padding we pre-allocated)
    fs = fs(1:ns);
    xs = xs(1:ns);
    gains = gains(1:ns)';
end