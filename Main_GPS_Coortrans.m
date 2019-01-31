close all; clc;clear;

%% import GPS經緯高資料
Data = importdata('GPS_Position.txt'); 
[NN,MM]=size(Data);

%% GPS緯經高大地座標(radian)
LLH = [Data(:,1)*pi/180 Data(:,2)*pi/180 Data(:,3)]; % each GPS (latitude,longitude,ellipsoid height) measurement
%% 經緯高轉地心地固XYZ
GXYZ = LLH2GXYZ(LLH); % call llh2xyz_4th function
%% 地心地固XYZ轉NED
P0 = GXYZ(1,:);  %%... choose center point
Pc = GXYZ - repmat(P0,NN,1);
NED = GXYZ2NED(Pc,LLH); % call xyz2ned_4th function

figure;
plot3(GXYZ(:,1),GXYZ(:,2),GXYZ(:,3),'.');
hold on; grid on;
title('Geographic coordinate system to Earth-Centered Earth-Fixed coordinate system');
xlabel('X');
ylabel('Y');
zlabel('Z');

figure;
plot3(NED(:,1),NED(:,2),NED(:,3),'.');
hold on; grid on;
title('Earth-Centered Earth-Fixed coordinate system to Local coordinate system');
xlabel('N (meters)');
ylabel('E (meters)');
zlabel('D (meters)');

%% 輸出NED結果並存成txt
fid = fopen('C:\Users\user\Desktop\log_4th\GPS_Coortrans_pos.txt','wt');
                
[m,n]=size(eceftoned);
 for h=1:1:m
   for w=1:1:n
      if w==n
        fprintf(fid,'%.7f\n',eceftoned(h,w));
     else
       fprintf(fid,'%.7f\t',eceftoned(h,w));
      end
   end
end
fclose(fid);


