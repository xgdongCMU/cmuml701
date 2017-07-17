function [model] = init_children(model)
%INIT_CHILDREN Initializes the 'children' fields in the
% given model cell array.

for i = 1:length(model)
    model{i}.children = [];
end

for i = 1:length(model)
    for parent = model{i}.parents
        model{parent}.children = [model{parent}.children, i];
    end
end

end

