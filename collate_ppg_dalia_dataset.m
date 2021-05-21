function collate_ppg_dalia_dataset
% COLLATE_PPG_DALIA_DATASET  Collates individual subjects' data files into 
% a single MATLAB file for analysis.
%   
%  Inputs:
%
%    files    -  a MATLAB file for each individual subject in the PPG-DaLiA 
%                dataset. Details of how to obtain these MATLAB files are 
%                provided at: https://peterhcharlton.github.io/resources/datasets
%
%  Outputs:
%
%    files    -  a MATLAB file for each activity in the protocol (car driving, 
%                cycling, in a lunch break, sitting, stair climbing, playing 
%                table soccer, walking and working)
%
%  Preparation:
%
%    Modify the MATLAB script by inserting the 'up.paths.root_folder' and 
%    'up.paths.save_folder' into the setup_up function.
%
%  Further information: 
%
%   https://peterhcharlton.github.io/resources/datasets
%
%  Licence:
%       Available under the MIT License - please see the accompanying
%       file named "MIT_LICENSE.txt"
%
% Author: Peter H. Charlton, May 2021.

fprintf('\n ~~~ Collating PPG DaLiA dataset ~~~')

up = setup_up;

collate_data(up);

end

function up = setup_up

fprintf('\n - Setting up parameters')

