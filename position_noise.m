% position measurement noise
% p_true accuracy 0.05m
% Latitude: 1 deg = 110.574 km
% Longitude: 1 deg = 111.320*cos(latitude) km

Data   = importdata('log_test.txt');
p_dms = [22.595109 120.307937]; % 度分秒
p_ddd = [22.997525 120.218486]; % 十進位


lat = 110574/3600;                    % meter per sec
lon = abs(111320*cos(p_ddd(1)))/3600; % meter per sec
per_sec = [lat lon];

posmeas        = Data.data(:,8:9);
plot(posmeas(:,1),posmeas(:,2),'.-');
temp           =  posmeas - fix(posmeas); % 
fn             = fix(temp*60);            % 整數 -> 分
mi             = (temp*60 -fn)*60;        % 餘數 -> 秒
posmeas_dms    = fix(posmeas) + fn/100 + mi/10000;


bias = bsxfun(@minus,posmeas_dms,p_dms);
bias = bias .* per_sec;

bias_rms = rms(bias);
bias_meter = sqrt(bias_rms(1)^2+bias_rms(2)^2)




