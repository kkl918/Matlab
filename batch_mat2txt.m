% ������|:�ק�abs_path��.mat�ɮשҦb���|�����
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

% �۹���|:��batch_mat2txt.m��b�M.mat�P�@�Ӹ�Ƨ�����Y�i
rel_path    = [pwd,'\'];                        % �۹���|
path        = [rel_path,'*.mat'];               % ���|�����ɦW��.mat      
mat_file    = dir(path);                        % .mat�ɮצb�Ҧb���|
n = length(mat_file);                           % .mat�ɮצ��X��
for i=1:n                                       % �妸����
    filename  = mat_file(i).name;               % ��@��.mat�����ɦW
    newname   = strrep(filename,'.mat','.txt'); % ��X�ɦW(��.mat����.txt)
    filepath = [rel_path,'\',filename];         % �۹���|+���ɦW
    new_filepath = [rel_path,newname];          % �۹���|+�s�ɦW
    load(filepath)                              % Ū��.mat
    data       = [TUV.LonLat TUV.U TUV.V];      % ���o��ƫئ��x�}
    data2table = table(data);                   % �x�}�নtable
    writetable(data2table, new_filepath);       % ��X
end