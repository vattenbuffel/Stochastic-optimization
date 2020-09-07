clc; clear all;
syms x
f = @(x) x^3 - x^2 -2*x + 10
df = matlabFunction(jacobian(f(x)))
ddf = matlabFunction(jacobian(df(x)))

x0 = 2;

x = zeros(100,1);
x(1) = x0
for i = 1:100
   x(i+1) = x(i) - df(x(i))/ddf(x(i))
end