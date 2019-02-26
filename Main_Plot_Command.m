close all;
clear;

Data = importdata('log.txt');

AHRS.Time = Data.data(:,1);
AHRS.RPY = Data.data(:,2:4);
AHRS.Acc = Data.data(:,5:7);
AHRS.POS = Data.data(:,19:20);
AHRS.GPS = Data.data(:,8:10);
AHRS.DOP = Data.data(:,11:12);
%%... Plot Time Trend Data
figure
subplot(4,1,1)
plot(AHRS.Time, AHRS.GPS(:,1))
ylabel('Lat')
subplot(4,1,2)
plot(AHRS.Time, AHRS.GPS(:,2))
ylabel('Lon')
subplot(4,1,3)
plot(AHRS.Time, AHRS.GPS(:,3))
ylabel('Altitude')
subplot(4,1,4)
plot(AHRS.Time, AHRS.DOP(:,1))
ylabel('HDOP')


%%... Plot 2D Data
figure
plot(AHRS.POS(:,2), AHRS.POS(:,1),'.-')
grid on;
ylabel('North')
xlabel('East')
title('PLOT FROM EKF POS')

%%... Plot 2D Data
figure
plot(AHRS.GPS(:,2), AHRS.GPS(:,1),'.-')
grid on;
ylabel('Latitude')
xlabel('Longitude')
zlabel('Altitude')
title('PLOT FROM GPS')

%%... Plot 3D Data
% figure
% plot3(AHRS.GPS(:,2), AHRS.GPS(:,1), AHRS.GPS(:,3),'.-')
% grid on;
% ylabel('Latitude')
% xlabel('Longitude')
% zlabel('Altitude')
% title('PLOT FROM GPS(3D)')

x = R * cos(lat) * cos(lon)

y = R * cos(lat) * sin(lon)

