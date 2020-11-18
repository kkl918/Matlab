clear all; clc;

dt      = 0.001;
t       = [0:dt:3]';
y       = sin(2*pi*t);
noise   = 0.1*randn(length(t),1);
y_noise = y + noise; 

plot(t, y_noise, 'r'); hold on; grid on;
plot(t, y, 'g')
xlabel('Time(s)')
xlabel('Output')


uin = y_noise;

fc    = 100;
alpha = 1/(1+2*pi*fc*dt);

for i = 1:length(t)
    if i == 1
        uout(i) = (1-alpha)*uin(i);
    else
        uout(i) = alpha*uout(i-1)+(1-alpha)*uin(i);
    end
end


plot(t, uout,'b')
xlabel('Time(s)')
xlabel('Output')
