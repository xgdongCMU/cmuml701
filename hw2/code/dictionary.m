function dictionary(Mail)

    nMail = size(Mail,1);
    data = {};
    
%% Caculate how many words are there in all the emails
    for i = 1 : nMail
        m = Mail{i};         
        nWords = length(m);
        for j = 1 : nWords
      
            data = [data m{j}];
            
        end
    end
    
    % Count word number
    dic = unique(data);
    nFeat = length(dic);
 
%% Calculate how many times term t appears in email i i = 1 : nMail

    ftd = zeros(nMail,nFeat);
    tf =  zeros(nMail,nFeat);
  
    for i = 1 : nMail
        m = Mail{i};
        for j = 1 : nFeat
            
            ftd(i,j) = sum(strcmpi(m,dic{j}));
            
        end
        tf(i,:) = 0.5 + ftd(i,:)./max(ftd(i,:));
    end

    ftd_ = ftd;
    ftd_(ftd_>0)=1;
    
    idf = log(nMail./(sum(ftd_,1)+0.1));
    f = sum(ftd,1)/nFeat;
    
    %dic = dic(idf.*f > 0.1);
    a = (idf > 0.1) & (f > 0.001); 
    idf = idf(a);
    dic = dic(a);
    keyboard;
%%
    fileID = fopen('dictionary2.csv','w');    
    
    %fprintf(formatSpec,A1,...,An)
    [nrows,ncols] = size(dic);
    for  col = 1:ncols
            fprintf(fileID,'%s\t %4f \n',dic{col},idf(col));
    end
    fclose(fileID);
    
end
    