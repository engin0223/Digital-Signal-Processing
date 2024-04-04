clear; close all;

fs=100; Nx=2*fs; df=200;    % sampling frequency, number of samples
dt = 1/fs;                 % sampling period
t = dt*(0:Nx-1);           % sampling times (many moments)

x = exp(1i*2*pi*(0.5*df*t.^2));

plot(t, real(x));

pspectrum(x);
