% =========================================================================
% Signals and Systems 2
% Lab 02: Sampling and Reconstruction
% Group 02
%
% Authors: Ashin, Mithila, Pansiluni,Koli
% Matriculation Numbers: 2705028
% Date: 30.04.2025
% =========================================================================
function [dft] = ss2_lab02_01(vector)
    N = length(vector);      % Number of samples
    k = -floor(N/2) : ceil(N/2)-1;  % Centered frequency indices
    n = 0:N-1;               % Time/sample indices
    
    k_n = n' * k;            % Outer product to form the DFT exponent matrix
    exp_side = exp(-1i * 2 * pi * k_n / N);  % DFT kernel with centered k
    
    x_n = vector' * ones(1, N);     % Expand vector to match matrix dimensions
    x_row = exp_side .* x_n;        % Multiply kernel with input values
    dft = sum(x_row, 1);            % Sum across time to compute DFT
 
end