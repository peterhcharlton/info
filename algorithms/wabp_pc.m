function r = wabp_pc(abp)
% WABP  ABP waveform onset detector.
%   r = WABP(ABP) obtains the onset time (in samples) 
%       of each beat in the ABP waveform.
%
%   In:   ABP (125Hz sampled)
%   Out:  Onset sample time
% 
%   Usage:
%   - ABP waveform must have units of mmHg
%
%   Written by James Sun (xinsun@mit.edu) on Nov 19, 2005.  This ABP onset
%   detector is adapted from Dr. Wei Zong's wabp.c.
%
%   Modified by PC on 29-Oct-2015 as follows:
%   - Removed input checks
%   - Added step to ensure correct orientation of input vector
%   - Added/modified comments to try to make the code clearer to the non-expert
%   - Changed period of initial threshold calculation to 10 s to be in keeping with the paper.
%   - Removed a "+5" in the initial "if" clause to determine if SSF has exceeded threshold.
%   - Changed window length around the SSF threshold-crossing point to be in keeping with the paper.
%   - Added check to see if there is at least 10 secs of data.
%
%  Source: This code has been modified from 'wabp.m', which is available in PhysioNet:
%              https://physionet.org/content/cardiac-output/1.0.0/code/2analyze/wabp.m
%
%  Licence: Open Data Commons Attribution License v1.0

%% Setup

% ensure correct orientation of input vector
abp = abp(:);

% scale physiologic ABP
offset   = 1600;
scale    = 20;
Araw     = abp*scale-offset;

%% LPF
A = filter([1 0 0 0 0 -2 0 0 0 0 1],[1 -2 1],Araw)/24+30;
A = (A(4:end)+offset)/scale; % Takes care of 4 sample group delay

%% Slope-sum function
dypos          = diff(A);
dypos(dypos<0) = 0;
ssf            = [0; 0; conv(ones(16,1),dypos)];   % Produce analysing window of 128 ms

%% Decision rule
if length(ssf)<(125*10)
    % less than 10 secs of data so don't perform beat detection
    r = [];
    return
end

avg0       = mean(ssf(1:(125*10)));   % average of 1st 10 seconds of SSF (changed by PC)
Threshold0 = 3*avg0;                  % initial decision threshold

% ignoring "learning period" for now
lockout    = 0;    % lockout >0 means we are in refractory
timer      = 0;    % Timer used for counting time since previous ABP pulse
z          = zeros(100000,1);   % Stores the indices of the detected beats
counter    = 0;    % Counter of number of beats detected

for t = 50:length(ssf)-19       % PC changed to 19 to be in keeping with the change below (which satisfies 150 ms)
    lockout = lockout - 1;      % increase lockout by 1 sample
    timer   = timer   + 1;      % Timer used for counting time after previous ABP pulse

    if (lockout<1) && (ssf(t)>avg0)  % Not in refractory and SSF has exceeded threshold here (pc changed from "(lockout<1) & (ssf(t)>avg0)")
        timer = 0;
        maxSSF = max(ssf(t:t+19));  % Find local max of SSF
        minSSF = min(ssf(t-19:t));  % Find local min of SSF  - pc changed to 19 to fit in with the 150 ms in the paper
        if maxSSF > (minSSF + 10)
            onset = 0.01*maxSSF ;  % Onset is at the time in which local SSF just exceeds 0.01*maxSSF

            tt       = t-16:t;
            dssf     = ssf(tt) - ssf(tt-1);
            BeatTime = find(dssf<onset,1,'last')+t-17;
            counter  = counter+1;

            if isempty(BeatTime)
                counter = counter-1;
            else
                z(counter) = BeatTime;
            end
            Threshold0 = Threshold0 + 0.1*(maxSSF - Threshold0);  % adjust threshold
            avg0 = Threshold0 / 3;        % adjust avg

            lockout = 32;   % lock so prevent sensing right after detection (refractory period)
        end
    end

    if timer > 312  % Lower threshold if no pulse detection for a while
        Threshold0 = Threshold0 - 1;
        avg0       = Threshold0/3;
    end
end
r = z(find(z))-2;
