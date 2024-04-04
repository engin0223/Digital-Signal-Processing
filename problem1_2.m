clear; close all;

fs = 100; Nx=100;         % sampling frequency (samples per second), number of samples
dt = 1/fs;                % sampling period = distance between two samples in seconds 
n = 0 : Nx-1;             % indexes of samples 
t = dt*n;                 % sampling times (many moments)
A1=1; f1=1; f2=fs+f1; f3=2*fs+f1; p1=pi/4;

x1 = A1*sin(2*pi*f1*t+p1);
x2 = A1*sin(2*pi*f2*t+p1);
x3 = A1*sin(2*pi*f3*t+p1);

figure(1)
hold on
plot(t,x1,'o-');
plot(t,x2,'+-');
plot(t,x3,'*-');

legend("f1", "fs+f1", "2fs+f1"); grid; title('Signal x(t)'); xlabel('time [s]'); ylabel('Amplitude');

f1=1; f2=fs-f1; f3=2*fs-f1;

x1 = A1*sin(2*pi*(-f1)*t+p1);
x2 = A1*sin(2*pi*f2*t+p1);
x3 = A1*sin(2*pi*f3*t+p1);

figure(2)
plot(t,x1,'o-');
plot(t,x2,'+-');
plot(t,x3,'*-');
legend("-f1", "fs-f1", "2fs-f1"); grid; title('Signal x(t)'); xlabel('time [s]'); ylabel('Amplitude');

fs = 8000; Nx=3*fs;
dt = 1/fs;
n = 0 : Nx-1; 
t = dt*n;

f1 = 200; f2=fs+f1; f3=2*fs+f1;

sound(x1, fs);
%sound(x2, fs);
%sound(x3, fs);
