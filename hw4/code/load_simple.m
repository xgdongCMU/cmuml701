function [model] = load_simple()
%LOAD_SIMPLE Creates the model cell array for a very
% simple network (useful for testing/debugging).
%
% output:
%   model - A cell array of random variable structs. (see
%     documentation for a detailed description of the
%     structure)

model = {};

grandparent.name = 'grandparent';
grandparent.type = 'discrete';
grandparent.values = [0, 1, 2];
grandparent.parents = [];
grandparent.probability = ...
    [0.4, 0.4, 0.2]; % p(grandparent)
grandparent.probability = grandparent.probability / sum(grandparent.probability);
model = add_variable(model, grandparent);

parent.name = 'parent';
parent.type = 'discrete';
parent.values = [0, 1];
parent.parents = get_variables(model, {'grandparent'});
parent.probability = ...
    [0.7, 0.3; ... % p(parent | grandparent = 0)
     0.3, 0.7; ... % p(parent | grandparent = 1)
     0.5, 0.5];    % p(parent | grandparent = 2)
model = add_variable(model, parent);

child.name = 'child';
child.type = 'discrete';
child.values = [0, 1];
child.parents = get_variables(model, {'parent'});
child.probability = ...
    [0.7, 0.3; ... % p(child | parent = 0)
     0.3, 0.7];    % p(child | parent = 1)
model = add_variable(model, child);

model = init_children(model);

end

