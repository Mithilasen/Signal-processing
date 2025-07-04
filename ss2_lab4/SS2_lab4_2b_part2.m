clear; close all; clc;

alpha = 0.5;   % Echo decay factor
R = 3;         % Delay in samples between echoes
N = 6;         % Number of echoes
L = 128;       % Length of input signal (2^p recommended for FFT)

x = zeros(1, L);
x(1) = 1;  

y = nonrecursivemultiecho(x, alpha, R, N);

Y = fft(y);
f = linspace(0, 1, L);  % Normalized frequency from 0 to 1

% Plot Magnitude Response 
subplot(3,1,1);
plot(f, abs(Y));
title('Magnitude Response |H(e^{j\omega})|');
xlabel('Normalized Frequency');
ylabel('Magnitude');
grid on;

%  Plot Phase Response 
subplot(3,1,2);
plot(f, angle(Y));
title('Phase Response ∠H(e^{j\omega})');
xlabel('Normalized Frequency');
ylabel('Phase (radians)');
grid on;

% ------------------ Pole-Zero Plot ------------------
% Get filter coefficients: this filter is FIR => all zeros, no poles
b = zeros(1, N*R + 1);  % Initialize with zeros
for k = 0:N
    b(k*R + 1) = alpha^k;
end
a = 1;  % Non-recursive => denominator is 1

subplot(3,1,3);
zplane(b, a);
title('Pole-Zero Plot');
