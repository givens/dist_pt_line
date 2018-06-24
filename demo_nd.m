%% N-D Demo
% Test cases for computing distance between point and line in N-D

%% 2D Case

% Two points
p1 = [0; 0]; % [x y]
p2 = [1; 2];

% Generate line equation
[a, d] = line_nd(p1, p2);

% Third point
p3 = [-1 4]; 

% How close is third point to line?
[dist, phat] = dist_nd(p3, a, d);

fprintf('**N-D demo, 2D case**\n');
fprintf('p1:  [x1, y1] = [%f, %f]\n', p1(1), p1(2));
fprintf('p2:  [x2, y2] = [%f, %f]\n', p2(1), p2(2));
fprintf('p3:  [x3, y3] = [%f, %f]\n', p3(1), p3(2));
fprintf('Distance from line to p3: %f\n', dist);
fprintf('Closest point on line to p3: [%f, %f]\n', phat(1), phat(2));

%% 3D Case

% Two points
p1 = [0; 0; 0];
p2 = [1; 0; 0];

% Generate line equation
[a, d] = line_nd(p1, p2);

% Third point
p3 = [1; 1; 0];

% How close is third point to line?
[dist, phat] = dist_nd(p3, a, d);

fprintf('**N-D demo, 3D case**\n');
fprintf('Distance from line to p3: %f\n', dist);
fprintf('Closest point on line to p3: [%f, %f, %f]\n', ...
    phat(1), phat(2), phat(3));

%% 4D Case

n = 4;

% Two points
p1 = randn(n, 1);
p2 = randn(n, 1);

% Generate line equation
[a, d] = line_nd(p1, p2);

% Third point
p3 = randn(n, 1);

% How close is third point to line?
[dist, phat] = dist_nd(p3, a, d);

fprintf('**N-D demo, 4D case**\n');
fprintf('Distance from line to p3: %f\n', dist);
fprintf('Closest point: [%f, %f, %f, %f]\n', ...
    phat(1), phat(2), phat(3), phat(4));




