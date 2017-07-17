function [model] = mcmc(model, observed_variables, observed_values, iterations)
%MCMC Runs a number of iterations of Gibbs sampling on the
% given model, with specified observations.
%
% inputs:
%   model - A cell array of random variable structs,
%     potentially with uninitialized fields 'observed',
%     'value', and 'samples'.
%   observed_variables - A vector of IDs (indices)
%     indicating which random variables in 'model' are
%     observed.
%   observed_values - A vector containing the observed
%     values (parallel to 'observed_variables').
%   iterations - The number of iterations to run.
%
% outputs:
%   model - The modified cell array where each unknown
%     variable struct contains a list of T samples.

[unknown_variables, model] = init_mcmc( ...
    model, observed_variables, observed_values, iterations);

for i = 1:iterations
	% TODO: implement me!
    order = randperm(length(unknown_variables));
    unknown_variables = unknown_variables(order);
    
    for var_id = unknown_variables
        
        model{var_id}.samples(i) = sample_discrete(model, var_id);
        model{var_id}.value = model{var_id}.samples(i);
        
    end
end

end

