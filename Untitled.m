clear all; clc;

for sigma =0:0.5:1
    mu      = 1;
%     sigma = 1;
    x          = (-4:0.01:4) +mu;
    PDF    = (1/(sigma*sqrt(2*pi)))*exp(-(x-mu).^2/(2*sigma^2));
    plot(x,PDF); hold on; grid on; pause(1);
end

