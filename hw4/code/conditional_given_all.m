function [probability] = conditional_given_all(model, var_id)
%CONDITIONAL_GIVEN_ALL Computes the conditional
% distribution of the variable var_id given all other
% variables.
%
% inputs:
%   model - A cell array of random variable structs.
%   var_id - The ID of the variable for which to compute
%     the conditional distribution.
%
% output:
%   probability - A [1 x k] vector where k = length(
%     model{var_id}.values)). The element at i should be
%     the conditional probability that the variable var_id
%     is equal to the ith outcome, given that the value of
%     every other variable j in the model is
%     'model{j}.value'.

% TODO: implement me!
probability = ones(1, length(model{var_id}.values));

for i = 1 : length(model{var_id}.values)
    model{var_id}.value = i - 1;
    for j = 1 : length(model)
    
        p = conditional_given_parents(model, j);
        probability(1,i) = probability(1,i) * p(1,model{j}.value + 1);
        
    end
 
end

probability = probability / sum(probability);

end

