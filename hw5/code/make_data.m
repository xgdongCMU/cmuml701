function [words, word_map, inverse_word_map] = make_data()
%MAKE_DATA Creates a dataset from a small collection of
% documents.
%
% outputs:
%   words - A cell array of length D, where each element is
%     a [1 x N_d] vector of words (N_d is the number of
%     words in document d). This variable is generated
%     using the variable 'documents' (see below).
%   word_map - A structure that maps word strings (as
%     fields of the structure) to positive integer IDs.
%   inverse_word_map - A cell array that maps positive
%     integer IDs to the corresponding word strings. The
%     length of this structure indicates the number of
%     unique words in the document collection.

% from simple English wikipedia
%documents{1} = {'apple', 'fleshy', 'fruit', 'apple', 'tree', 'species', 'Malus', 'domestica', 'rose', 'family', 'Rosaceae', 'apple', 'grown', 'tree', 'fruits', 'grown', 'orchards'};
%documents{2} = {'peach', 'species', 'Prunus', 'persica', 'fruit', 'tree', 'rose', 'family', 'Rosaceae', 'grow', 'warm', 'regions', 'northern', 'southern', 'hemispheres'};
%documents{3} = {'banana', 'common', 'name', 'type', 'herb', 'name', 'herbaceous', 'plants', 'grow', 'herb', 'plants', 'belong', 'genus', 'Musa', 'native', 'tropical', 'region', 'Southeast', 'Asia', '100', 'different', 'species', 'banana'};
%documents{4} = {'quark', 'tiny', 'particle', 'makes', 'up', 'protons', 'neutrons', 'atoms', 'made', 'neutrons', 'protons', 'electrons', 'thought', 'neutrons', 'protons', 'electrons', 'fundamental', 'particles', 'fundamental', 'particles', 'broken', 'up', 'anything', 'smaller'};
%documents{5} = {'photons', 'atomic', 'models', 'physics', 'particles', 'transmit', 'light', 'light', 'carried', 'space', 'photons', 'photon', 'elementary', 'particle', 'own', 'antiparticle', 'quantum', 'mechanics', 'photon', 'characteristic', 'quantum', 'energy'};
%documents{6} = {'normal', 'distribution', 'probability', 'distribution', 'called', 'Gaussian', 'distribution', 'discovered', 'Carl', 'Friedrich', 'Gauss', 'normal', 'distribution', 'continuous', 'probability', 'distribution', 'very', 'important', 'fields', 'science'};

% a smaller test set
documents{1} = {'apple', 'fruit', 'tree', 'apple', 'fruit', 'apple'};
documents{2} = {'peach', 'fruit', 'tree', 'peach', 'fruit'};
documents{3} = {'banana', 'fruit', 'tree', 'fruit', 'banana', 'tree'};
documents{4} = {'quark', 'fundamental', 'particle', 'physics', 'quantum', 'mechanics'};
documents{5} = {'photon', 'light', 'fundamental', 'particle', 'physics', 'quantum', 'mechanics'};

D = length(documents);

% construct word map
word_map = struct();
inverse_word_map = cell(1, 0);
for d = 1:D
	N_d = length(documents{d});
	for i = 1:N_d
		if (~isfield(word_map, documents{d}{i}))
			id = length(inverse_word_map) + 1;
			word_map = setfield(word_map, documents{d}{i}, id);
			inverse_word_map{id} = documents{d}{i};
		end
	end
end

words = map_words(word_map, documents);

end

