function [id] = get_variable(model, name)
%GET_VARIABLE Returns the ID of the variable in the model
% with the given name.

for i = 1:length(model)
    if (strcmp(model{i}.name, name))
        id = i;
        return;
    end
end

error(strcat('get_variable ERROR: variable "', name, '" not found.'));

end

