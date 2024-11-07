% Line Search
function alpha = lineSearch(x,d)
    [a0,b0] = bracketing(x);
    alpha = goldenSection(a0,b0,x,d);
end

% Bracketing Procedure
function [a0,b0] = bracketing(x)
    eps = 0.075;
    multiplier = 2;
    a0 = 0;
    b0 = eps;
    a = x;
    b = a - eps * g(x(1),x(2));
    c = 0;

    while true
        if f(a(1),a(2)) > f(b(1),b(2)) % decreasing
            a = b;
            b = a - multiplier * eps * g(x(1),x(2));
            a0 = b0;
            b0 = b0 + multiplier*eps;
            multiplier = multiplier^2;
        else % increasing
            c =  a - multiplier * eps * g(x(1),x(2));
            b0 = b0 + multiplier*eps;
            break
        end 
    end
end
