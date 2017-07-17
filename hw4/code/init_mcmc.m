function [unknown_variables, model] = init_mcmc( ...
    model, observed_variables, observed_values, iterations)
%INIT_MCMC Initializes the model structure in preparation
% for the MCMC algorithm, and computes the set of latent
% variable IDs.
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
%   unknown_variables - A vector if IDs (indices)
%     indicating which random variables in 'model' are
%     unknown.
%   model - A modified cell array of random variable
%     structs, where for each unknown variable struct, the
%     field 'observed' is set to false, and the fields
%     'samples' and 'value' are initialized. For each
%     observed variable struct, the field 'observed' is set
%     to true, and the field 'value' is set to the observed
%     value as given by the input 'observed_values'.

% compute the set of indices of the unknown variables
all_variables = 1:length(model);
unknown_variables = setdiff(all_variables, observed_variables);

% initialize the fields 'samples' and 'sample_count' in each variable
for i = 1:length(unknown_variables)
    variable = unknown_variables(i);
    model{variable}.samples = zeros(iterations, 1);
    model{variable}.observed = false;
    
    % randomly guess the initial value of the unknown variables
    model{variable}.value = randi(length(model{variable}.values)) - 1;
end

for i = 1:length(observed_variables)
    variable = observed_variables(i);
    if variable <= 0 || variable > length(model)
        error(strcat('init_mcmc ERROR: invalid variable ID ', num2str(variable)));
    end
    
    model{variable}.observed = true;
    model{variable}.value = observed_values(i);
end

end

