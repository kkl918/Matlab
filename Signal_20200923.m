clear all; clc;

A = [ 1 2 3;  4 5 6; 7 8 9];

x1 = [1 0]
x2 = [0 1]'

x1*x2

dt              = 0.01;
duration = 0.25;
amp         = 10;

time      = 0:dt:duration;
noise    =  .5*rand(1, length(time));
test0    = amp*sin(2*pi*time);
test1    = amp*sin(2*pi*time) + noise;


plot(time, test0);
hold on;
plot(time, test1);
hold on;

x2 = time.*time
x    = time
figure(2)
plot(x2,x)


% c means speed of sound
c   = 3000;
% f1 = f0*(c+Vr)/(c+Vs); 
% f1 = f0*(c+Vr)/(c+Vs);
