theta = @(m, n) pi*(2*m-1)/(2*n);
eps = @(rp) sqrt(10^(rp/10)-1);
spm_ = @(m, n, rp) -sinh(asinh(1/eps(rp))/n)*sin(theta(m, n)) + j*cosh(asinh(1/eps(rp))/n)*cos(theta(m, n));

TF  = @(s, n, rp) 1/(prod(s-spm_(1:n, n ,rp))*eps(rp)*2^(n-1));
z = [];

n = 6; rp = 10;

ph = @(n, rp) spm_(1:n, n ,rp); p = ph(n, rp);
kh = @(n, rp) eps(rp)*2^(n-1); k = kh(n, rp);

%plot(real(p), imag(p), 'bo');

b = poly(z);
a = poly(p);

f = 0 : 1 : 1000; % frequency in hertz
w = 2*pi*f; % pulsation, radial frequency
s = j*w; % Laplace transform variable
H = polyval(b,s) ./ polyval(a,s); % FR=TF for s=j*w: ratio of two polynomials
subplot(221); plot(f,20*log10(abs(H))); xlabel('f [Hz]'); title('|H(f)| [dB]'); grid;
subplot(222); plot(f,unwrap(angle(H))); xlabel('f [Hz]'); title('angle(H(f)) [rad]'); grid;


N = 5; % number of TF poles
f0 = 100; % cut-off frequency of low-pass filter
alpha = pi/N; % angle of one ‘‘piece of cake’’
beta = pi/2 + alpha/2 + alpha*(0:N-1); % angles of poles
R = 2*pi*f0; % circle radius
p = R*exp(j*beta); % poles placed on circle, left half-plane

z = []; gain = prod(-p); % LOW-PASS: TF zeros are not used, gain
%z = zeros(1,N); gain = 1; % HIGH-PASS: N TF zeros in zero, gain

b2 = gain*poly(z); a2=poly(p); % [z,p] --> [b,a]
b2 = real(b2); a2=real(a2); %

f = 0 : 1 : 1000; % frequency in hertz
w = 2*pi*f; % pulsation, radial frequency
s = j*w; % Laplace transform variable
H = polyval(b2,s) ./ polyval(a2,s); % FR=TF for s=j*w: ratio of two polynomials
subplot(223); plot(f,20*log10(abs(H))); xlabel('f [Hz]'); title('|H(f)| [dB]'); grid;
subplot(224); plot(f,unwrap(angle(H))); xlabel('f [Hz]'); title('angle(H(f)) [rad]'); grid;

