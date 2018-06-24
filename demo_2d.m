%% 2D Demo
% Test case for computing distance between point and line in 2D
% Note that the 2D points are ordered [x, y] or [cols, rows]

% Two points
p1 = [0 0]; % [x y]
p2 = [1 2]; 

% Generate line equation
abc = line_2d(p1, p2);

% Third point
p3 = [-1 4];

% How close is third point to line?
[dist, phat] = dist_2d(p3, abc);

% Display results
fprintf('**2D Demo**\n');
fprintf('p1:  [x1, y1] = [%f, %f]\n', p1(1), p1(2));
fprintf('p2:  [x2, y2] = [%f, %f]\n', p2(1), p2(2));
fprintf('p3:  [x3, y3] = [%f, %f]\n', p3(1), p3(2));
fprintf('Distance from line to p3:  %f\n', dist);
fprintf('Closest point on line to p3:  [%f, %f]\n', phat(1), phat(2));