clear; close all; clc;
%-----------------problem 1(b)(ii)--------------%
alpha = 0.5;
R = 3;
N = 128 % any power of 2^p > 32 is good enough % 

% Delta input
x = zeros(1,N);
x(1) = 1;

%applying the single echo filter%

y = FIRFilter(x, alpha,R);

disp('y = ');
disp(y(1:10));


% FFT
Y = fft(y);
f = linspace(0,1,N);

% Plot( magnitude)
subplot(2,1,1);
plot(f, abs(Y));
title('Magnitude Response |H(e^{jW})|');
xlabel('Normalized Frequency(Hz)');
ylabel('Magnitude');
grid on;

%plot(Phase)

subplot(2,1,2)
plot(f, angle(Y));
title("Phase response °H(e^{jW})");
xlabel("Normalised frequency(Hz)");
ylabel("phase(Rad)");
grid on;

%----------alpha = 1
alpha = 1;
y2 = FIRFilter(x, alpha, R);
Y2 = fft(y2);

figure;
subplot(2,1,1);
plot(f, abs(Y2));
title('Magnitude Response |H(e^{jω})| for α = 1');
xlabel('Normalized Frequency(Hz)');
ylabel('Magnitude');
grid on;

subplot(2,1,2);
plot(f, angle(Y2));
title('Phase Response ∠H(e^{jω}) for α = 1');
xlabel('Normalized Frequency(Hz)');
ylabel('Phase (radians)');
grid on;