clear; clc; close all

% Initialize parameters
H = [1 0; 0 1];
iter = 0;

% Define the two starting points
x1 = [0.55, 0.7]';
x2 = [-0.9, -0.5]';
x_points = {x1, x2};
x1_history = []; % STORE
x2_history = []; % STORE

for i = 1:length(x_points)
    x_current = x_points{i}; % Extract the current vector
    g_0 = g(x_current(1), x_current(2));
    d = -H*g_0;
    % Rank one correction algorithm
    [rankOne_x, rankOne_iter, x_history] = rankOne(x_current,H,g_0,d,iter);
    
    % Store the results in the appropriate history array
    if i == 1
        x1_history = x_history;  % Store x1's history
        x1_rankOne = rankOne_x;
    else
        x2_history = x_history;  % Store x2's history
        x2_rankOne = rankOne_x;
    end
end

% Plot
plotQuasiNewtonMethods(x1_history, x2_history)