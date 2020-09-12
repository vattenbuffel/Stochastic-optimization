clc; clear all; close all;
syms x1 x2 
syms mu
mu_val = 1;
T = 10^-6;
eta = 0.0001;

f = @(x1, x2) (x1-1)^2 + 2*(x2-2)^2;
g = @(x1, x2) x1^2 + x2^2 - 1;
p = @(x1, x2, mu) mu*(g(x1,x2)^2);
fp = @(x1, x2, mu) [f(x1, x2) + p(x1,x2, mu)
                    f(x1, x2)];
  
fprintf("fP=\n");
disp(fp(x1,x2,mu));

gradFp = @(x1,x2,mu) ([jacobian(f(x1, x2) + p(x1,x2, mu), [x1,x2]).'
                       jacobian(f(x1, x2), [x1,x2]).']);

fprintf("gradFp=\n");
disp(gradFp(x1,x2, mu));

gradFp = @(x1,x2,mu) jacobian(f(x1, x2) + p(x1,x2, mu), [x1,x2]).';

% Solve the unconstrained problem to find x0
xUnconstrained = solve(gradient(f(x1,x2))==[0;0] );
x0 = [xUnconstrained.x1; xUnconstrained.x2];
disp("x0=")
disp(x0)
%%
clc; clear all; close all
mus = [1 10 100];
x = [1;2];
for i = 1:3
    mu = mus(i);
    x = RunGradientDescent(x, mu, 0.0001, 10^-6)
end

