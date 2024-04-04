N = 4*100;
x = randi([-100 100], [N 1]);

X1 = SpRx_FFT(x);
X2 = fft(x);

subplot(211);
plot(real(X1), "r");
title("Split-Radix FFT");
subplot(212);
plot(real(X2), "b");
title("MATLAB FFT");


function U = DFT_N2(x, k)
    N = size(x, 1);
    U = 0;
    
    for n=0:N/2-1
        U = U + x(2*n+1)*exp(-4*pi*(n*k/N)*1i);
    end
end

function Z = DFT1_N4(x, k)
    N = size(x, 1);
    Z = 0;

    for n=0:N/4-1
        Z = Z + x(4*n+2)*exp(-8*pi*(n*k/N)*1i);
    end
end

function Zp = DFT3_N4(x, k)
    N = size(x, 1);
    Zp = 0;

    for n=0:N/4-1
        Zp = Zp + x(4*n+4)*exp(-8*pi*(n*k/N)*1i);
    end
end

function X = SpRx_FFT(x)
    N = size(x, 1);
    X = zeros(N, 1);
    
    for k=0:N/4-1
        X(k+1) = DFT_N2(x, k) + exp(-2*pi*(k/N)*1i)*DFT1_N4(x, k) + exp(-2*pi*(3*k/N)*1i)*DFT3_N4(x, k);
        X(k+N/2+1) = DFT_N2(x, k) - exp(-2*pi*(k/N)*1i)*DFT1_N4(x, k) - exp(-2*pi*(3*k/N)*1i)*DFT3_N4(x, k);
        X(k+N/4+1) = DFT_N2(x, k+N/4) - 1i * (exp(-2*pi*(k/N)*1i)*DFT1_N4(x, k) - exp(-2*pi*(3*k/N)*1i)*DFT3_N4(x, k));
        X(k+3*N/4+1) = DFT_N2(x, k+N/4) + 1i * (exp(-2*pi*(k/N)*1i)*DFT1_N4(x, k) - exp(-2*pi*(3*k/N)*1i)*DFT3_N4(x, k));
    end
end
