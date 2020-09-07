% Test the line_search function. Answer should be 0
clc; clear all;
syms x
f = @(x) x^2
x_optimum = line_search(f(x), -10, 1)

%% Test the gradient descent function. Answer should be [0;0]
clc; clear all;
syms x1 x2
x = [x1;x2]

f = @(x) x(1)^2 - x(1)*x(2) + x(2)^2
grad_f = @(x)[x(1).*2.0-x(2);-x(1)+x(2).*2.0]
x0 = [1;-1]
vpa(gradient_descent(f, grad_f, x0, 100),3)

%% Example 2.9. Answer should be [0; -1/sqrt(2)] = [0; -0.707]
clc; clear all;
syms x1 x2 %mu
x = [x1;x2]
mu = 100
alpha = 2

f = @(x) 5*x(1)^2 + (x(2)+1)^4
h = @(x) x(1)^2 + 2*x(2)^2 - 1
 
p = @(x) mu*(h(x)^2)
fp = @(x) f(x) + p(x)
dfp = @(x)[x(1).*2.1e+2;
           x(2).*4.0e+2+(x(2)+1.0).^3.*4.0]

x0 = [0;0]
vpa(gradient_descent(fp, dfp, x0, 10),3)

%%
function x_new = gradient_descent(f, grad_f, x_cur, n_iterations)
    syms eta
    for i = 1:n_iterations
        d = grad_f(x_cur);
        x_new = x_cur - eta*d;
        phi = f(x_new);
        eta_val = line_search(phi, -10000, 10000);
        x_new = subs(x_new, eta, eta_val);
    end
end

function eta = line_search(f, a, b)
    df = matlabFunction(jacobian(f));
    tol = 0.000001;
    
    c = (a+b)/2;
    dfc = df(c);
    while ~(dfc < tol && dfc >-tol)
        if dfc < 0
            a = c;
        end
        if dfc > 0
            b = c;
        end
        c = (a+b)/2;
        dfc = df(c);
    end
    eta = c;
end