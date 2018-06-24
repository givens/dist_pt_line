%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RANSAC_LINEFIT_ND Creates a best fit line in a situation with outliers
%% function [M, inliers] = ransac_linefit_nd(x, t, chat, max_trials, chat)
%%
%% INPUT:
%%  x - N-D data points [N x L] 
%%  t - distance threshold between a data point and a model [double]
%%  max_trials - maximum number of iterations [pos. integer]
%%  chat - if true, provides feedback [logical]
%%
%% OUTPUT:
%%  M - best model 
%%  inliers - indices of inliers for the best model [1 x P]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [a, d, inliers] = ransac_linefit_nd(x, t, max_trials, chat)

if nargin<4
    chat = false;
end

% maximum number attempts at a non-degerate data set
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

a = M(:,1);
d = M(:,2);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LINE Computes a line equation from two points.  
%% function M = line(p)
%% 
%% INPUT:
%%  p - data points [N x 2]
%%
%% OUTPUT:
%%  M - line model [N x 2]
%%
%% DESCRIPTION:
%%  The line model equation can be expressed as x = a + td, where
%%  t is real, and a and d are [N x 1].  M is the composite of 
%%  a and d.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function M = line(p)

p1 = p(:,1);
p2 = p(:,2);

[a, d] = line_nd(p1, p2);
%d = d/norm(d,2);

M = [a d]; % composite model

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
%%  M doesn't change but needs to be an output for ransac.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [inliers, M] = distance(M, x, t)

len = size(x,2);
dist = zeros(1,len);

for k = 1:len
    
    dist(k) = dist_nd(x(:,k), M(:,1), M(:,2));
    
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
%%  result - Degenerate only if the two points are the same
%%
%% DESRIPTION:
%%  If the two points are the same, we don't have a line.  Otherwise, it 
%%  is non-degenerate.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = degen(x)

result = isequal(x(:,1), x(:,2));

end








