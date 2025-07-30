%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Autor: Alireza Sotoodeh(Student ID:401412056) 
Subject:  A Study on Cubic Mean Convergence
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
close all
%-------------------------------------------------------------------------
n=100000;                % Number of samples
mu = 3;                  % Mean
variance = 12;          % variance = sigma^2
%-------------------------------------------------------------------------
x = linspace(0,n,n); 
y = mu * ones(size(x)); %  filled with the mean value
plot(x, y, 'r'); % Plot the line
hold on; 
xlabel('x');
ylabel('Mean');
title('Line representing mean value');
grid on;
avg_X_cubed = zeros(1, n/10); % to store the average of X^3
i = 1; 
for N=10:10:n;
    X = sqrt(variance)*randn(1,N) + mu;
    avg_X_cubed(i) = mean(X.^3); % Calculate the average of X^3
    if mod(N,1000) == 0 % Update the plot every 1000 iterations
        plot(10:10:N, avg_X_cubed(1:i), 'b-'); % Plot the average of X^3
        drawnow; 
    end
    if abs(avg_X_cubed(i) - mu^3) < 0.01 %Command window_Print mean of X^3
        fprintf(['The average of X^3 for N=%d is approximately equal' ...
            ' to the cube of the mean: %f\n'], N, avg_X_cubed(i));   
    end
    i = i + 1; % Increment the counter
end
plot(10:10:n, avg_X_cubed, 'b-'); % Plot the final average of X^3
%-------------------------------------------------------------------------
legend('Mean Value', 'Average of X Cubed');

