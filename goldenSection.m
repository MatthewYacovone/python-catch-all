function alpha = goldenSection(a0,b0,x,d)
    % Compute alpha optimum
    % 
    % Parameters:
    %       a0 = left-most alpha candidate in the range of alphas
    %       b0 = right-most alpha candidate in the range of alphas
    %       x = point we are standing at
    %       d = the direction we are moving in
    %
    % Return:
    %       alpha = the optimal step size from x in the direction d

    a = a0;
    b = b0;
    rho = (3-sqrt(5))/2; % golden ratio
    s = a + rho * (b - a); % 1st intermediate point
    t = a + (1-rho) * (b - a); % 2nd intermediate point
    xk_s = x - s*d; % x(k+1) @ 1st intermediate point
    xk_t = x - t*d; % x(k+1) @ 2nd intermediate point
    f_1 = f(xk_s(1),xk_s(2));
    f_2 = f(xk_t(1),xk_t(2));
    i = 1;

    while true % uncertanty range i.o.w. the stopping criteria
        fprintf('Interval range: [%.4f,%.4f]\n', a, b)
        if f_1 < f_2
            % new range: [a0, b1] = [a, b_new] 
            b = t; % copy b_new to b % a = a;

            t = s; % update b_new such that b2 = a1 or b_new_new = a_new
            s = a + rho * (b - a); % a2 = a0 + p(b1-a0)

            xk_t = xk_s; 
            xk_s = x - s*d;

            f_2 = f_1; % f(b2) = f(a1)
            f_1 = f(xk_s(1),xk_s(2)); % f(a2)
        else
            % new range: [a1, b0] = [a_new, b]
            a = s; % copy a_new to a (setting the range) % b = b

            s = t;
            t = a + (1-rho) * (b - a);

            xk_s = xk_t;
            xk_t = x - t*d;

            f_1 = f_2;
            f_2 = f(xk_t(1),xk_t(2)); 
        end
        alpha = (a+b)/2;
        if abs(f_1-f_2) < 0.01
            break
        end
        % fprintf('f(a) = %.4f, f(b) = %.4f\n', f_a, f_b)
        i = i+1;
    end
    
end
% % Problem Definition
% function result = f(x1,x2)
%     result = (x2 - x1).^4 + 12*x1*x2 - x1 + x2 - 3;
% end