function [z_d] = compute_z_conditional(words, phi, theta, d)
%COMPUTE_Z_CONDITIONAL Computes the conditional
% distribution of the variable z_d given w, phi, and theta,
% for document d.
%
% inputs:
%   words - A cell array of length D, where each element is
%     a [1 x N_d] vector of words (N_d is the number of
%     words in document d). See 'make_data'.
%   phi - A matrix of dimension [K x W] where phi(k,:) is
%     the current "guess" of the value of phi_k, as provided
%     by the M step.
%   theta - A matrix of dimension [D x K] where theta(d,:)
%     is the current "guess" of the value of theta_d, as
%     provided by the M step.
%
% output:
%   z_d - An [K x N_d] matrix where z_d(:,i) is a vector
%     containing the conditional probability distribution
%     p(z_{di} | w, phi, theta).

D = length(words);		% number of documents
K = size(phi, 1);		% number of topics
N_d = length(words{d}); % number of words in document d

% TODO: implement me!
z_d = zeros(K, N_d);
for i = 1 : N_d
    
    for j = 1 : K
        
       z_d(j,i) = exp(log(theta(d,j)) + log(phi(j,words{d}(i))));
       %z_d(j,i) = theta(d,j) * phi(j,words{d}(i));
    end
    
    z_d(:,i) = z_d(:,i)/sum(z_d(:,i));
end


