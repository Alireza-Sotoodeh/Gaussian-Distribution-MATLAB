%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Autor: Alireza Sotoodeh(Student ID:401412056) 
Subject: Gaussian Random Variable Generation
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
close all
%-------------------------------------------------------------------------
n=10000;               % Number of samples (The first main variable)
mu=0;                  % Mean (The second Main variable)
main_var = 100;             % variance = sigma^2
sigma=sqrt(main_var);       % Standard deviation (sqrt of variance)
%-------------------------------------------------------------------------
xlim1=0;                %if xlim1 and xlim2 == 0 then no resizing for plot
xlim2=0;                %if xlim1 and xlim2 == 0 then no resizing for plot
ylim1=0;                %if ylim1 and ylim2 == 0 then no resizing for plot
ylim2=0;                %if ylim1 and xlim2 == 0 then no resizing for plot
h = 0.003;             % Distance between two text
Text_shift= 0;         % Position for shifting the text to right and left 
Steps_for= n/10 ;        %for loop plotting mean and variance plots
%-------------------------------------------------------------------------
% We can generate a vector of random numbers by using: randn(1, n) 
X = randn(1, n); % Generate n samples from standard normal distribution
mean_X = mean(X); % Calculate the sample mean
var_X = var(X); % Calculate the sample variance
% For X
disp(['Mean of X (approx 0): ', num2str(mean_X)]);
disp(['Variance of X (approx 1): ', num2str(var_X)]);
%-------------------------------------------------------------------------
Y = sigma * X + mu; % Transform X
mean_Y = mean(Y); % Calculate the sample mean of Y
var_Y = var(Y); % Calculate the sample variance of Y
% For Y
disp(['Mean of Y (approx ', num2str(mu), '): ', num2str(mean_Y)]);
disp(['Variance of Y (approx ', num2str(main_var), '): ', num2str(var_Y)]);
%-------------------------------------------------------------------------
% Calculating and ploting histogram
num_bins = 100; % Number of bins for the histogram
[counts, edges] = histcounts(Y, num_bins, 'Normalization', 'pdf'); 
centers = (edges(1:end-1) + edges(2:end)) / 2; % Calculate bin centers
bar(centers, counts, 'FaceColor', [0.7 0.7 0.7]); % Plot histogram
f = @(y) 1/sqrt(2*pi*sigma^2) * exp(-(y-mu).^2 / (2*sigma^2));% Plot 
hold on;
fplot(f, [min(Y) max(Y)], 'LineWidth', 2);
%-------------------------------------------------------------------------
%can change the length of the horizontal and vertical of the graph!
if ~(xlim1 == 0 && xlim2 == 0)
    xlim([xlim1, xlim2]);      
end
if ~(ylim1 == 0 && ylim2 == 0)
    ylim([ylim1, ylim2]);       
end
%-------------------------------------------------------------------------
%{
Display text and lines for different values!
%}     
text_pos = max(Y)+ Text_shift;

% Display the Number of samples (The first main variable)
text(text_pos, max(counts)-(1*h), ['Number of samples: ', num2str(n)]);

% Display the main variance (sigma^2) on the plot as vertical lines
line([sigma^2 sigma^2], ylim, 'Color', 'k', 'LineStyle', '-');
text(text_pos, max(counts)-(2*h), ['Main Variance: ', num2str(sigma^2)]);

% Display the main mean (mu) on the plot as vertical lines
line([mu mu], ylim, 'Color', 'k', 'LineStyle', '-.');
text(text_pos, max(counts)-(3*h), ['Main Mean: ', num2str(mu)]);

% Display the mean and variance of X on the plot as vertical lines
line([mean_X mean_X], ylim, 'Color', 'r', 'LineStyle', '--');
text(text_pos, max(counts)-(4*h), ['Mean of X (\approx 0): ', ...
    num2str(mean_X)]);line([mean_X+sqrt(var_X) mean_X+sqrt(var_X)], ...
    ylim,'Color', 'b','LineStyle', '--');
text(text_pos, max(counts)-(5*h), ['Variance of X (\approx 1): ', ...
    num2str(var_X)]);

% Display the mean and variance of Y on the plot as vertical lines
line([mean_Y mean_Y], ylim, 'Color', 'g', 'LineStyle', '--');
text(text_pos, max(counts)-(6*h), ['Mean of Y(\approx ', ...
    num2str(mu), '): ',num2str(mean_Y)]);
line([var_Y var_Y], ylim, 'Color', 'm', ...
    'LineStyle', '--');
text(text_pos, max(counts)-(7*h), ['Variance of Y(\approx ', ...
    num2str(main_var), '): ', num2str(var_Y)]);
