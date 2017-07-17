function [probability] = conditional_given_parents(model, var_id)
%CONDITIONAL_GIVEN_PARENTS Computes the conditional
% distribution of the variable var_id given its parents.
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
%     its parent variables j is 'model{j}.value'.

index = 0;
for parent_id = model{var_id}.parents
    parent = model{parent_id};
    index = length(parent.values) * index;
    index = index + parent.value;
end

probability = model{var_id}.probability(index + 1,:);

end

