function xj = NewtonRaphson(coeffs, x0, T)
    % Check for faulty input
    if length(coeffs) < 3
       fprintf("NewtonRaphson: Faulty input. The order of the polynomial must be at least 2.\n"); 
       return
    end

    xj = [];
    x = x0;
    x_prev = x0;
    
    % Calculate the coeffs of the first and second order differentiation of
    % the polynomial whose coefficients are given by coeffs
    primCoeffs = PolynomialDifferentiation(coeffs,1);
    bisCoeffs = PolynomialDifferentiation(primCoeffs,1);
    
    % Create functions of them
    df = @(x)Polynomial(x, primCoeffs);
    ddf = @(x)Polynomial(x, bisCoeffs);
    
    
    % Move towards local optimum
    while 1==1
        xj = [xj x];
        x_prev = x;
        
        % Take a step
        x = NewtonRaphsonStep(x, df(x), ddf(x));
        % Check if error
        if isa(x, "string") & x == "ERROR"
           return 
        end
        
        % Check if converged
        if abs(x-x_prev) < T
           xj = [xj x];
           break 
        end
    end
end