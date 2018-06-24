%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RANSAC_LINEFIT_2D Creates a best fit line in a situation with outliers
%% function [M, inliers] = ransac_linefit_2d(x, t, chat, max_trials, chat)
%%
%% INPUT:
%%  x - data [2 x L] where the points are ordered [x y]
%%  t - distance threshold between a data point and a model [double]
%%  max_trials - maximum number of iterations [pos. integer]
%%  chat - if true, provides feedback [logical]
%%
%% OUTPUT:
%%  M - best model, ax + by + c = 0, or [a b c]
%%  inliers - indices of inliers for the best model [1 x P]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [M, inliers] = ransac_linefit_2d(x, t, max_trials, chat)

if nargin<4
    chat = false;
end

% maximum number of attempts to select non-degenerate data set
max_data_trials = 100; 

% minimum number of samples to fit line model
s = 2; 

% function handles
fittingfun = @line;
distfun = @distance;
degenfun = @degen;

% ransac
[M, inliers] = ransac(x, ...
    fittingfun, distfun, degenfun, ...
    s, t, ...
    chat, ...
    max_data_trials, max_trials);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LINE Computes a line equation from two points.  
%% function M = line(p)
%% 
%% INPUT:
%%  p - Data points
%%
%% OUTPUT:
%%  M - line model
%%
%% DESCRIPTION:
%%  The line model equation can be expressed as ax + by + c = 0.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function M = line(p)

p1 = p(:,1);
p2 = p(:,2);

M = line_2d(p1, p2);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DISTANCE Computes inliers based on distance
%% function [inliers, M] = distance(M, x, t)
%%
%% INPUT:
%%  inliers - the indices of data points close to the model
%%  M - Model
%%
%% OUTPUT:
%%  M - Model
%%  x - All data points
%%  t - Distance threshold
%%
%% DESCRIPTION:
%%  This function calculates the distance from a point to a line.  It
%%  returns inliers that are within a distance threshold of the model.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [inliers, M] = distance(M, x, t)

len = size(x,2);
dist = zeros(1,len);

for k = 1:len
    
    dist(k) = dist_2d(x(:,k), M);
    
end

inliers = find(dist<t);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DEGEN Test for degeneracy
%% function result = degen(x)
%%
%% INPUT:
%%  x - data points
%%  
%% OUTPUT:
%%  result - Degenerate only if two points are the same
%%
%% DESRIPTION:
%%  If the two points are the same, we don't have a line.  Otherwise, it 
%%  is non-degenerate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = degen(x)

result = isequal(x(:,1), x(:,2));

end


