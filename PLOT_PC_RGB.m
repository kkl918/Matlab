close all; clear; clc;

addpath('PointCloud_File');
%%... 定義檔名
File_Name = '20190129_成大自強校區_PC_TW97.txt';

%%... 讀取檔案(速度慢)
% PC_RGB=importdata(File_Name);

%%... 讀取檔案(速度快)
fid = fopen(File_Name,'r');
data_fread_str = fread(fid,'uint8=>char');
data_freadsscanf = sscanf(data_fread_str, '%f');
PC_RGB = reshape(data_freadsscanf,9,[])';

%%... 萃取點雲與色彩
PC = PC_RGB(:,1:3);
RGB = uint8(PC_RGB(:,4:6));

%%... 繪製點雲圖
figure
ptCloud_Colored = pointCloud(PC, 'Color', RGB); % 3D colored point cloud
pcshow(ptCloud_Colored);
xlabel('X(meter)')
ylabel('Y(meter)')
zlabel('Z(meter)')
