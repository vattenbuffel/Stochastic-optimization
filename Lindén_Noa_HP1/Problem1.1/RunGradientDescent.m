function x = RunGradientDescent(x0, mu, eta, T)
    x = x0;
    n = 0;
    while 1==1
        % Take one step
        d = ComputeGradient(x(1), x(2), mu);
        x = x - eta*d;

        % Check if it's found the optimum
        if norm(d, 2) < T
           return 
        end
        
        n = n+1;
        if n == 1000
            n = 0;
        end
    end
end