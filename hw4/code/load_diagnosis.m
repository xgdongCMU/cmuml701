function [model] = load_diagnosis()
%LOAD_DIAGNOSIS Creates the model cell array for the
% diagnostic aid model given in the written homework.
%
% output:
%   model - A cell array of random variable structs. (see
%     documentation for a detailed description of the
%     structure)

model = {};

weeks_traveling.name = 'weeks_traveling';
weeks_traveling.type = 'discrete';
weeks_traveling.values = [0, 1, 2];
weeks_traveling.parents = [];
weeks_traveling.probability = ...
    [0.95, 0.03, 0.02]; % p(weeks_traveling)
model = add_variable(model, weeks_traveling);

has_stomach_flu.name = 'has_stomach_flu';
has_stomach_flu.type = 'discrete';
has_stomach_flu.values = [false, true];
has_stomach_flu.parents = get_variables(model, {'weeks_traveling'});
has_stomach_flu.probability = ...
    [0.9, 0.1; ... % p(has_stomach_flu | weeks_traveling = 0)
     0.8, 0.2; ... % p(has_stomach_flu | weeks_traveling = 1)
     0.8, 0.2];    % p(has_stomach_flu | weeks_traveling = 2)
model = add_variable(model, has_stomach_flu);

has_ebola.name = 'has_ebola';
has_ebola.type = 'discrete';
has_ebola.values = [false, true];
has_ebola.parents = get_variables(model, {'weeks_traveling'});
has_ebola.probability = ...
    [0.999, 0.001; ... % p(has_ebola | weeks_traveling = 0)
     0.980, 0.020; ... % p(has_ebola | weeks_traveling = 1)
     0.960, 0.040];    % p(has_ebola | weeks_traveling = 2)
model = add_variable(model, has_ebola);

abdominal_pain.name = 'abdominal_pain';
abdominal_pain.type = 'discrete';
abdominal_pain.values = [false, true];
abdominal_pain.parents = get_variables(model, {'has_stomach_flu', 'has_ebola'});
abdominal_pain.probability = ...
    [0.99, 0.01; ... % p(abdominal_pain | has_stomach_flu = F, has_ebola = F)
     0.05, 0.95; ... % p(abdominal_pain | has_stomach_flu = F, has_ebola = T)
     0.05, 0.95; ... % p(abdominal_pain | has_stomach_flu = T, has_ebola = F)
     0.01, 0.99];    % p(abdominal_pain | has_stomach_flu = T, has_ebola = T)
model = add_variable(model, abdominal_pain);

rash.name = 'rash';
rash.type = 'discrete';
rash.values = [false, true];
rash.parents = get_variables(model, {'has_ebola'});
rash.probability = ...
    [0.80, 0.20; ... % p(rash | has_ebola = F)
     0.10, 0.90];    % p(rash | has_ebola = T)
model = add_variable(model, rash);

model = init_children(model);

end

