function [ alphas, stumps ] = trainAdaboostModel( X, Y, Tmax )
%TRAINADABOOSTMODEL 
% Train an Adaboost model with decision stumps. 
%
% Train the model for a number of iterations t. At each iteration i learn 
% a weak learner (stumps{i}) and weight (alphas(i)). For each such weak 
% learner compute its weighted training error eps_t. Stop training if 
% eps_t = 0.5 (for robustness: if eps_i very close to 0.5!), or if the
% maximum number of iterations Tmax was achieved. 
%
% Output: alphas, stumps - arrays of size t where t 
%   is the # of iterations completed before stopping. 

    alphas = zeros(0,1);
    stumps = cell(0,1);    
    n = size(X,1);    
    D = 1/n * ones(n,1);
    
    for i = 1 : Tmax
        
        [ ns, fs, xs, gains ] = getWeightedInfoGainForStumps( X, Y, D );
        [s, eps] = chooseBestStump( X, Y, D, fs, xs, gains);
        if abs(eps - 0.5) < 0.000000001
            break;
        elseif eps == 0
            alpha = 10;
        elseif abs(eps - 1) < 0.0000000001
            alpha = -10;
        else
            alpha = computeAlpha( eps );
        end
        %eps
        %s.x
        %s.f
        %s.o
        D = computeNewWeights( X, Y, D, alpha, s);
        stumps{i} = s;
        alphas = [alphas;alpha];
              
    end

end

