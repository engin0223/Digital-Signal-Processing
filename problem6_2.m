clear; close all; % "washing hands"
fs = 1000; % sampling ratio (Hz)
N = 100; % number of signal samples, 100 or 1000
dt=1/fs; t=dt*(0:N-1); % time scaling
% Signal
f0=50; x = sin(2*pi*f0*t); % signal with frequency f0 = 50,100,125,200 Hz

%x = sin(2*pi*50*t)+0.001*sin(2*pi*175*t);
%x = ones(1, N);

figure; plot(t,x, 'bo-'); xlabel('t [s]'); title('x(t)'); grid; pause
% FFT spectrum
X = fft(x); % FFT
f = fs/N *(0:N-1); % frequency axis
figure; plot(f,1/N*abs(X),'bo-'); xlabel('f [Hz]'); title('|X(f)|'); grid; pause


% ... continue last program
% FFT interpolation with signal windowing
K = 10; % interpolation order
w1 = rectwin(N); % retangular window
w2 = chebwin(N,100); % Chebyshev window
w3 = gausswin(N, 100); % Gaussian window
w = w1; % window choice: w1, w2, ...
x = x.*w'; % signal windowing
X = fft(x,N); % without appended zeros
Xz = fft(x,K*N); % with zeros; Xz = fft([x,zeros(1,(K-1)*N)])/sum(w);
fz = fs/(K*N)*(0:K*N-1); % frequency axis
figure %
plot(f,20*log10(abs(X)/sum(w)),'bo-',fz,20*log10(abs(Xz)/sum(w)),'r.-','MarkerFaceColor','b');
xlabel('f (Hz)'); title('Zoomed DFT via FFT [dB]'); grid; pause

