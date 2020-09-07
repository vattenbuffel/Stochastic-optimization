clc; clear all;
syms x1 x2 lambda

f = @(x1, x2) x1*x2^2
h = @(x1, x2) x1^2 + x2^2 - 1

L = @(x1, x2, lambda) f(x1, x2) + lambda*h(x1, x2)

feasible_points = solve(jacobian(L(x1,x2,lambda), [x1,x2,lambda])==[0;0;0])

% Find the point which gives the lowest value of f
min_val = f(feasible_points.x1(1), feasible_points.x2(1));
min_point = [feasible_points.x1(1); feasible_points.x2(1)];
for i = 2:6
    next_point = [feasible_points.x1(i); feasible_points.x2(i)]
    next_val = f(feasible_points.x1(i), feasible_points.x2(i))
    if min_val > next_val
        min_val = next_val;
        min_point = next_point;
    end   
end
min_val
min_point

%printf("min val is: %f with x1 = %f and x2 = %f\n", min_val, min_point(1), min_point(2))