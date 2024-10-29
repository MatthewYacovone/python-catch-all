%% Conjugate Gradient Algorithm

x = [0;0];
gradient = g(x);
d = -g(x);
iter = 0;

while true
    if gradient == [0;0] 
        break; 
    end
    alpha = -(g(x)'*d)/(d'*[2 1; 1 2]*d);
    x = x + alpha*d;
    gradient = g(x);
    beta = (g(x)'*[2 1; 1 2]*d)/(d'*[2 1; 1 2]*d);
    d = -g(x) + beta*d;
    iter = iter + 1;
end

function gradient = g(x) %
    Q = [2 1; 1 2]; 
    b = [3;0];
    gradient = (Q*x) - b;
end