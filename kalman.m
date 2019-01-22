function kalman(duration, dt)

% function kalman(duration, dt)
% 
% Kalman filter simulation fr a vehicle travelling along a road.
% 
% INPUTS
%
%   duration = length of simulation(seconds)
%   dt       = step size(seconds)

meanoise = 10;  % position measurement noise (feet)
accnoise = 0.2; % acceleration noise(feet/sec^2)

dt       = 0.1;
duration = 100;

a    = [1 dt; 0 1];  % transition matrix
b    = [dt^2/2; dt]; % input matrix
c    = [1 0];        % measure matirx
x    = [0; 0];       % initial state vector
xhat = x;            % initial state estimate

Sz   = meanoise^2;                                % measurement error covariance
Sw   = accnoise^2 * [dt^4/4 dt^3/2; dt^3/2 dt^2]; % process noise cov
P    = Sw;                                        % initial estimation covariance

% initialize arrays for latter plotting
pos     = []; % true posiotion array
poshat  = []; % estimated posiotion array
posmeas = []; % measured posiotion array
vel     = []; % true velocity array
velhat  = []; % estimated velocity array

for t = 0:dt:duration,
    % use a constant commanded acceleration of 1 foot/sec^2
    u = 1;
    
    % simulate linear system
    ProcessNoise = accnoise * [(dt^2/2)*randn; dt*randn];
    x = a * x + b * u + ProcessNoise;
    
    % simulate noisy measurement
    MeaNoise = meanoise * randn;
    y = c * x + MeaNoise;
    
    % Extrapolate the most recent state estimate to the present time.
    xhat = a * xhat + b * u;
    
    % From the innovation vector
    Inn = y - c * xhat;
    
    
    % compute the covariance of the Innovation
    s = c * P * c' + Sz;
    
    % Form the Kalman Gain matrix
    K = a * P * c' * inv(s);
    
    % Update the state estimate
    xhat = xhat + K * Inn;
    
    % Compute the covariance of the estimation error
    P = a * P * a' -a * P * c' * inv(s) * c * P * a' + Sw;
    
    % Save some parameters for plotting latter
    pos     = [pos; x(1)];
    posmeas = [posmeas; y];
    poshat  = [poshat; xhat(1)];
    vel     = [vel; x(2)];
    velhat  = [velhat; xhat(2)];
end


% Plot the results
close all
t = 0 : dt :duration;

figure;
plot(t, pos, t, posmeas, t, poshat);
grid;
xlabel('Time(sec)');
ylabel('Position(feet)');
title('Figure(1) - Vehicle Position (True, Measurd, and Estimated)');

figure;
plot(t, pos-posmeas, t, pos-poshat);
grid;
xlabel('Time(sec)');
ylabel('Position Error(feet)');
title('Figure(2) - Position Measurement Error and Posiotion Estimation Error');

figure;
plot(t, vel, t, velhat);
grid;
xlabel('Time(sec)');
ylabel('Velocity(feet/sec)');
title('Figure(3) - Veocity(True and Estimated)');

figure;
plot(t, vel-velhat);
grid;
xlabel('Time(sec)');
ylabel('Velocity Error(feet/sec)');
title('Figure(4) - Veocity Estamation Error)');






    
    
    
    
    
    
    
    
    