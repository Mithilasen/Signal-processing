% =========================================================================
% Signals and Systems 2
% Lab 02: Sampling and Reconstruction
% Group 02
% Authors: Ashin, Mithila, Pansiluni,Koli
% Matriculation Numbers: 2705028
% Date: 30.04.2025
% =========================================================================

clear; close all; clc;

% =========================================================================
% (i) Generate a vector of sample values of the rectangular signal
% =========================================================================
fs = 8000;              % Sampling frequency [Hz]
T = 1/fs;               % Sampling period [s]
dur = 4e-3;             % Desired signal duration ≥ 4ms
N = 2^nextpow2(fs * dur);  % Number of samples (power of 2)
t = (0:N-1)*T;          % Time vector

x = zeros(1, N);        % Preallocate signal
x(t <= 2e-3) = 1;       % Rectangular pulse: 1 for t in [0, 2ms], 0 elsewhere

figure;
plot(t*1000, x, 'LineWidth', 1.5);
xlabel('Time [ms]');
ylabel('Amplitude');
title('(i) Rectangular Signal x(t)');
grid on;

% =========================================================================
% (ii) Plot the amplitude spectrum using your own DFT
% =========================================================================
X = ss2_lab02_01(x);    % DFT using your implementation OR 
% X = fft(x);           

f = (0:N-1)*(fs/N);     % Frequency axis fs/N(frequency stepsize)
half_N = floor(N/2);    % For one-sided spectrum since dfts are symmetrical

X_mag = abs(X(1:half_N));
f_half = f(1:half_N);

figure;
plot(f_half, X_mag, 'LineWidth', 1.5);
xlabel('Frequency [Hz]');
ylabel('|X(f)|');
title('(ii) Amplitude Spectrum of Rectangular Signal');
grid on;

% =========================================================================
% (iii) Increase frequency resolution and verify zeros
% =========================================================================
% Increase N to improve frequency resolution
fs3 = 8000;
N3 = 8192;                     % Higher N = better resolution: 2048,4096 possible
T3 = 1/fs3;
t3 = (0:N3-1)*T3;
x3 = zeros(1, N3);
x3(t3 <= 2e-3) = 1;

X3 = ss2_lab02_01(x3);
f3 = (0:N3-1)*(fs3/N3);
X3_mag = abs(X3(1:N3/2));
f3_half = f3(1:N3/2);

figure;
plot(f3_half, X3_mag, 'LineWidth', 1.5);
xlabel('Frequency [Hz]');
ylabel('|X(f)|');
title('(iii) Amplitude Spectrum with Increased Frequency Resolution (N=8192)');
grid on;

% =========================================================================
% (iv) Observe spectrum with increased sampling frequency
% =========================================================================
fs4 = 16000;                   % Increased sampling frequency
N4 = 2^nextpow2(fs4 * dur);
T4 = 1/fs4;
t4 = (0:N4-1)*T4;
x4 = zeros(1, N4);
x4(t4 <= 2e-3) = 1;

X4 = ss2_lab02_01(x4);
f4 = (0:N4-1)*(fs4/N4);
X4_mag = abs(X4(1:N4/2));
f4_half = f4(1:N4/2);

figure;
plot(f4_half, X4_mag, 'LineWidth', 1.5);
xlabel('Frequency [Hz]');
ylabel('|X(f)|');
title('(iv) Spectrum with Increased Sampling Frequency (fs = 16 kHz)');
grid on;
