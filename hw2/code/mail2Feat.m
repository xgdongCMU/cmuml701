function [ Feats ] = mail2Feat( Mail )

nMail = size(Mail,1);
%Feats = ones(nMail,1); 

% THE FOLLOWING IS A VERY SIMPLE EXAMPLE SHOWING ONE POSSIBLE WAY TO
% COLLECT FEATURES. PLEASE REPLACE WITH YOUR CODE. NOTE HOW YOU CAN PLACE
% PRE-PROCESSED RESULTS IN dictionary.csv.
% NOTE: commented out for speed while testing previous exercises.

% % load data from dictionary.csv file
% fid = fopen('dictionary.csv');    
% tline = fgetl(fid);
% data = strread(tline,'%s','delimiter',',');
% nFeat = length(data);
% 
% % set up the feature matrix.
% Feats = [zeros(nMail,nFeat),ones(nMail,1)]; 
% 
% % collect features
% for i = 1:nMail
%     m = Mail{i};
%     nWords = length(m);
%     for k = 1:length(data)
%         keyWord = data{k};
%         for j = 1:nWords
%             w = m{j};
%             Feats(i,k) = Feats(i,k) + length(strfind(w,keyWord));
%         end
%     end
% end

    fid = fopen('dictionary2.csv');  
    dic_num = textscan(fid,'%s %f');
    fclose(fid);
    %words
    dic = dic_num{1};
    %words num
    idf = dic_num{2}';
    
    nFeat = size(dic,1);
    %Feats = [zeros(nMail,nFeat),ones(nMail,1)]; 
    
    ftd = zeros(nMail,nFeat);
    tf =  zeros(nMail,nFeat);
  
  % Calculate how many times term t appears in email i i = 1 : nMail
    for i = 1 : nMail
        m = Mail{i};
        for j = 1 : nFeat
            ftd(i,j) = sum(strcmpi(m,dic{j}));
        end
        tf(i,:) = 0.5 + ftd(i,:)./max(ftd(i,:));
    end

  % Calculate the feature for email i
  Feats = [repmat(idf,nMail,1).* tf, ones(nMail,1)];
    
end

