%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Autor: Alireza Sotoodeh(Student ID:401412056) 
Subject:  A Study on Mean Convergence
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
close all
%-------------------------------------------------------------------------
n=100000;                  % Number of samples
mu = 20;                  % Mean
variance = 50;          % variance = sigma^2
%-------------------------------------------------------------------------
x = linspace(0,n,n); 
y = mu * ones(size(x)); %filled with the mean value
plot(x, y, 'r'); % Plot the mu line
hold on; 
xlabel('x');
ylabel('Mean');
title('Line representing mean value');
grid on;
avg_X = zeros(1, n/10); % Initialize an array to store the average of X
i = 1; 
for N=10:10:n;
    X = sqrt(variance)*randn(1,N) + mu;
    avg_X(i) = mean(X); % Calculate the average of X
    if mod(N,1000) == 0 % Update the plot every 1000 iterations
        plot(10:10:N, avg_X(1:i), 'b-'); % Plot the average of X
        drawnow; % Update the plot immediately
    end
    if abs(avg_X(i) - mu) < 0.01  % Command window
        fprintf(['The average of X for N=%d is approximately equal ' ...
            'to the mean: %f\n'], N, avg_X(i)); % Print the average of X
    end
    i = i + 1; 
end
plot(10:10:n, avg_X, 'b-'); % Plot the final average of X
%-------------------------------------------------------------------------
legend('Mean Value', 'Average of X');