%-------------------------------------------------------------------------
%{
Display -1sigma and +1sigma on the plot as vertical lines (where 68% data
exist
%}
line([mean_Y-sigma mean_Y-sigma], ylim, 'Color', 'b', 'LineStyle', '-');
text(text_pos, max(counts)-(8*h), ['$-1\sigma$: ', ...
    num2str(mean_Y-sigma)],'Interpreter', 'latex');
line([mean_Y+sigma mean_Y+sigma], ylim, 'Color', 'b', 'LineStyle', '-');
text(text_pos, max(counts)-(9*h), ['$+1\sigma$: ', ...
    num2str(mean_Y+sigma)], 'Interpreter', 'latex');
hold off;
%-------------------------------------------------------------------------
h_legend = legend('Histogram','Gaussian', 'Main Variance', 'Main Mean',...
'Mean of X', 'Variance of X:', 'Mean of Y', 'Variance of Y:', ...
'$-1\sigma$','$+1\sigma$');
set(h_legend,'Interpreter','latex');
ylabel('pdf')
xlabel('y')
set(get(gca,'XLabel'),'Interpreter','latex', 'FontSize',10)
set(get(gca,'YLabel'),'Interpreter','latex', 'FontSize',10)
set(get(gca,'legend'),'Interpreter','latex', 'FontSize',9)
%-------------------------------------------------------------------------
%{
Add additional figures to show the value of mean of X converges to 0 and
variance of X converges to 1 for every n and also mean of Y to main mean
(for every n) and variance of Y to number of sample (for every n) using
for loop
%}
n_values = 1:Steps_for:n; % Vector of sample sizes
mean_X_values = zeros(size(n_values)); %  to store mean of X
var_X_values = zeros(size(n_values)); %  to store variance of X
mean_Y_values = zeros(size(n_values)); %  to store mean of Y
var_Y_values = zeros(size(n_values)); %  to store variance of Y

for i = 1:length(n_values)
    n_i = n_values(i); % Current sample size
    X_i = randn(1, n_i); % Generate n_i samples 
    Y_i = sigma * X_i + mu; % Transform X_i
    mean_X_values(i) = mean(X_i); % store the sample mean of X_i
    var_X_values(i) = var(X_i); % store the sample variance of X_i
    mean_Y_values(i) = mean(Y_i); %  and store the sample mean of Y_i
    var_Y_values(i) = var(Y_i); %  store the sample variance of Y_i
end

% Plot the mean and variance of X and Y as functions of n
figure;
subplot(2, 2, 1);
plot(n_values, mean_X_values);
title('Mean of X vs. n');
xlabel('n');
ylabel('Mean of X');
text(max(n_values)*0.7, max(mean_X_values)*0.7, ['Converges to 0']);

subplot(2, 2, 2);
plot(n_values, var_X_values);
title('Variance of X vs. n');
xlabel('n');
ylabel('Variance of X');
text(max(n_values)*0.7, max(var_X_values)*0.7, ['Converges to 1']);

subplot(2, 2, 3);
plot(n_values, mean_Y_values);
title('Mean of Y vs. n');
xlabel('n');
ylabel('Mean of Y');
text(max(n_values)*0.7, max(mean_Y_values)*0.7, ['Converges to ', ...
    num2str(mu)]);

subplot(2, 2, 4);
plot(n_values, var_Y_values);
title('Variance of Y vs. n');
xlabel('n');
ylabel('Variance of Y');
text(max(n_values)*0.7, max(var_Y_values)*0.7, ['Converges to ', ...
    num2str(main_var)]);
%-------------------------------------------------------------------------
%{
writing other tests for understanding better based on the internet and A.I
%}

%{
 Test for Normality: You can use a statistical test like the Shapiro-Wilk
 test or the Anderson-Darling test to check if your generated random 
variable follows a normal distribution.
%}
[h,p] = adtest(Y); % Anderson-Darling test
if h == 0
    disp(['The generated random variable follows a normal ' ...
        'distribution (Anderson-Darling test).']);
else
    disp(['The generated random variable does not follow a ' ...
        'normal distribution (Anderson-Darling test).']);
end


%{
Test for Mean: You can use a t-test to check if the mean of your 
generated random variable is equal to the expected mean (mu), and an
 F-test to check if the variance is equal to the expected 
variance (main_var).
%}
[h,p] = ttest(Y, mu); % t-test
if h == 0
    disp(['The mean of the generated random variable is ' ...
        , num2str(mu), ' (t-test).']);
else
    disp(['The mean of the generated random variable is not ' ...
        , num2str(mu), ' (t-test).']);
end
[h,p] = vartest(Y, main_var); % F-test
if h == 0
    disp(['The variance of the generated random variable is ' ...
        , num2str(main_var), ' (F-test).']);
else
    disp(['The variance of the generated random variable is not ' ...
        , num2str(main_var), ' (F-test).']);
end

%{
Test for Independence: You can use the autocorrelation function to check 
if the generated random numbers are independent.
Yes, for a sequence of independent and identically distributed (i.i.d.) 
random variables, the autocorrelation should be near 0 for all lags 
except 0. 
%}
lags = 0:100;
autocorr_Y = zeros(size(lags)); 
for i = lags
    autocorr_Y(i+1) = mean((Y(1:end-i)-mean_Y).*(Y(i+1:end)-mean_Y));
end
autocorr_Y = autocorr_Y / autocorr_Y(1); 
figure;
stem(lags, autocorr_Y);
title('Autocorrelation of Y(should be near 0)');
xlabel('Lag');
ylabel('Autocorrelation');


