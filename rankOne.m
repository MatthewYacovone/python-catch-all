function [rankOne_x, rankOne_iter, x_history] = rankOne(x,H,g_0,d,iter)
    x_history = x;
    
    while true
        x_history = [x_history, x];
        alpha = lineSearch(x,d);
        x_1 = x + alpha*d;
        del_x = alpha*d;
        g_1 = g(x_1(1), x_1(2));
        del_g = g_1 - g_0;
        H1 = H + ((del_x - (H.*del_g)).*(del_x - (H.*del_g))') ./ (del_g'.*(del_x - (H.*del_g)));
        stop = abs((H1*del_g) - del_x);
        if stop(1)-stop(2) < 0.00001
            break
        end
        d = -H1*g_1;
        g_0 = g_1; % g_1 becomes the g_0 for g_2 and so on...
        x = x_1; % x_1 becomes the x_0 for x_2 and so on...
        H = H1; 
        iter = iter + 1;

    end
    rankOne_x = x;
    rankOne_iter = iter;
end