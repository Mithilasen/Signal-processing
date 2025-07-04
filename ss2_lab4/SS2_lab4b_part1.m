% Parameters
alpha = 0.5;
R = 3;
N = 6;
L = 128;

% Delta input
x = zeros(1, L);
x(1) = 1;

% Apply both filters
y_nonrec = nonrecursivemultiecho(x, alpha, R, N);
y_rec = recursivemultiecho(x, alpha, R);

% Plot impulse responses
stem(0:L-1, y_nonrec, 'b', 'filled'); hold on;
stem(0:L-1, y_rec, 'r--');
legend('Non-Recursive', 'Recursive');
xlabel('n'); ylabel('Amplitude');
title('Impulse Response Comparison for N-Echo FIR Filter');
grid on;
