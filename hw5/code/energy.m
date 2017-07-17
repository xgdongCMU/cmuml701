function [q] = energy(words, z, phi, theta, alpha, pi)
%ENERGY Computes the expectation of the log posterior
% probability with respect to the conditional distribution
% of z given all other variables:
% E[log p(phi, theta, z | w)] where the expectation is
% taken over p(z | w, phi, theta) and constant terms are
% omitted.
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
%   phi - A matrix of dimension [K x W] where phi(k,:) is
%     the current "guess" of the value of phi_k, as provided
%     by the M step.
%   theta - A matrix of dimension [D x K] where theta(d,:)
%     is the current "guess" of the value of theta_d, as
%     provided by the M step.
%   alpha - A [1 x K] vector containing the Dirichlet prior
%     parameter for theta_d (see handout).
%   pi - A [1 x W] vector containing the Dirichlet prior
%     parameter for phi_k (see handout).
%
% output:
%   probability - A scalar with the expectation of the log
%     posterior probability: E[log p(phi, theta, z | w)],
%     where the expectation is taken over
%     p(z | w, phi, theta) and constant terms are omitted.

D = length(words);		% number of documents
K = size(phi, 1);		% number of topics
W = length(pi);
% TODO: implement me!
q = 0;

for d = 1 : D
    
    N_d = length(words{d});
    
    for i = 1 : N_d

        for k = 1 : K
            
            temp = theta(d,k) * phi(k,words{d}(i));
            q = q + z{d}(k,i)*log(temp);

        end
    end
end

for k = 1 : K
    
   for w = 1 : W
      
       q = q + (pi(w) - 1) * log(phi(k,w));
       
   end
    
end

for d = 1 : D
   
    for k = 1 : K
    
        q = q + (alpha(k) - 1) * log(theta(d,k));
        
    end
    
end

end