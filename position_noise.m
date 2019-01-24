% position measurement noise
% p_ddd,p_dms accuracy 0.05m
% Latitude: 1 deg = 110.574 km
% Longitude: 1 deg = 111.320*cos(latitude) km
clear;

Data  = importdata('log_stand.txt');
p_dms = [22.59510989 120.13078371]; % 度分秒
p_ddd = [22.997528 120.218842];     % 十進位


lat = 110574/3600;                      % 1秒幾公尺(度分秒)
lon = abs(111320*cos(22.997528)/3600);  % 1秒幾公尺(度分秒)

posmeas_ddd = Data.data(:,8:9);                           % 量測位置(十進位)
%posmeas_ddd = posmeas_ddd([500000:end],:);                % 去除前五十萬筆量測位置值
bias_ddd    = bsxfun(@minus,posmeas_ddd,p_ddd);           % 誤差 = 量測位置(?) - 預設答案(精確度0.05m)
temp        = bias_ddd - fix(bias_ddd);                   % ddd2dms轉換過程
fn          = fix(temp*60);                               % 整數 -> 分(都是零)
mi          = (temp*60 -fn)*60;                           % 餘數 -> 秒
bias_dms    = fn/100 + mi/10000;                          % 量測位置轉成度分秒(可以跳過這步驟)
bias_meter  = [mi(:,1)*lat mi(:,2)*lon];                  % 誤差從秒轉成公尺(分都是零，所以只有秒有值)
rms_meter   = sqrt(sum(bias_meter.^2)/length(bias_meter));% rms in meter

rmsE_temp  = [bias_meter(:,1)-rms_meter(1) bias_meter(:,2)-rms_meter(1)];
rmsE_meter = sqrt(sum(rmsE_temp.^2)/length(rmsE_temp));

noise_rms  = sqrt(rms_meter(1)^2+rms_meter(2)^2)         % 
noise_rmse = sqrt(rmsE_meter(1)^2+rmsE_meter(2)^2)       % 


k = bias_meter([1:100000],:);
k1 = k([1:end],:);
z = zeros(1,length(k));



quiver(0,0,1,1,1)
grid on




