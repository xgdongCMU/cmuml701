%% hw 2 problem 3.1
nIter = 10:20:190;
rate = zeros(length(nIter),1);
for i = 1 : length(nIter)
[ w ] = pWeights( XTrain, yTrain, nIter(i));
[ c ] = pClassify( XTrain, w);
result = c - yTrain;
rate(i) = length(result(result==0))/length(result);
end
plot(nIter,rate,'*');

%% hw 2 problem 3.2
nIter = 10:20:190;
rate = zeros(length(nIter),1);
d = 2;
for i = 1 : length(nIter)
[ w ] = kpWeights( XTrain(1:200,:), yTrain(1:200), nIter(i), d );
[ c ] = kpClassify( XTrain(1:200,:),XTrain(201:284,:), w, d );
result = c - yTrain(201:284);
rate(i) = length(result(result==0))/length(result);
end
plot(nIter,rate,'*');


%% hw 2 problem 3.3.1
dictionary(XTrain(1:100));

[ Feats1 ] = mail2Feat(XTrain(1:50));
[ Feats2 ] = mail2Feat(XTrain(50:100));

nIter = 300:100:500;
d = 2;
rate = zeros(length(nIter),1);
for i = 1 : length(nIter)
[ w ] = kpWeights( Feats1, yTrain(1:50), nIter(i), d );
[ c ] = kpClassify( Feats1,Feats2, w, d );
result = c - yTrain(50:100);
rate(i) = length(result(result==0))/length(result);
end
plot(nIter,rate,'*');

%% hw 2 problem 3.3.2
[ Feats ] = mail2Feat(XTrain(1:100));
nIter = 100:100:400;
rate = zeros(length(nIter),1);
for i = 1 : length(nIter)
    [ w ] = pWeights( Feats(1:50,:), yTrain(1:50), nIter(i));
    [ c ] = pClassify( Feats(50:100,:), w);
    result = c - yTrain(50:100);
    rate(i) = length(result(result==0))/length(result);
end
plot(nIter,rate,'*');