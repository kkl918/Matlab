Data = importdata('500d.txt');
time = Data(:,2);
Temp = Data(:,3);
D    = Data(:,1);
dd   = Data(:,4)

figure
grid on;
subplot(3,1,1)
plot(time, dd);
ylabel('(D/D0)^2');
xlabel('Time');
subplot(3,1,2)
plot(time ,Temp);
ylabel('Temrature');
xlabel('Time')

fit = polyfit(time,D,1);
xfit = [time(1):1:time(end)];
yfit = fit(1)*xfit + fit(2);
subplot(3,1,3)
plot(time ,D);
hold on;
plot(time , D, '.', xfit, yfit,'b');
ylabel('diameter');
xlabel('Time')
%legend('time','diameter','slope');
ta1 = annotation('textarrow', [0.45 0.5], [0.21 0.24]);
slope = num2str(fit(1));
const = num2str(fit(2));
ta1.String = strcat('y = ',slope,'x + ',const);


