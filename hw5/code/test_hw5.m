clear all;
[words, word_map, inverse_word_map] = make_data();
K = 2;
W = 13;
D = length(words);
z = cell(D,1);
phi = rand(K,W);
phi = phi./repmat(sum(phi,2),1,W);
theta = rand(D,K);
theta = theta./repmat(sum(theta,2),1,K);

alpha = ones(1,K)*2;
pi = ones(1,W)*2;

for d = 1 : D
    z{d} = compute_z_conditional(words, phi, theta, d);
end

q = energy(words, z, phi, theta, alpha, pi);

iterations = 10;
[z, phi, theta] = em_lda(words, alpha, pi, iterations);