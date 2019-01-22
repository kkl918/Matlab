t  = 0:0.001:3*2*pi;
dT = 0.001;
N  = 3;

y1 = sin(10*t);
y2 = sin(13*t);
y3 = sin(20*t);
y4 = sin(30*t);

A1_est = sum(y.*y1*dT)/(N*pi);
A2_est = sum(y.*y2*dT)/(N*pi);
A3_est = sum(y.*y3*dT)/(N*pi);
A4_est = sum(y.*y4*dT)/(N*pi);

A1_est
A2_est
A3_est
A4_est


