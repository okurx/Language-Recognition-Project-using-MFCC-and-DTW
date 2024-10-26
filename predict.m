
clear all 

% Initialize counts for true and false predictions for each language
true_es = 0; % Count of true predictions for Spanish
true_ko = 0; % Count of true predictions for Korean
true_it = 0; % Count of true predictions for Italian
true_ch = 0; % Count of true predictions for Chinese

% Initialize counts for false predictions
false_es_it = 0; % False predictions: Spanish as Italian
false_es_ko = 0; % False predictions: Spanish as Korean
false_es_ch = 0; % False predictions: Spanish as Chinese

false_ko_es = 0; % False predictions: Korean as Spanish
false_ko_it = 0; % False predictions: Korean as Italian
false_ko_ch = 0; % False predictions: Korean as Chinese

false_it_es = 0; % False predictions: Italian as Spanish
false_it_ko = 0; % False predictions: Italian as Korean
false_it_ch = 0; % False predictions: Italian as Chinese

false_ch_es = 0; % False predictions: Chinese as Spanish
false_ch_ko = 0; % False predictions: Chinese as Korean
false_ch_it = 0; % False predictions: Chinese as Italian

% Calculate similarity for Spanish against other languages
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\es_features.mat');
MelCoefs = currentFeatures;% Load test features for Spanish
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\es_features.mat');
esFeatures = currentFeatures;% Load training features for Spanish

