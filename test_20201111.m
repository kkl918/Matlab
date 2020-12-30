clear all; clc;

t      = 0:1:100;
NN = length(t);
x     = 0:1:100;
y     = 10000:-1:9900;
vx  = [0, x(1:end-1) - x(2:end)];
vy = [0,  y(1:end-1) - y(2:end)];


% vs : velocity of sound(m/s)
% f0 : initial frequence(Hz)
vs = 3000;
f0 = 300;

% Add noise
xs   =  x + randn(1,NN);

% Doppler effect
% f2 = (vs + v_receive)/(vs + v_source)*f1
% f2 = (vs + v_receive)/(vs - v_source)*f1
% f2 = (vs - v_receive)/(vs + v_source)*f1
% f2 = (vs - v_receive)/(vs - v_source)*f1
% added to vs if the receiver is moving towards the source,     subtracted if the receiver is moving away from the source.
% added to vs if the source is moving away from the receiver, subtracted if the source is moving towards the receiver.
f_raw    = [300];
for i = 1:NN
    
     f_raw(i) = (vs + vx(i))/vs*f_raw(i)
end
% f_noise = f_raw + randn(1,NN);

plot(t, f_raw); hold on;
% plot(t, f_noise);

% ylim([295 305])



% plot(t, f)

% plot(t, vx); hold on;
% plot(t, vy);
% xlim([0 100])
% ylim([-2 2])
% legend('velocity x')

% title('xy-plane')
% xlabel('x')
% ylabel('y')
