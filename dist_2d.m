%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DIST_2D Distance from a 2D point to a line in the plane
%% function [dist, phat] = dist_2d(p, abc)
%%
%% INPUT:
%%  p - 2D point, [x y]
%%  abc - line equation, ax + by + c = 0, or [a b c]
%%
%% OUTPUT:
%%  dist - closest Euclidean distance
%%  phat - location of closest point on line.
%%
%% DESCRIPTION:
%%  https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line
%%  See "cartesian coordinates".
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [dist, phat] = dist_2d(p, abc)

den = (abc(1)^2 + abc(2)^2);

dist = abs(abc(1)*p(1) + abc(2)*p(2) + abc(3)) ./ sqrt(den);

px = (abc(2)*(abc(2)*p(1) - abc(1)*p(2)) - abc(1)*abc(3)) ./ den;
py = (abc(1)*(-abc(2)*p(1) + abc(1)*p(2)) - abc(2)*abc(3)) ./ den;

phat = [px py];

end

