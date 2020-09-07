clc; clear all; close all;
polynomialCoefficients = [10 -2 -1 1]; % Defines the polynomial 10 - 2x - x^2 + x^3
startingPoint = 2;
tolerance = 0.0001;
iterationValues = NewtonRaphson(polynomialCoefficients, startingPoint, tolerance);
PlotIterations(polynomialCoefficients,iterationValues);
%%
clc; clear all; close all;
polynomialCoefficients = [10 -2 -1 1 1337 pi exp(1) sqrt(2) -82 -99 0.1 0.01 -0.02 0.3]; % Defines the polynomial 10 - 2x - x^2 + x^3
startingPoint = 2;
tolerance = 0.0001;
iterationValues = NewtonRaphson(polynomialCoefficients, startingPoint, tolerance)
PlotIterations(polynomialCoefficients,iterationValues)