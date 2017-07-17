function [z, phi, theta] = em_lda(words, alpha, pi, iterations)
%EM_LDA Run a specified number of iterations of the EM
% algorithm for the LDA model.
%
% inputs:
%   words - A cell array of length D, where each element is
%     a [1 x N_d] vector of words (N_d is the number of
%     words in document d). See 'make_data'.
%   alpha - A [1 x K] vector containing the Dirichlet prior
%     parameter for theta_d (see handout).
%   pi - A [1 x W] vector containing the Dirichlet prior
%     parameter for phi_k (see handout). You can obtain W
%     from the length of 'inverse_word_map' as returned by
%     the function 'make_data'.
%   iterations - A scalar indicating the number of EM
%     iterations to run.
%
% outputs:
%   z - A cell array of length D, where each element is a
%     [K x N_d] matrix. Each column of this matrix z_d(:,i)
%     is a vector containing the conditional probability
%     distribution p(z_{di} | w, phi, theta), as returned
%     by 'compute_z_conditional'.
%   phi - A matrix of dimension [K x W] where phi(k,:) is
%     the MAP estimate of phi_k.
%   theta - A matrix of dimension [D x K] where theta(d,:)
%     is the MAP estimate of theta_d.

D = length(words); % number of documents
K = length(alpha); % number of topics
W = length(pi);	   % size of dictionary

% initialize phi (don't change this!)
phi = rand(K, W);
for k = 1:K
	phi(k,:) = phi(k,:) / sum(phi(k,:));
end

% initialize theta (don't change this!)
theta = rand(D, K);
for d = 1:D
	theta(d,:) = theta(d,:) / sum(theta(d,:));
end

z = cell(D);
for t = 1:iterations
	% E step
	% TODO: implement me!
    for d = 1 : D
        
        z{d} = compute_z_conditional(words, phi, theta, d);
        
    end
    
    % M step
	% TODO: implement me!
    for d = 1 : D
        
        theta(d,:) = maximize_theta(words, z, alpha, d);
       
        for k = 1 : K
            phi(k,:) = maximize_phi(words, z, pi, k);
        end
        
    end

end

end

