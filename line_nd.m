%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LINE_ND Generates N-D line equation from two N-D points
%% function [a, d] = line_nd(p1, p2)
%%
%% INPUT:
%%  p1 - First point on line, any dimension [N x 1]
%%  p2 - First point on line, same dimension as p1 [N x 1]
%%
%% OUTPUT:
%%  a - Point on line [N x 1]
%%  d - Line direction [N x 1]
%%
%% DESCRIPTION:
%%  if p1 and p2 are separate N-D points, this function generates a line
%%  equation composed of vectors a and d st x = a + t*d for t being real.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [a, d] = line_nd(p1, p2)

if isequal(p1, p2)
    error('Make p1 different than p2.');
end

p1 = p1(:);
p2 = p2(:);

a = p1;
d = p2-p1;

end