% The following root folder contains subfolders for each subject (name
% 'S#' where # is the subject number)
up.paths.root_folder = '/Users/petercharlton/Documents/Data/PPG-DaLiA/';
up.paths.save_folder = '/Users/petercharlton/Documents/Data/ppg_dalia/conv_data/';

% Specify the subject numbers
up.subjs = 1 : 15; % there are 15 subjects in the PPG Dalia dataset, numbered from 1 to 15

% Specify sampling frequencies (obtained from the 'PPG_FieldStudy_readme.pdf' document)
up.fs.ppg = 64; % in Hz
up.fs.acc_w = 32; % in Hz
up.fs.eda_w = 4; % in Hz
up.fs.temp_w = 4; % in Hz
up.fs.ecg = 700; % in Hz
up.fs.resp = 700; % in Hz
up.fs.activity = 4; % in Hz
up.fs.hr = 0.5; % every 2 secs (based on 8 sec window)

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
    master_data(subj_no).ecg.rpeaks = double(pickle_data.rpeaks);
    
    % - Import Resp
    master_data(subj_no).ref.ind.v = pickle_data.signal.chest.Resp;
    master_data(subj_no).ref.ind.fs = up.fs.resp;
    
    % - Import wrist acc
    master_data(subj_no).acc_w.v = pickle_data.signal.wrist.ACC;
    master_data(subj_no).acc_w.fs = up.fs.acc_w;
    
    % - Import wrist EDA
    master_data(subj_no).eda_w.v = pickle_data.signal.wrist.EDA;
    master_data(subj_no).eda_w.fs = up.fs.eda_w;
    
    % - Import wrist temp
    master_data(subj_no).temp_w.v = pickle_data.signal.wrist.TEMP;
    master_data(subj_no).temp_w.fs = up.fs.temp_w;
    
    % - Import HR
    master_data(subj_no).ref.param.hr.v = pickle_data.label;
    master_data(subj_no).ref.param.hr.fs = up.fs.hr;
    master_data(subj_no).ref.param.hr.offset = 'unknown';
    master_data(subj_no).ref.param.units.hr = 'bpm';
    
    % - Import activity labels
    master_data(subj_no).ref.activity.v = pickle_data.activity;
    master_data(subj_no).ref.activity.fs = up.fs.activity; % in Hz
    master_data(subj_no).ref.activity.key.txt = {'no activity', 'sitting', 'stair climbing', 'table soccer', 'cycling', 'car driving', 'lunch break', 'walking', 'working'};
    master_data(subj_no).ref.activity.key.num = 0:8;
    
    % - Import fixed data
    master_data(subj_no).fix.subj_name = pickle_data.subject;
    master_data(subj_no).fix.age = pickle_data.questionnaire.AGE;
    master_data(subj_no).fix.weight = pickle_data.questionnaire.WEIGHT;
    master_data(subj_no).fix.height = pickle_data.questionnaire.HEIGHT;
    master_data(subj_no).fix.gender = pickle_data.questionnaire.Gender;
    master_data(subj_no).fix.skin_type = pickle_data.questionnaire.SKIN; % Fitzpatrick scale
    master_data(subj_no).fix.exercise_freq = pickle_data.questionnaire.SPORT; % How often they exercise per week (although not exactly - see readme)
    master_data(subj_no).fix.units.age = 'years';
    master_data(subj_no).fix.units.weight = 'kg';
    master_data(subj_no).fix.units.height = 'cm';
    master_data(subj_no).fix.units.skin_type = 'Fitzpatrick scale, as specified in ﻿https://doi.org/10.1001/archderm.1988.01670060015008';
    master_data(subj_no).fix.units.exercise_freq = 'How often they exercise, roughly per week, although not quite (see dataset readme file)';
    
    clear curr_subj pickle_data subj_path
end
clear subj_no

% split data into different activities
fprintf('\n - Splitting data into different activities')
acts.num = master_data(1).ref.activity.key.num;
acts.txt = master_data(1).ref.activity.key.txt;
% - cycle through activities
for act_no = 1 : length(acts.txt)
    curr_act_no = acts.num(act_no);
    curr_act_txt = acts.txt{act_no};
    
    if strcmp(curr_act_txt, 'no activity')
        continue
    end
    
    % copy master data
    data = master_data;
    
    % eliminate data for each subject in turn which weren't recorded during
    % this activity
    subjs_to_keep = [];
    for subj_no = 1 : length(data)
        
        
        % identify periods of this activity
        periods.deb = find(data(subj_no).ref.activity.v(2:end)==curr_act_no & ...
            data(subj_no).ref.activity.v(1:end-1)~=curr_act_no);
        periods.fin = find(data(subj_no).ref.activity.v(1:end-1)==curr_act_no & ...
            data(subj_no).ref.activity.v(2:end)~=curr_act_no);
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
        % (note that t_fin doesn't seem to correspond exactly to the data in S1_activity.csv, but it's pretty close)
        
        clear periods
        
        % - go through signals
        sigs = {'ppg', 'ecg', 'ref.ind', 'acc_w', 'eda_w', 'temp_w'};
        for sig_no = 1 : length(sigs)
            curr_sig_nom = sigs{sig_no};
            eval(['curr_sig_data = data(subj_no).' curr_sig_nom ';']);
            t = [0:length(curr_sig_data.v)-1]./curr_sig_data.fs;
            rel_t = t>= t_deb & t <= t_fin;
            curr_sig_data.v = curr_sig_data.v(rel_t);
            eval(['data(subj_no).' curr_sig_nom ' = curr_sig_data;']);
            
            if strcmp(curr_sig_nom, 'ecg')
                % - modify rpeak annotations
                curr_rpeaks = data(subj_no).ecg.rpeaks;
                rel_els_deb = find(t>= t_deb,1);
                rel_els_fin = find(t <= t_fin,1,'last');
                curr_rpeaks = curr_rpeaks(curr_rpeaks>= rel_els_deb & curr_rpeaks <= rel_els_fin);
                curr_rpeaks = curr_rpeaks - rel_els_deb(1) + 1; % adjust rpeaks to start at the start of this period
                data(subj_no).ecg.rpeaks = curr_rpeaks;
                clear curr_rpeaks rel_els*
                
                % check this has worked
                do_check = 0;
                if do_check
                    plot(data(subj_no).ecg.v), hold on
                    plot(data(subj_no).ecg.rpeaks, data(subj_no).ecg.v(data(subj_no).ecg.rpeaks), 'or')
                    waitfor(gcf)
                end
                clear do_check
            end
            clear curr_sig_data curr_sig_nom rel_t t
        end
        clear t_deb t_fin sig_no sigs
        
        % - remove irrelevant data
        data(subj_no).ref = rmfield(data(subj_no).ref, 'activity');
        data(subj_no).fix.activity = curr_act_txt;
        
    end
    
    % eliminate subjects without data for this period
    data = data(subjs_to_keep);
    clear subjs_to_keep
    
    % add source details
    source.date_of_conversion = datetime('now');
    source.matlab_conversion_script = [mfilename('fullpath'), '.m'];
    source.raw_data_path = up.paths.root_folder;
    
    % save data for this activity
    fprintf('\n   - Saving data for %s', curr_act_txt)
    save([up.paths.save_folder, 'ppg_dalia_', strrep(curr_act_txt, ' ', '_'), '_data'], 'data', 'source')
    clear data curr_act_no curr_act_txt source
    
end

fprintf('\n\n - NB: this dataset also contains additional variables measured by the chest sensor which have not been imported');

fprintf('\n\n ~~~ DONE ~~~')

end