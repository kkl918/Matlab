close all;
clear;

Data = importdata('500n.txt');

AHRS.Time = Data.data(:,5);
AHRS.D = Data.data(:,6);
AHRS.T = Data.data(:,7);


%%... Plot Time Trend Data
figure
subplot(3,1,1)
%plot(AHRS.Time, AHRS.GPS(:,1))
subplot(3,1,2)
%plot(AHRS.Time, AHRS.GPS(:,2))
subplot(3,1,3)
%plot(AHRS.Time, AHRS.GPS(:,3))

%%... Plot 2D Data
figure
%plot(AHRS.GPS(:,2), AHRS.GPS(:,1),'.-')
grid on;
ylabel('Latitude')
xlabel('Longitude')
zlabel('Altitude')

%%... Plot 3D Data
figure
%plot3(AHRS.GPS(:,2), AHRS.GPS(:,1), AHRS.GPS(:,3),'.-')
grid on;
ylabel('Latitude')
xlabel('Longitude')
zlabel('Altitude')



