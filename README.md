# dist_pt_line

Computes distance from Point to Line with MATLAB functions

## General Demo

- demo_pt_line.m - runs demo_2d.m and demo_nd.m

## 2D Functions (works just in 2D)

- demo_2d.m - 2D demo
- line_2d.m - computes line equation ax + by + c = 0 from two points
- dist_2d.m - computes distance from point to line

## N-D Functions (works in any dimension)

- demo_nd.m - N-D demo
- line_nd.m - computes line equation ![](http://latex.codecogs.com/gif.latex?x&space;=&space;a&space;&plus;&space;t&space;\times&space;d&space;\:&space;\textup{for}\:&space;t&space;\in&space;\Re) from two points
- dist_nd.m - computes distance from point to line

## RANSAC Line Fit (fits the best line when outliers exist)

- demo_ransac.m - RANSAC demo
- ransac_linefit_2d - fits 2D line with outlier rejection
- ransac_linefit_nd - fits N-D line with outlier rejection
- RANSAC - [Required] [Peter Kovesi's ransac.m](https://www.peterkovesi.com/matlabfns/Robust/ransac.m)
- RANDOMSAMPLE - [Required] [Peter Kovesi's randomsample.m](https://www.peterkovesi.com/matlabfns/Robust/randomsample.m)
