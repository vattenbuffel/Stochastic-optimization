function res = PlotIterations(coeffs, xs)
    % Plot the specific x and y-values visited by NewtonRaphson
    ys = Polynomial(xs, coeffs);
    scatter(xs, ys)
    
    % Add more values to plot a smoother functions
    x_min = min(xs);
    x_max = max(xs);
    
    xs = linspace(x_min - abs(x_min*0.1), x_max + abs(x_max*0.1), 1000);
    ys = Polynomial(xs, coeffs);
    hold on
    plot(xs, ys)
    
end