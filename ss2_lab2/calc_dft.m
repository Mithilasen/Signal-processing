function X = calc_dft(y)
   X = zeros(length(y),1);
   for k = 0:(length(y)-1)
       sum_x = 0;
       for n = 0:(length(y)-1)
           sum_x = sum_x + y(n+1) * exp(-1j * k * n * ((2*pi)/(length(y))));
       end
       x(k+1) = sum_x;
   end
end


