% 絕對路徑:修改abs_path為.mat檔案所在路徑後執行
% rel_path    = 'H:\';
% path        = [rel_path,'*.mat'];
% mat_file    = dir(path);
% n = length(mat_file);
% for i=1:n
%     filename  = mat_file(i).name;
%     newname   = strrep(filename,'.mat','.txt');
%     filepath = [rel_path,'\',filename];
%     new_filepath = [rel_path,newname];
%     load(filepath)
%     data       = [TUV.LonLat TUV.U TUV.V];
%     data2table = table(data);
%     writetable(data2table, new_filepath);
% end

% 相對路徑:把batch_mat2txt.m放在和.mat同一個資料夾執行即可
rel_path    = [pwd,'\'];                        % 相對路徑
path        = [rel_path,'*.mat'];               % 路徑中副檔名為.mat      
mat_file    = dir(path);                        % .mat檔案在所在路徑
n = length(mat_file);                           % .mat檔案有幾筆
for i=1:n                                       % 批次執行
    filename  = mat_file(i).name;               % 單一個.mat完整檔名
    newname   = strrep(filename,'.mat','.txt'); % 輸出檔名(把.mat換成.txt)
    filepath = [rel_path,'\',filename];         % 相對路徑+原檔名
    new_filepath = [rel_path,newname];          % 相對路徑+新檔名
    load(filepath)                              % 讀取.mat
    data       = [TUV.LonLat TUV.U TUV.V];      % 取得資料建成矩陣
    data2table = table(data);                   % 矩陣轉成table
    writetable(data2table, new_filepath);       % 輸出
end