function [model] = load_leader_follower(follower_count)
%LOAD_DIAGNOSIS Creates the model cell array for the
% leader follower network.
%
% output:
%   model - A cell array of random variable structs. (see
%     documentation for a detailed description of the
%     structure)

model = {};

leader.name = 'leader';
leader.type = 'discrete';
leader.values = [0, 1];
leader.parents = [];
leader.probability = ...
    [0.5, 0.5]; % p(leader)
model = add_variable(model, leader);

for i = 1:follower_count
	follower.name = strcat('follower', num2str(i));
	follower.type = 'discrete';
	follower.values = [0, 1];
	follower.parents = get_variables(model, {'leader'});
	follower.probability = ...
		[0.9, 0.1; ... % p(follower | leader = 0)
		 0.1, 0.9];    % p(follower | leader = 1)
	model = add_variable(model, follower);
end

model = init_children(model);

end

