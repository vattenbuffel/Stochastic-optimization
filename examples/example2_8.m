clc; clear all;
syms x mu
f = @(x) x^2 - x + 1
fp = @(x, mu) [f(x)+mu*(1-x)^2
               f(x)]
           
dfp = [jacobian(f(x)+mu*(1-x)^2, x)
       jacobian(f(x))]
solve(dfp == zeros(2,1))
ans.x