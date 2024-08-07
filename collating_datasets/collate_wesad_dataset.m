function collate_wesad_dataset
% COLLATE_WESAD_DATASET  Collates individual subjects' data files into 
% a single MATLAB file for analysis.
%   
%  Inputs:
%
%    files    -  a MATLAB file for each individual subject in the WESAD 
%                dataset. Details of how to obtain these MATLAB files are 
%                provided at: https://peterhcharlton.github.io/resources/datasets
%
%  Outputs:
%
%    files    -  a MATLAB file for each activity in the protocol (at baseline
%                and during amusement, stress and meditation), and for all activities.
%
%  Preparation:
%
%    Modify the MATLAB script by inserting the 'up.paths.root_folder' and 
%    'up.paths.save_folder' into the setup_up function.
%
%  Further information: 
%
%   https://peterhcharlton.github.io/info/datasets
%
%  Licence:
%       Available under the MIT License - please see the accompanying
%       file named "MIT_LICENSE.txt"
%
% Author: Peter H. Charlton.

fprintf('\n ~~~ Collating WESAD dataset ~~~')

up = setup_up;

collate_data(up);

end

function up = setup_up

fprintf('\n - Setting up parameters')

% The following root folder contains subfolders for each subject (name
% 'S#' where # is the subject number)
up.paths.root_folder = '/Users/petercharlton/Documents/Data/WESAD/raw_data/';
up.paths.save_folder = '/Users/petercharlton/Documents/Data/WESAD/conv_data/';

% Specify the subject numbers
up.subjs = [2:11,13:17]; % there are 15 subjects in the WESAD dataset, numbered as stated

% Specify sampling frequencies (obtained from the 'PPG_FieldStudy_readme.pdf' document)
up.fs.ppg = 64; % in Hz
up.fs.acc_w = 32; % in Hz
up.fs.eda_w = 4; % in Hz
up.fs.temp_w = 4; % in Hz
up.fs.ecg = 700; % in Hz
up.fs.resp = 700; % in Hz
up.fs.activity = 700; % in Hz

end

function collate_data(up)

% import data from each subject in turn
fprintf('\n - Importing data');
for subj_no = 1:length(up.subjs)
    curr_subj = up.subjs(subj_no);
    
    fprintf('\n   - subject %d', curr_subj);
    
    % Load data (this Matlab file has been created by converting the .pkl
    % file to .mat format.
    subj_path = [up.paths.root_folder, 'S', num2str(curr_subj), filesep, 'S', num2str(curr_subj), '.mat'];
    load(subj_path)  % loads variable called 'pickle_data'
    
    % - import PPG
    master_data(subj_no).ppg.v = pickle_data.signal.wrist.BVP;
    master_data(subj_no).ppg.fs = up.fs.ppg;
    
    % - import ECG
    master_data(subj_no).ecg.v = pickle_data.signal.chest.ECG;
    master_data(subj_no).ecg.fs = up.fs.ecg;
    
    % - Import Resp
    master_data(subj_no).ref.ind.v = pickle_data.signal.chest.Resp;
    master_data(subj_no).ref.ind.fs = up.fs.resp;
    
    % - Import wrist acc
    %    - extract original data
    temp = pickle_data.signal.wrist.ACC;
    %    - convert to milligravitational units (original data range between -128 and +127, where p.17 of the Empatica E4 manual at https://empatica.app.box.com/v/E4-User-Manual states that the default range is +/- 2g.
    temp = temp*(4/256);
    temp = temp.*1000;
    %    - convert to vector magnitudes
    master_data(subj_no).acc_ppg_site.v = sqrt(temp(:,1).^2 + temp(:,2).^2 + temp(:,3).^2);
    %    - add sampling freq
    master_data(subj_no).acc_ppg_site.fs = up.fs.acc_w;
    
    % - Import wrist EDA
    master_data(subj_no).eda_w.v = pickle_data.signal.wrist.EDA;
    master_data(subj_no).eda_w.fs = up.fs.eda_w;
    
    % - Import wrist temp
    master_data(subj_no).temp_w.v = pickle_data.signal.wrist.TEMP;
    master_data(subj_no).temp_w.fs = up.fs.temp_w;
    
    % - Import activity labels
    master_data(subj_no).ref.activity.v = pickle_data.label;
    master_data(subj_no).ref.activity.fs = up.fs.activity; % in Hz
    master_data(subj_no).ref.activity.key.txt = {'not defined', 'baseline', 'stress', 'amusement', 'meditation', 'not defined', 'not defined', 'not defined'};
    master_data(subj_no).ref.activity.key.num = 0:7;
    
    % - Import fixed data
    file_path = [up.paths.root_folder, 'S', num2str(curr_subj), filesep, 'S', num2str(curr_subj), '_readme.txt'];
    readme_data = importfile(file_path);
    master_data(subj_no).fix.subj_name = pickle_data.subject;
    master_data(subj_no).fix.age = readme_data.age;
    master_data(subj_no).fix.weight = readme_data.weight;
    master_data(subj_no).fix.height = readme_data.height;
    master_data(subj_no).fix.gender = readme_data.gender;
    master_data(subj_no).fix.units.age = 'years';
    master_data(subj_no).fix.units.weight = 'kg';
    master_data(subj_no).fix.units.height = 'cm';
    
    clear readme_data subj_path pickle_data file_path curr_subj
end
clear subj_no

% split data into different activities
fprintf('\n - Splitting data into different activities')
acts.num = master_data(1).ref.activity.key.num;
acts.txt = master_data(1).ref.activity.key.txt;
% Add in "all activities"
acts.num(end+1) = acts.num(end)+1;
acts.txt{end+1} = 'all_activities';
% - cycle through activities
for act_no = 1 : length(acts.txt)
    curr_act_no = acts.num(act_no);
    curr_act_txt = acts.txt{act_no};
    
    if strcmp(curr_act_txt, 'not defined')
        continue
    end
    
    % copy master data
    data = master_data;
    
    % eliminate data for each subject in turn which weren't recorded during
    % this activity
    subjs_to_keep = [];
    for subj_no = 1 : length(data)
        
        % identify periods of this activity
        if strcmp(curr_act_txt, 'all_activities')
            periods.deb = find(data(subj_no).ref.activity.v~=0, 1, 'first');
            periods.fin = find(data(subj_no).ref.activity.v~=0, 1, 'last');
        else
            periods.deb = find(data(subj_no).ref.activity.v(2:end)==curr_act_no & ...
                data(subj_no).ref.activity.v(1:end-1)~=curr_act_no);
            periods.fin = find(data(subj_no).ref.activity.v(1:end-1)==curr_act_no & ...
                data(subj_no).ref.activity.v(2:end)~=curr_act_no);
        end
        % check there is at least one period of this activity, otherwise skip
        if isempty(periods.deb)
            fprintf('\n      - No %s data found for subj %s', curr_act_txt, data(subj_no).fix.subj_name);
            continue
        end
        subjs_to_keep = [subjs_to_keep, subj_no];
        % check there is no more than one period of this activity
        if length(periods.deb)~=1
            fprintf('      - There were %d periods of %s for subj %s, so used first one (lasting %.1f secs)', length(periods.deb), curr_act_txt, data(subj_no).fix.subj_name, (periods.fin(1)-periods.deb(1))/data(subj_no).ref.activity.fs)
        end
        
        % - identify periods of this activity
        t_deb = periods.deb(1)/data(subj_no).ref.activity.fs;
        t_fin = periods.fin(1)/data(subj_no).ref.activity.fs;
        
        % - go through signals
        sigs = {'ppg', 'ecg', 'ref.ind', 'acc_ppg_site', 'eda_w', 'temp_w'};
        for sig_no = 1 : length(sigs)
            curr_sig_nom = sigs{sig_no};
            eval(['curr_sig_data = data(subj_no).' curr_sig_nom ';']);
            t = [0:length(curr_sig_data.v)-1]./curr_sig_data.fs;
            rel_t = t>= t_deb & t <= t_fin;
            curr_sig_data.v = curr_sig_data.v(rel_t);
            eval(['data(subj_no).' curr_sig_nom ' = curr_sig_data;']);
        end
        
        % - remove irrelevant data
        data(subj_no).ref = rmfield(data(subj_no).ref, 'activity');
        data(subj_no).fix.activity = curr_act_txt;
        
    end
    
    % eliminate subjects without data for this period
    data = data(subjs_to_keep);
    
    % add source details
    source.date_of_conversion = datetime('now');
    source.matlab_conversion_script = [mfilename('fullpath'), '.m'];
    source.raw_data_path = up.paths.root_folder;
    
    % save data for this activity
    fprintf('\n   - Saving data for %s', curr_act_txt)
    save([up.paths.save_folder, 'wesad_', strrep(curr_act_txt, ' ', '_'), '_data'], 'data', 'source')
    clear data
    
end

fprintf('\n\n - NB: this dataset also contains additional variables measured by the chest sensor which have not been imported');

fprintf('\n\n ~~~ DONE ~~~')

end

function readme_data = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  S2README = IMPORTFILE(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as a table.
%
%  S2README = IMPORTFILE(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  S2readme = importfile("/Users/petercharlton/Documents/Data/WESAD/raw_data/S2/S2_readme.txt", [2, 6]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 21-May-2021 06:45:20

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ":";

% Specify column names and types
opts.VariableNames = ["Personalinformation", "VarName2"];
opts.VariableTypes = ["string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "Personalinformation", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "Personalinformation", "EmptyFieldRule", "auto");

% Import the data
readme_txt = readtable(filename, opts);

% convert to variables for output
vars = {'Age', 'Height', 'Weight', 'Gender'};
for var_no = 1 : length(vars)
    curr_var = vars{var_no};
    rel_row = find(contains(readme_txt.Personalinformation, curr_var));
    temp = readme_txt.VarName2(rel_row);
    temp2 = str2double(temp);
    if ~isnan(temp2)
        temp = temp2;
    end
    eval(['readme_data.' lower(curr_var) ' = temp;']);
end

end
