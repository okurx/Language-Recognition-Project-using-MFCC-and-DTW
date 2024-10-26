% This code extracts MFCC features from audio files for specified languages
% and saves the features in separate .mat files for each language.

clear all;  
clc;        

% Define the base folder paths for feature extraction (train and test datasets)
baseFolderPaths = {'C:\Users\burak\OneDrive\Belgeler\MATLAB\train', ...
                   'C:\Users\burak\OneDrive\Belgeler\MATLAB\test'};

% Define language folders
languages = {'es', 'ko', 'it', 'ch'};

% Loop through each base folder (train and test datasets)
for basePathIdx = 1:length(baseFolderPaths)
    baseFolderPath = baseFolderPaths{basePathIdx};  % Set current base folder path

    % Initialize a structure to store features for each language
    languageFeatures = struct();

    % Loop through each language directory
    for langIdx = 1:numel(languages)
        % Construct the full path for the current language directory
        folderPath = fullfile(baseFolderPath, languages{langIdx});

        % Get a list of all .wav files in the directory
        currentFileList = dir(fullfile(folderPath, '*.wav'));

        % Initialize a cell array to store features for each file
        features = cell(numel(currentFileList), 1);

        % Loop through each .wav file in the language folder
        for i = 1:numel(currentFileList)
            % Read the audio file
            [audio, fs] = audioread(fullfile(folderPath, currentFileList(i).name));

            % Extract MFCC features with 39 coefficients
            coeffs = mfcc(audio, fs, 'NumCoeffs', 39);

            % Store the features in the cell array
            features{i} = coeffs;
        end

        % Save the features in the structure with the language as the field name
        languageFeatures.(languages{langIdx}) = features;
    end

    % Save the extracted features in separate .mat files for each language
    for langIdx = 1:numel(languages)
        % Construct the full path for the output .mat file
        matFilePath = fullfile(baseFolderPath, [languages{langIdx} '_features.mat']);

        % Retrieve features for the current language
        currentFeatures = languageFeatures.(languages{langIdx});

        % Save the features to the .mat file
        save(matFilePath, 'currentFeatures');
    end
end
