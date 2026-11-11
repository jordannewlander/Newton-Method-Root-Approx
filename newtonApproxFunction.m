function [F, approx, iterations, x] = newtonApproxFunction(x0, TOL, n0, x, Fin)
%calculate each xn value and input it into the vector for graphing
    %def input args 
    arguments (Input)
        x0 double
        TOL double
        n0 double
        x double
        Fin double
        %accept preallocatted vectors from script fn
    end

    %def output args
    arguments (Output)
        F double
        approx double
        iterations double
        x double
    end
    %def approx and iterations to be able to output to script
    F = Fin;
    approx = 0;
    iterations = 0;

    %for this specific functtion (2x^3 + x - 1), we know by Cardano's
    %formula for cubic equations that this fn has one real root (~0.5898)
    %that claerly crosses the x axis (because of the multiplicity,
    %a polynomial with an odd multiplicity will fully cross and not just
    %touch the x axis)
    %so we will use the standard newton's method to find the root

    for i = 1 : n0
        F(i) = 2*x(i).^3 + x(i) - 1;
        x(i+1) = x(i) - F(i)/(6*x(i).^2 + 1);
        if abs(x(i+1) - x(i)) < TOL
            approx = x(i);
            iterations = i;
            break
        end
    end

end
