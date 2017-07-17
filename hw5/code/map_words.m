function [words] = map_words(word_map, documents)
%MAP_WORDS Given a collection of documents (containing word
% strings), this function returns a similar structure,
% where all the word strings are replaced by their
% respective IDs, as given by the word_map.
%
% inputs:
%   word_map - A structure that maps word strings (as
%     fields of the structure) to positive integer IDs.
%   documents - A cell array of D documents. Each document
%     is itself a cell array of word strings.
%
% outputs:
%   words - A cell array of length D, where each element is
%     a [1 x N_d] vector of words (N_d is the number of
%     words in document d). This variable is generated
%     using the variable 'documents' (see below).

D = length(documents);
words = cell(1, D);
for d = 1:D
	N_d = length(documents{d});
	words{d} = zeros(1, N_d);
	for i = 1:N_d
		words{d}(i) = getfield(word_map, documents{d}{i});
	end
end

end

