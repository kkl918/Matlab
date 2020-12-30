clear all;  clc;

dt         = 0.001;
t           = 0:dt:10;
mu      = 0;
sigma = 2;

NN   = length(t);
data = mu + sigma*randn(NN, 1);
num = 4;
subplot(num,1,1)
plot(t, data); 
hold on; grid on;
xlabel('Time'); ylabel('Votage');
set(gca, 'FontSize', 16)

subplot(num,1,2)
[f x] = hist(data, 100);
bar(x, f); grid on;
xlabel('count'); ylabel('Votage');
set(gca, 'FontSize', 16)

subplot(num,1,3)
f_norm = f / NN;
bar(x, f_norm);
xlabel('count'); ylabel('Votage');
set(gca, 'FontSize', 16)

subplot(num,1,4)
dx   = diff(x);
PDF =f_norm / dx(1) ;
bar(x,PDF);
xlabel('count'); ylabel('Votage');
set(gca, 'FontSize', 16)
hold on;

% subplot(num,1,4)
figure(2)
G_x       = (-4-2*sigma:0.01:4+2*sigma) + mu;
G_PDF = (1/(sigma*sqrt(2*pi)))*exp(-(G_x-mu).^2/(2*sigma^2));
plot(G_x, G_PDF, 'r'); hold on;

bar(x, PDF);
xlabel('count'); ylabel('Votage');
set(gca, 'FontSize', 16)


%%
clear;





