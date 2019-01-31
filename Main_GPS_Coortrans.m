close all; clc;clear;

%% import GPS�g�n�����
Data = importdata('GPS_Position.txt'); 
[NN,MM]=size(Data);

%% GPS�n�g���j�a�y��(radian)
LLH = [Data(:,1)*pi/180 Data(:,2)*pi/180 Data(:,3)]; % each GPS (latitude,longitude,ellipsoid height) measurement
%% �g�n����a�ߦa�TXYZ
GXYZ = LLH2GXYZ(LLH); % call llh2xyz_4th function
%% �a�ߦa�TXYZ��NED
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

%% ��XNED���G�æs��txt
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


