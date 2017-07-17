function [sample] = sample_discrete(model, var_id)
%SAMPLE_DISCRETE Samples from the conditional distribution
% of the variable var_id, given that the value of every
% other variable j in the model is 'model{j}.value'.

% TODO: implement me!
sample = 0;
probability = conditional_given_all(model, var_id);

%create cumlative distribution
pcum=cumsum(probability);
p = repmat(rand(1,1),1,length(probability)) - pcum(1:end);
sample = sum(p > 0);
%sample = randsample(model{var_id}.values,1,'true',probability);

end