%find zeros of function f(x) = 2x^3 + x - 1 = 0 (found by minimizing
%difference between (x, x^2) and (0,1)
%first def variables x0 (initial condition), TOL (tolerance), n0 (max
%amount of iterations), and a range for x with a step of 1
x0 = 2;
n0 = 20;
TOL = 10^-4;
x = 0 : 0.1 : n0;
%define f(x) as a vector of zeros of size(x) to preallocate memory 1) for iterative
%loop so are not continuously overwriting values and 2) for graphing
F = zeros(size(x));
x(1) = x0;
%now write these into the function
[Fnew, approxnew, iterationsnew, xnew] = newtonApproxFunction(x0, TOL, n0, x, F)
%make F and x vectors smaller so we dont have trailing data (especially bc
%I did not initialize x as a vector of zeros as well and we stop after n0
%iterations or less)
Fplot = Fnew(1 : iterationsnew);
xplot = xnew(1 : iterationsnew);
%lets also plot the original polynomial for comparison
%f(x) := p, x := t for clarity
p = @(t) 1+2*t.^3-t
t = 0 : 0.1 : 2;

plot(xplot, Fplot, 'r'); hold on;
plot(t , p(t), 'b');
xlabel("x");
ylabel("f(x)");
title("Newton's Standard Method, root approx: " + approxnew + " number of iterations: " + iterationsnew)


