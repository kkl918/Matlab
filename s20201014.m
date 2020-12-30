clear all; clc;


X = 1:1:6;
Y = [100 160 160 180 150 130 ];
Z = [0.1  0.3  0.4   0.7  0.8  0.9];

NN = length(X);

muX = sum(X)/NN;
muY = sum(Y)/NN;
muZ = sum(Z)/NN;

%% Cal covarance
covXY = (X - muX)*(Y - muY)'/NN;
covXZ = (X - muX)*(Z - muZ)'/NN;


%% cal var
varX = sum((X - muX).^2)/NN
varY = sum((Y - muY).^2)/NN
varZ = sum((Z - muZ).^2)/NN

%% std
stdX = sqrt(varX);
stdY = sqrt(varY);
stdZ = sqrt(varZ);

%% c
etaXY = covXY / (stdX*stdY);
etaXZ = covXZ / (stdX*stdZ);

%% call function
corrcoef(X,Y)
corrcoef(X,Z)







