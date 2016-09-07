%% Initialization
clear ; close all; clc


%% ======================= Part 1: Noisy Signal Generation =======================
c5 = [0.74 0.97 1.1 0.86 1.8 0.92]; % data source
inp = -1:0.01:1; % sample range for x
des = polyval(c5,inp); % sample cubic at x
noise = randn(1, size(des, 2)); % random noise of same size as y
noise = 6*(noise/norm(noise)); % normalize the noise
oup = des + noise; % make noisy data
ec = polyfit(inp, oup, 5); % fit noisy data with cubic
hold on % keep all plots in same window
plot(inp, oup, 'r+') % noisy data
plot(inp, des, 'k--') % exact polynomial

IP = [transpose(inp)];
DS = [transpose(des)];
OP = [transpose(oup)];

%% =================== Part 2: LMS Gradient descent ===================
fprintf('Running LMS Gradient Descent ...\n')

X = [ones(200, 1), IP(1:200), IP(1:200).^2, IP(1:200).^3]; 
theta = zeros(4, 1); 
y = OP(1:200, 1);
num_iters = 1500;
alpha = 0.01;

% run LMS gradient descent
theta = gradientDescent(X, y, theta, alpha, num_iters);

fprintf('Theta found by LMS gradient descent: ');
fprintf('%f %f %f %f \n', theta(1), theta(2), theta(3), theta(4));

hold on; 
plot(X(:,2), X*theta, '-');
legend('Training data', 'desired output', 'Linear regression');




%% ============= Part 3 Correntropy =========================
fprintf('Running Correntropy ...\n')

X = [ones(200, 1), IP(1:200), IP(1:200).^2, IP(1:200).^3]; 
theta = zeros(4, 1); 
y = OP(1:200, 1);
num_iters = 500;
alpha = 0.01;

% run LMS gradient descent initially for some epochs to push parameters to global solution
theta = gradientDescent(X, y, theta, alpha, num_iters);

sigma = 0.0001;
% run correntropy descent
theta = corrgradDescent(X, y, theta, alpha, sigma);


fprintf('Theta found by correntropy ');
fprintf('%f %f %f %f \n', theta(1), theta(2), theta(3), theta(4));

hold on; 
plot(X(:,2), X*theta, 'g-');
legend('Training data', 'desired output', 'Linear regression', 'Correntropy');
hold off 





