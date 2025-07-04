% =========================================================================
% Signals and Systems 2
% Lab 02: Problem 3 - Dual-tone Multi-frequency (DTMF)
% =========================================================================
% Authors: Ashin, Mithila, Pansiluni, Koli
% =========================================================================

clear; close all; clc;

%% (b) Load and play the touchtone signal
% -------------------------------------------------------------------------
% Fill in the correct path to touchtone1.wav
[y, fs] = audioread("D:\HAW\IE5\SS2\lab2and3\2\touchtone1.wav");  
soundsc(y, fs);           % Play the audio signal

%% (c) Plot the signal in the time domain
% -------------------------------------------------------------------------
t = (0:length(y)-1) / fs;
figure;
plot(t, y, 'LineWidth', 1);
xlabel('Time [s]');
ylabel('Amplitude');
title('(c) Time-Domain Signal of touchtone1.wav');
grid on;

%% (d) Plot amplitude spectrum (full range and limited DTMF range)
% -------------------------------------------------------------------------
N = length(y);
Y = fft(y);
f = (0:N-1)*(fs/N);
Y_mag = abs(Y);

% (d) Full frequency range
figure;
plot(f, Y_mag, 'LineWidth', 1);
xlabel('Frequency [Hz]');
ylabel('|Y(f)|');
title('(d) Amplitude Spectrum - Full Frequency Range');
grid on;

% (d) DTMF-relevant range: 600 Hz to 1600 Hz
figure;
plot(f, Y_mag, 'LineWidth', 1);
xlim([600 1600]);
xlabel('Frequency [Hz]');
ylabel('|Y(f)|');
title('(d) Amplitude Spectrum - DTMF Range (600–1600 Hz)');
grid on;

%% (e) and (f) Function to generate DTMF signal from a digit sequence
% -------------------------------------------------------------------------
digits = '1234567890';
signal = generate_dtmf(digits);

soundsc(signal, 8000);  % Play at 8 kHz
t2 = (0:length(signal)-1)/8000;
figure;
plot(t2, signal);
xlabel('Time [s]');
ylabel('Amplitude');
title('(e) Generated DTMF Signal');
grid on;

% Amplitude spectrum of generated signal
S = fft(signal);
f2 = (0:length(signal)-1)*(8000/length(signal));
S_mag = abs(S);

figure;
plot(f2, S_mag);
xlim([600 1600]);
xlabel('Frequency [Hz]');
ylabel('|S(f)|');
title('(e) Amplitude Spectrum of Generated DTMF Signal');
grid on;


