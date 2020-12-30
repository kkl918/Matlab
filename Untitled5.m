clear all; clc;


max = 9900;
t      = 0:1:100;
p_x = 0:1:100;
p_y = max+100:-1:max;
v_x = ones(1,101);
v_y = -.15*ones(1,101);


r_x  = 0:1:100;
r_y  = zeros(1,101);
r_vx = ones(1,101);
r_vy = zeros(1,101);

len    = length(p_x)
f_init = 300;
c      = 3000;

for i=1:101
    if i == 1
        f(i) = f_init;
    else
        f(i) = f(i-1)*(c)/(c-v_y(i));
    end
end

f_raw   = f;
% f_noise = f * randn(1, )



subplot(3,1,1)
plot(p_x,p_y,'g'); hold on;
plot(r_x,r_y,'blue'); hold on;
title('Cassette coordinates')
xlabel('x(meter)')
ylabel('y(meter)')
xlim([-5 105])
ylim([-max/10 1.1*max])
grid on;
% legend('target','observer')

subplot(3,1,2)
plot(t,v_y, 'r'); hold on;
plot(t,r_vy, 'b'); hold on;
title('Velocity')
% xlabel('time(min)')
% ylabel('f(Hz)')
% xlim([-5 105])
grid on;
% legend('target','observer')

subplot(3,1,3)
plot(p_x, f, 'r'); hold on;
title('Time / Frequency')
xlabel('time(min)')
ylabel('f(Hz)')
xlim([-5 105])
grid on;
% legend('target','observer')

