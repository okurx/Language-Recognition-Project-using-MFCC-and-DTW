# Language Recognition Project using Dynamic Time Warping (DTW)

This project implements a language recognition system that utilizes audio feature extraction and the Dynamic Time Warping (DTW) algorithm to identify spoken languages based on Mel-frequency cepstral coefficients (MFCC) extracted from audio files.

## Features

- **MFCC Feature Extraction**: The project extracts MFCC features from audio files in specified languages (Spanish, Korean, Italian, and Chinese).
- **Dynamic Time Warping**: Uses DTW for comparing the extracted features to recognize spoken languages.

### Feature Extraction

The feature extraction code is designed to read audio files from specified directories and extract MFCC features. The extracted features are saved as `.mat` files for each language.

**Code Example**:
```matlab
% Define the base folder paths for feature extraction (train and test datasets)
baseFolderPaths = {'C:\Users\burak\OneDrive\Belgeler\MATLAB\train', ...
                   'C:\Users\burak\OneDrive\Belgeler\MATLAB\test'};
end

**Note**: The DTW function used in this project was adapted from [this GitHub repository](https://github.com/filip141/MFCC-Voice-Recognition/blob/master/DTW.m).
