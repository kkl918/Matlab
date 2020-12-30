close all; clc; clear all;
a = 1; b=2; c=3; d=4; e=5;

[x y] = meshgrid(-2:0.1:2);

z = -1/c*(a*x.^2 + b*y.^2 + d*x.^2.*y + e);

% display
H1 = mesh(x,y,z);
hold on;  grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');

% 3D noise
noise     = 0.5*randn(size(z));
z_noise = z + noise;

plot3(x, y, z_noise, '.')

% Formulate Y = AX
[NN, MM] = size(x);

Y  = reshape(z_noise, NN*MM, 1);
a1 = reshape(x, NN*MM,1).^2;
a2 = reshape(y, NN*MM,1).^2;
a3 = reshape(x, NN*MM,1).^2.*reshape(y, NN*MM,1);
a4 = ones(NN*MM, 1);
A = [a1 a2 a3 a4];

Xopt  = inv(A'*A)*A'*Y;
a_est = Xopt(1);
b_est = Xopt(2);
d_est = Xopt(3);
e_est = Xopt(4);

% Reconstuct surface using estimated parameters
z_est = a_est*x.^2 + b_est*y.^2 +d_est*x.^2.*y + e_est;
H1     = mesh(x, y, z_est);
set(H1, 'FaceColor', 'none', 'EdgeColor', 'r' );



figure
H1 = mesh(x,y,z);
hold on; grid on;
H2 = mesh(x,y,z_est);
set(H1, 'FaceColor', 'none', 'EdgeColor', 'b' );
set(H2, 'FaceColor', 'none', 'EdgeColor', 'r' );
