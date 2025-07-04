%------Sound echo filterb(iii)----%
clear;clc;close all;

[X,Fs] = audioread("--add your .wav file here--");

if size(X,2) == 2 % stereo to mono
    X = mean(X,2)
end    

alpha = 1;
Td = 1.5; %300ms
R = round(Td * Fs); % delay in samples

y = FIRFilter(X', alpha ,R); % x is transposed for the function 
y = y';

% original audio
disp("Playing Original audio");
soundsc(X,Fs);
pause(length(X)/Fs +1);

%echoed audio
disp("echoed audio");
soundsc(y,Fs);
pause(length(y)/Fs +1);