% Initialize similarity matrix for Spanish
yakinlikes = zeros(size(esFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)
for i = 1:numel(esFeatures)
    currentesFeatures = esFeatures{i};
    [yakinlikes(i,j)] = DTW(MelCoefs{j}, currentesFeatures);
end
end

% Similarity calculation for Korean
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\es_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\ko_features.mat');
koFeatures = currentFeatures;

yakinlikko = zeros(size(koFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)

for i = 1:numel(koFeatures)
    currentkoFeatures = koFeatures{i};
    [yakinlikko(i,j)] = DTW(MelCoefs{j}, currentkoFeatures);
end
end


% Similarity calculation for Italian
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\es_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\it_features.mat');
itFeatures = currentFeatures;

yakinlikit = zeros(size(itFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)

for i = 1:numel(itFeatures)
    currentitFeatures = itFeatures{i};
    [yakinlikit(i,j)] = DTW(MelCoefs{j}, currentitFeatures);
end
end


% Similarity calculation for Chinese
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\es_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\ch_features.mat');
chFeatures = currentFeatures;

yakinlikch = zeros(size(chFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)
for i = 1:numel(chFeatures)
    currentchFeatures = chFeatures{i};
    [yakinlikch(i,j)] = DTW(MelCoefs{j}, currentchFeatures);
end
end


% Spanish prediction evaluation
for j= 1:numel(MelCoefs)
    minyakinlikes = min(yakinlikes(:,j));
    minyakinlikko = min(yakinlikko(:,j));
    minyakinlikit = min(yakinlikit(:,j));
    minyakinlikch = min(yakinlikch(:,j));

    if (minyakinlikes < minyakinlikko && minyakinlikes < minyakinlikit && minyakinlikes < minyakinlikch)
        true_es=true_es+1;
    else if (minyakinlikko < minyakinlikes && minyakinlikko < minyakinlikit && minyakinlikko < minyakinlikch)
            false_es_ko=false_es_ko+1;
    else if (minyakinlikit < minyakinlikes && minyakinlikit < minyakinlikko && minyakinlikit < minyakinlikch)
            false_es_it=false_es_it+1;

    else if (minyakinlikch < minyakinlikes && minyakinlikch < minyakinlikko && minyakinlikch < minyakinlikit)
            false_es_ch=false_es_ch+1;
    end
    end
    end
    end
end

% Similarity calculations for Korean, Italian, and Chinese would follow similarly...
% (The same structure should be followed for the Korean, Italian, and Chinese similarity calculations and predictions)



% Calculate similarity for Korean against other languages
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\ko_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\es_features.mat');
esFeatures = currentFeatures;

yakinlikes = zeros(size(esFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)
for i = 1:numel(esFeatures)
    currentesFeatures = esFeatures{i};
    [yakinlikes(i,j)] = DTW(MelCoefs{j}, currentesFeatures);
end
end


load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\ko_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\ko_features.mat');
koFeatures = currentFeatures;

yakinlikko = zeros(size(koFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)

for i = 1:numel(koFeatures)
    currentkoFeatures = koFeatures{i};
    [yakinlikko(i,j)] = DTW(MelCoefs{j}, currentkoFeatures);
end
end


load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\ko_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\it_features.mat');
itFeatures = currentFeatures;

yakinlikit = zeros(size(itFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)

for i = 1:numel(itFeatures)
    currentitFeatures = itFeatures{i};
    [yakinlikit(i,j)] = DTW(MelCoefs{j}, currentitFeatures);
end
end

load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\ko_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\ch_features.mat');
chFeatures = currentFeatures;

yakinlikch = zeros(size(chFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)
for i = 1:numel(chFeatures)
    currentchFeatures = chFeatures{i};
    [yakinlikch(i,j)] = DTW(MelCoefs{j}, currentchFeatures);
end
end


% Korean prediction evaluation
for j= 1:numel(MelCoefs)
    minyakinlikes = min(yakinlikes(:,j));
    minyakinlikko = min(yakinlikko(:,j));
    minyakinlikit = min(yakinlikit(:,j));
    minyakinlikch = min(yakinlikch(:,j));

    if (minyakinlikko < minyakinlikes && minyakinlikko < minyakinlikit && minyakinlikko < minyakinlikch)
        true_ko=true_ko+1;
    else if (minyakinlikes < minyakinlikko && minyakinlikes < minyakinlikit && minyakinlikes < minyakinlikch)
            false_ko_es=false_ko_es+1;
    else if (minyakinlikit < minyakinlikes && minyakinlikit < minyakinlikko && minyakinlikit < minyakinlikch)
            false_ko_it=false_ko_it+1;
    else if (minyakinlikch < minyakinlikes && minyakinlikch < minyakinlikko && minyakinlikch < minyakinlikit)
            false_ko_ch=false_ko_ch+1;
    end
    end
    end
    end
end



% Calculate similarity for Italian against other languages
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\it_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\es_features.mat');
esFeatures = currentFeatures;

yakinlikes = zeros(size(esFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)
for i = 1:numel(esFeatures)
    currentesFeatures = esFeatures{i};
    [yakinlikes(i,j)] = DTW(MelCoefs{j}, currentesFeatures);
end
end


load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\it_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\ko_features.mat');
koFeatures = currentFeatures;

yakinlikko = zeros(size(koFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)

for i = 1:numel(koFeatures)
    currentkoFeatures = koFeatures{i};
    [yakinlikko(i,j)] = DTW(MelCoefs{j}, currentkoFeatures);
end
end


load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\it_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\it_features.mat');
itFeatures = currentFeatures;

yakinlikit = zeros(size(itFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)

for i = 1:numel(itFeatures)
    currentitFeatures = itFeatures{i};
    [yakinlikit(i,j)] = DTW(MelCoefs{j}, currentitFeatures);
end
end

load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\it_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\ch_features.mat');
chFeatures = currentFeatures;

yakinlikch = zeros(size(chFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)
for i = 1:numel(chFeatures)
    currentchFeatures = chFeatures{i};
    [yakinlikch(i,j)] = DTW(MelCoefs{j}, currentchFeatures);
end
end

% Italian prediction evaluation
for j= 1:numel(MelCoefs)
    minyakinlikes = min(yakinlikes(:,j));
    minyakinlikko = min(yakinlikko(:,j));
    minyakinlikit = min(yakinlikit(:,j));
    minyakinlikch = min(yakinlikch(:,j));

    if (minyakinlikit < minyakinlikes && minyakinlikit < minyakinlikko && minyakinlikit < minyakinlikch)
        true_it=true_it+1;
    else if (minyakinlikko < minyakinlikes && minyakinlikko < minyakinlikit && minyakinlikko < minyakinlikch)
            false_it_ko=false_it_ko+1;
    else if (minyakinlikes < minyakinlikko && minyakinlikes < minyakinlikit && minyakinlikes < minyakinlikch)
            false_it_es=false_it_es+1;
    else if (minyakinlikch < minyakinlikes && minyakinlikch < minyakinlikko && minyakinlikch < minyakinlikit)
            false_it_ch=false_it_ch+1;
    end
    end
    end
    end
end


% Calculate similarity for Chinese against other languages
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\ch_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\es_features.mat');
esFeatures = currentFeatures;

yakinlikes = zeros(size(esFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)
for i = 1:numel(esFeatures)
    currentesFeatures = esFeatures{i};
    [yakinlikes(i,j)] = DTW(MelCoefs{j}, currentesFeatures);
end
end


load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\ch_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\ko_features.mat');
koFeatures = currentFeatures;

yakinlikko = zeros(size(koFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)

for i = 1:numel(koFeatures)
    currentkoFeatures = koFeatures{i};
    [yakinlikko(i,j)] = DTW(MelCoefs{j}, currentkoFeatures);
end
end


load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\ch_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\it_features.mat');
itFeatures = currentFeatures;

yakinlikit = zeros(size(itFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)

    for i = 1:numel(itFeatures)
        currentitFeatures = itFeatures{i};
        [yakinlikit(i,j)] = DTW(MelCoefs{j}, currentitFeatures);
    end
end

load('C:\Users\burak\OneDrive\Belgeler\MATLAB\test\ch_features.mat');
MelCoefs = currentFeatures;
load('C:\Users\burak\OneDrive\Belgeler\MATLAB\train\ch_features.mat');
chFeatures = currentFeatures;

yakinlikch = zeros(size(chFeatures,1), size(MelCoefs,1));
for j= 1:numel(MelCoefs)
    for i = 1:numel(chFeatures)
        currentchFeatures = chFeatures{i};
        [yakinlikch(i,j)] = DTW(MelCoefs{j}, currentchFeatures);
    end
end


% Chinese prediction evaluation
for j= 1:numel(MelCoefs)
    minyakinlikes = min(yakinlikes(:,j));
    minyakinlikko = min(yakinlikko(:,j));
    minyakinlikit = min(yakinlikit(:,j));
    minyakinlikch = min(yakinlikch(:,j));

    if (minyakinlikch < minyakinlikes && minyakinlikch < minyakinlikko && minyakinlikch < minyakinlikit)
        true_ch=true_ch+1;
    else if (minyakinlikko < minyakinlikes && minyakinlikko < minyakinlikit && minyakinlikko < minyakinlikch)
            false_ch_ko=false_ch_ko+1;
    else if (minyakinlikes < minyakinlikko && minyakinlikes < minyakinlikit && minyakinlikes < minyakinlikch)
            false_ch_es=false_ch_es+1;
    else if (minyakinlikit < minyakinlikes && minyakinlikit < minyakinlikko && minyakinlikit < minyakinlikch)
            false_ch_it=false_ch_it+1;
    end
    end
    end
    end
end



% Calculate total correct predictions
dogru_tahminler_toplam = true_ko + true_es + true_it + true_ch;

% Calculate total data count
toplam_veri_sayisi = dogru_tahminler_toplam + false_es_it + false_es_ko + false_es_ch + false_ko_es + false_ko_it + false_ko_ch + false_it_es + false_it_ko + false_it_ch + false_ch_es + false_ch_ko + false_ch_it;

% Calculate accuracy
accuracy = dogru_tahminler_toplam / toplam_veri_sayisi;

% Create confusion matrix
confMat = [true_ko, false_ko_es, false_ko_it, false_ko_ch; 
           false_es_ko, true_es, false_es_it, false_es_ch; 
           false_it_ko, false_it_es, true_it, false_ch_it; 
           false_ch_ko, false_ch_es, false_ch_it, true_ch];

% Create a confusion matrix chart without normalization
figure;
h = confusionchart(confMat, {'KO', 'ES', 'IT', 'CH'});

% Set labels and title
xlabel('Predicted');
ylabel('Actual');
title(['Confusion Matrix - Accuracy: ', num2str(accuracy)]);

% Display accuracy
disp(['Accuracy: ', num2str(accuracy)]);


