function [filters] = absorptionGEQ(RT, delays, fs)
% absorptionGEQ - Design GEQ absorption filters according to specified T60
%
% Schlecht, S., Habets, E. (2017). Accurate reverberation time control in
% feedback delay networks Proc. Int. Conf. Digital Audio Effects (DAFx)
%
% Syntax:  [b,a] = absorptionGEQ(RT, delays, fs)
%
% Inputs:
%    RT - Reverberation time in [seconds] at ten frequency bands
%    delays - Array of delay times in [samples]
%    fs - Sampling frequency
%
% Outputs:
%    b - Filter numerator % TODO fix output argument documentation
%    a - Filter denominators
%
% Example:
%    [b,a] = absorptionGEQ(ones(10,1), [100, 130], 48000)
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also:
% Author: Dr.-Ing. Sebastian Jiro Schlecht,
% Aalto University, Finland
% email address: sebastian.schlecht@aalto.fi
% Website: sebastianjiroschlecht.com
% 17. January 2020; Last revision: 17. January 2020

N = length(delays);

%% Convert T60 to magnitude response

targetG = RT602slope(RT,fs); % dB

%% Design delay proportional filters
numberOfBands = numel(targetG) + 1;
filters = zeros(N,1,numberOfBands,6);
for it = 1:N
    optimalSOS = designGEQ( targetG * delays(it) );
    filters(it,:,:,:) = optimalSOS;
end


