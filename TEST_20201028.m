clear all; clc;

%% Smooth Signal
t  = 0:1e-6:1;
f = 110;
y = sin(2*pi*f*t);

%% Sampled Signal
fs = 100;
Ts =1/fs;
ts = 0:Ts:1;
ys = sin(2*pi*f*ts);

figure
plot(t,y); hold on; grid on;
xlabel('Time(s)')
ylabel('Signal')

plot(ts, ys, 'ro-')
legend('Origin Signal', 'Sampling Signal')
title(sprintf('%.1fHz signal sampled by %.1fHz sampler', f , fs))
set(gca,  'FontSize', 14)