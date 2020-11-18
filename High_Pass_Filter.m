clear all; clc;

dt      = 0.001;
t       = [0:dt:10]';
y       = sin(2*pi*t*5);
noise   = 2.5;
noise   = 25;
% noise   = 0.2*sin(2*pi*0.1*t);
y_noise = y + noise; 

plot(t, y_noise, 'r'); hold on; grid on;
plot(t, y, 'b')
xlabel('Time(s)')
xlabel('Output')
%%

uin = y_noise;

fc    = 0.5;
alpha = 1/(1+2*pi*fc*dt);

for i = 1:length(t)
    if i == 1
        uout(i) = (1-alpha)*uin(i);
    else
        uout(i) = alpha*uout(i-1) + alpha*((uin(i)-uin(i-1)));
    end
end


plot(t, uout,'k--')
xlabel('Time(s)')
xlabel('Output')
