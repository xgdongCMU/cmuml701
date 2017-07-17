function [theta_d] = maximize_theta(words, z, alpha, d)
%MAXIMIZE_THETA Compute the arg max of the energy function
% q with respect to theta_d.
%
% inputs:
%   words - A cell array of length D, where each element is
%     a [1 x N_d] vector of words (N_d is the number of
%     words in document d). See 'make_data'.
%   z - A cell array of length D, where each element is a
%     [K x N_d] matrix. Each column of this matrix z_d(:,i)
%     is a vector containing the conditional probability
%     distribution p(z_{di} | w, phi, theta), as returned
%     by 'compute_z_conditional'.
%   alpha - A [1 x K] vector containing the Dirichlet prior
%     parameter for theta_d (see handout).
%   d - A scalar indicating the document d for which to
%     compute the optimal theta_d.
%
% outputs:
%   theta_d - A [1 x K] vector containing the value of
%     theta_d that maximizes the energy function q.

K = length(alpha);		% number of topics
N_d = length(words{d});	% number of words in document d

% TODO: implement me!
theta_d = zeros(1, K);

for k = 1 : K
    
        for i = 1 : N_d

            theta_d(1,k) = theta_d(1,k) + z{d}(k,i);
            
        end
    theta_d(1,k) = theta_d(1,k) + alpha(k) - 1;
    
end
theta_d = theta_d / sum(theta_d);

end

