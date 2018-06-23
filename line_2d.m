%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LINE_2D Generates 2D line equation from two 2D points
%% function abc = line_2d(p1, p2)
%%
%% INPUT:
%%  p1 - First point on line, [x1 y1]
%%  p2 - Second point on line, [x2 y2]
%%
%% OUTPUT:
%%  abc - Line equation, [a b c]
%%
%% DESCRIPTION:
%%  If p1 and p2 are separate 2D points on a line, this function generates
%%  a line equation, abc, st ax + by + c = 0.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function abc = line_2d(p1, p2)

if isequal(p1, p2)
    error('Make p1 different than p2.');
end

% Solve by TLS
X = [p1(1) p1(2); p2(1) p2(2)];
Y = ones(2,1);
Z = [X Y]; % augmented matrix
[U, S, V] = svd(Z, 0);
abc = V(:,end);

end
