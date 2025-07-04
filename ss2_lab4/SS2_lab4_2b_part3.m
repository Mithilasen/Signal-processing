clear; close all; clc;

alpha = 1.2;        
Td = 0.1;           % Desired delay in seconds (100 ms)
[X, Fs] = audioread("--add your file here--");  

% Convert to mono if stereo
if size(X, 2) == 2
    X = mean(X, 2);
end

R = round(Td * Fs);  % Convert delay to sample count
N = 1;               


y_nonrec = nonrecursivemultiecho(X', alpha, R, N);


y_rec = recursivemultiecho(X', alpha, R);


soundsc(y_nonrec, Fs);
pause(length(y_nonrec)/Fs + 1);

soundsc(y_rec, Fs);
pause(length(y_rec)/Fs + 1);


