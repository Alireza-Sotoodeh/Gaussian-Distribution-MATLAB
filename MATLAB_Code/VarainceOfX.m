%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Autor: Alireza Sotoodeh(Student ID:401412056) 
Subject:  A Study on Variance Convergence
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
close all
%-------------------------------------------------------------------------
n=100000;                  % Number of samples
mu = 0;                  % Mean
variance = 22;          % variance = sigma^2
%-------------------------------------------------------------------------
x = linspace(0,n,n); 
y = variance * ones(size(x)); %filled with the variance value
plot(x, y, 'r'); % Plot the line
hold on; 
xlabel('x');
ylabel('Variance');
title('Line representing variance value, Variance = E[(X - \mu)^2]');
grid on;
var_X = zeros(1, n/10); % Initialize an array to store the variance of X
i = 1; 
for N=10:10:n;
    X = sqrt(variance)*randn(1,N) + mu;
    var_X(i) = var(X); % Calculate the variance of X
    if mod(N,1000) == 0 % Update the plot every 1000 iterations
        plot(10:10:N, var_X(1:i), 'b-'); % Plot the variance of X
        drawnow;
    end
    if abs(var_X(i) - variance) < 0.01  % Command window
        fprintf(['The variance of X for N=%d is approximately equal ' ...
            'to the variance: %f\n'], N, var_X(i)); % print variance of X
    end
    i = i + 1; 
end
plot(10:10:n, var_X, 'b-'); % Plot the final variance of X
%-------------------------------------------------------------------------
legend('Variance Value', 'Variance of X');
