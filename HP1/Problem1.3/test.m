clear all; close all;clc
syms x1 x2

x1Val = 0;
x2Val = -1;

g = @(x1,x2) (1 + (x1 + x2 +1)^2*(19 - 14*x1 + 3*x1^2 -14*x2 + 6*x1*x2 + 3*x2^2))...
        * (30 + (2*x1-3*x2)^2*(18-32*x1 + 12*x1^2 + 48*x2 - 36*x1*x2 + 27*x2^2));
    
grad_g = gradient(g(x1,x2));
subs(grad_g, [x1,x2], [x1Val,x2Val])

R = @(x1,x2) (1 + ((x1 + x2 +1)^2)*(19 - 14*x1 + 3*x1^2 -14*x2 + 6*x1*x2 + 3*x2^2))
Rval = R(x1Val, x2Val)

P = @(x1,x2) (30 + (2*x1-3*x2)^2*(18-32*x1 + 12*x1^2 + 48*x2 - 36*x1*x2 + 27*x2^2))
Pval = P(x1Val, x2Val)



%% 1.2a
clear all; clc
syms x1 x2
f = @(x1,x2) 4*x1^2-x1*x2+4*x2^2-6*x2;
gradF = gradient(f(x1,x2))
interior_sol = solve(gradF == [0;0]);
interior_sol.x1
interior_sol.x2
f(interior_sol.x1, interior_sol.x2)

%% 1.2b
clear all; clc
syms x1 x2 lambda
f = @(x1,x2) 15+2*x1+3*x2;
h = @(x1,x2) x1^2+x1*x2+x2^2-21;
L = @(x1,x2, lambda) f(x1,x2) + lambda*h(x1,x2);

gradL = gradient(L(x1,x2,lambda))
sol=solve(gradL==zeros(3,1))
[sol.x1(1) sol.x1(2)
sol.x2(1) sol.x2(2)
sol.lambda(1) sol.lambda(2)]



