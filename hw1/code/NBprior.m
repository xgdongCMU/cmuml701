function [ probs ] = NBprior( y )
    % Filler code, replace with your own.
    c = max(y);
    probs = ones(c,1);
    %probs = hist(y, c);
    for i = 1 : c
      rows =  find(y==i);
      probs(i,1) = length(rows);
    end
    probs = probs/sum(probs);
end

