%% RANSAC Line-Fit Demo
% Computes best line-fit model a number of ways.  Plots against truth.

%% Params
M = 100;
L = 25;
sigman = 0.3;
max_trials = 10000;

%% Create a noisy line
x = randn(M, 1);
n = sigman*randn(M, 1);
y = -x - 1 + n;
a = randn(L, 1); % outliers
n = sigman*randn(L, 1);
b = 0.5*a + 2 + n;
x = cat(1,x,a);
y = cat(1,y,b);

%% Define truth
xt = linspace(min(x(:)), max(x(:)), M);
yt = -xt - 1;

%% Determine least squares fit with all data
X = [x ones(size(x))];
alpha = X\y;
yls = alpha(1)*xt + alpha(2);

%% Determine the total least squares fit with all data
[m, n] = size(X);
Z = [X y];
[U, S, V] = svd(Z, 0);
VXY = V(1:n, 1+n:end);
VYY = V(1+n:end, 1+n:end);
beta = -VXY/VYY;
ytls = beta(1)*xt + beta(2);

%% Determine fit with 2D model using outlier rejection
z = [x y]'; % convention
abc = ransac_linefit_2d(z, 2*sigman^2, max_trials);
y2d = (-abc(1)*xt -abc(3))/abc(2); % Assume abc(2) not zero

%% Determine fit with N-D model using outlier rejection
[a, d] = ransac_linefit_nd(z, 2*sigman^2, max_trials);
tmin = (xt(1)-a(1))/d(1); % Assume d(1) not zero
tmax = (xt(end)-a(1))/d(1);
t = linspace(tmin, tmax, M);
xnd = a(1) + t*d(1);
ynd = a(2) + t*d(2);

%% Plot
scatter(x, y, 'rx');
hold on;
plot(xt, yt, 'b-.');
plot(xt, yls, 'c-.');
plot(xt, ytls, 'm-.');
plot(xt, y2d, 'g-.');
plot(xnd, ynd, 'k-.');
hold off;
legend('Data', 'Truth', 'LS', 'TLS', 'RANSAC 2D', 'RANSAC N-D');
xlabel('x');
ylabel('y');
title('RANSAC Results for Random Data with Outliers');


