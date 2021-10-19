function physionet_cinc_2017_challenge_data_collator
% PHYSIONET_CINC_2017_CHALLENGE_DATA_COLLATOR collates data from the 
% Physionet CinC 2017 Challenge into a single Matlab file for analysis. 
%
%  Inputs:
%
%    files    -  Files containing the training data and reference rhythm 
%                labels from: 
%                       https://physionet.org/content/challenge-2017/1.0.0/
%                Details of how to obtain these files are provided at: 
%                       https://peterhcharlton.github.io/info/datasets
%
%  Outputs:
%
%    file     -  a single MATLAB file for the whole dataset, containing 
%                30-second ECG recordings, alongside reference labels of
%                the heart rhythm.
%
%  Preparation:
%
%    Modify this MATLAB script by inserting the 'up.paths.training_data_folder', 'up.paths.training_data_labels', and 
%    'up.paths.conv_data_folder' into the setup_up function.
%
%  Further information: 
%
%   https://peterhcharlton.github.io/info/datasets
%
%  Licence:
%       Available under the MIT License - please see the accompanying
%       file named "MIT_LICENSE.txt"
%
% Author: Peter H. Charlton, October 2021.

fprintf('\n - Collating CINC 2017 Challenge ECG data and reference labels')

% - setup universal parameters
up = setup_up;

% - obtain reference labels of the heart rhythm
labels = import_ecg_labels(up);

% - import 30-second ECG recordings, and save as a single data file
data = import_data(labels, up);

end

function up = setup_up

fprintf('\n - Setting up universal parameters')

%%%%% Specify location of training data %%%%%%
up.paths.training_data_folder = '/Users/petercharlton/Documents/Data/CINC2017/raw_data/training2017/';
% This specifies the location of the folder containing the training data. 
% The folder (training2017.zip) can be downloaded from:
%     https://physionet.org/content/challenge-2017/1.0.0/#files-panel
% It should be unzipped, and then the location of the resulting folder specified in this field.

%%%%% Specify location of training data labels %%%%%%
up.paths.training_data_labels = '/Users/petercharlton/Documents/Data/CINC2017/raw_data/training2017/REFERENCE-v3.csv';
% This specifies the location of the CSV file containing the training data. 
% The file (REFERENCE-v3.csv) can be downloaded from:
%     https://physionet.org/content/challenge-2017/1.0.0/#files-panel
% I chose to use version 3 of the labels based on the following discussion on the Challenge Forum in Nov 2017:
%     https://groups.google.com/g/physionet-challenges/c/XPtREOd8yyE/m/mWYLjV4PCwAJ

%%%%% Specify folder in which to save collated data %%%%%
up.paths.conv_data_folder = '/Users/petercharlton/Documents/Data/CINC2017/conv_data/';

% Additional paths
up.paths.conv_data = [up.paths.conv_data_folder, 'conv_data.mat'];

% Checks
% - file
if ~exist(up.paths.training_data_labels, 'file')
    fprintf('\n ~~~ In the ''setup_up'' function,\n please specify the location of\n the training data labels file\n (in up.paths.training_data_labels)\n')
    error('Folder doesn''t exist')
end
% - folders
req_folders = {up.paths.conv_data_folder, up.paths.training_data_folder};
for folder_no = 1 : length(req_folders)
    curr_folder = req_folders{folder_no};
    if ~exist(curr_folder, 'dir')
        fprintf('\n ~~~ In the ''setup_up'' function,\n please specify the location of\n this folder:\n %s\n', curr_folder)
        error('Folder doesn''t exist')
    end
end
        
% Additional settings
up.fs = 300; % sampling freq in Hz
up.min_duration = 30; % minimum duration for inclusion in dataset
up.max_duration = 30; % maximum duration for inclusion in dataset

end

function labels = import_ecg_labels(up)

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["recID", "label"];

labels = readtable(up.paths.training_data_labels, opts);

end

function data = import_data(labels, up)

fprintf('\n - Importing data from individual files into one ''converted data'' file')

rec_counter = 0;
durns = nan(length(labels.recID),1);
for rec_no = 1 : length(labels.recID)
    curr_recID = labels.recID{rec_no};
    
    % load this recording
    filename = [up.paths.training_data_folder, curr_recID, '.mat'];
    if exist(filename, 'file')
        ecg = load(filename);
    else
        continue
    end
    
    % check whether it is of sufficient duration
    durn = length(ecg.val)/up.fs; % duration of recording in secs
    durns(rec_no) = durn;
    if durn < up.min_duration || durn > up.max_duration
        continue
    end
    
    % include this recording
    rec_counter = rec_counter+1;
    data(rec_counter).ecg.v = ecg.val(:);
    data(rec_counter).ecg.fs = up.fs;
    data(rec_counter).label = labels.label{rec_no};
    data(rec_counter).recID = labels.recID{rec_no};
    
    % reduce the ECG data to an integer vector if possible
    reduce_to_integer = 0;
    if reduce_to_integer
        if isequal(data(rec_counter).ecg.v, int16(data(rec_counter).ecg.v))
            data(rec_counter).ecg.v = int16(data(rec_counter).ecg.v);
        end
    end
    
end

% output results
extracted_labels = extractfield(data, 'label');
fprintf('\n Collated data from %d recordings, out of a possible %d recordings.', rec_counter, rec_no)
fprintf('\n  - %d recordings labelled as Atrial Fibrillation', sum(strcmp(extracted_labels, 'A')))
fprintf('\n  - %d recordings labelled as Normal Sinus Rhythm', sum(strcmp(extracted_labels, 'N')))
fprintf('\n  - %d recordings labelled as Other Rhythm', sum(strcmp(extracted_labels, 'O')))
fprintf('\n  - %d recordings labelled as Noisy', sum(strcmp(extracted_labels, '~')))

% save the collated data file
save(up.paths.conv_data, 'data')

end














