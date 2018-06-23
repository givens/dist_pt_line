%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DIST_ND Distance from a point in N-D to a line in N-D
%% function [dist, phat] = dist_nd(a, d, p)
%%
%% INPUT:
%%  a - any pt on the line x = a + t*d, [N x 1]
%%  d - line direction, [N x 1]
%%  p - point, [N x 1]
%%
%% OUTPUT:
%%  dist - closest Euclidean distance, [N x 1]
%%  phat - location of closest point on line, [N x 1]
%%
%% DESCRIPTION:
%%  https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line
%%  See "vector formulation".
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [dist, phat] = dist_nd(p, a, d)

p = p(:);
a = a(:);
d = d(:);

P = eye(length(d)) - d*d'/(d'*d); % Projection
ap = a - p;
proj = P*ap;
dist = norm(proj, 2);
phat = p+proj;

