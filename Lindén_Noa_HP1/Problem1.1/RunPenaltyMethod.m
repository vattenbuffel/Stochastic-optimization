clc; clear all; close all
mus = [1 10 100];
x = [1;2];
x1 = [];
x2 = [];
for i = 1:3
    mu = mus(i);
    x = RunGradientDescent(x, mu, 0.0001, 10^-6);
    x1 = [x1;x(1)];
    x2 = [x2;x(2)];
end

mu = mus.';

% Add start point
mu = [0;mu];
x1 = [1;x1];
x2 = [2;x2];

mu = round(mu,3);
x1 = round(x1,3);
x2 = round(x2,3);
tabl = table(mu, x1, x2);
disp(tabl)

