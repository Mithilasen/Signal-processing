function y = recursivemultiecho(x, alpha, R)
    y = zeros(size(x));
    N = length(x);
    N1 = N + 1;
    for n = 1:length(x)
        if n > R
            if (n - N1*R) > 0
                y(n) = x(n) - ((alpha^N1) * x(n - N1*R)) + alpha * y(n - R);
            else
                y(n) = x(n) + alpha * y(n - R);  
            end
        else
            y(n) = x(n);
        end
    end
end
