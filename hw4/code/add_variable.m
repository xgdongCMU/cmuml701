function [model] = add_variable(model, variable)
%ADD_VARIABLE Adds the given random variable structure to
% the model cell array.

model{length(model) + 1} = variable;

end

