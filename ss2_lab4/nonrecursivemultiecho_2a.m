function y = nonrecursivemultiecho(x, alpha, R, N)
    y = zeros(size(x));
    for n = 1:length(x)
        y(n) = x(n);
        for i = 1:N
            if n - i*R > 0
                y(n) = y(n) + alpha^i * x(n - i*R);
            end
            
        end
    end
end
