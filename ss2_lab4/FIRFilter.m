
function y = FIRFilter(x, alpha, R) 
   % x: input values
   % alpha: Scaling factor 
   % R: Delay
   y = x;
   y(R+1:end) = y(R+1:end) + alpha * x(1:end-R);
end   








