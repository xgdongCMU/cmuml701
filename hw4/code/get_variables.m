function [ids] = get_variables(model, names)
%GET_VARIABLES Returns a vector of IDs corresponding to a
% cell array of variable names.

ids = zeros(1, length(names));
for i = 1:length(names)
    ids(i) = get_variable(model, names{i});
end

end

