function [ t] = imadaptive( xr0,xr1,yr0,yr1,pic,i,j,r,k )
%IMADAPTIVE Calculate the local adaptive thresholding
%   t = imagative( xr0,xr1,yr0,yr1,pic,i,j,r,k ) calculate the local
%   adaptive thresholding of pixel(i,j)
%   xr0 The minimum x-coordinate values of the bounding square of the 
%   circle defined by radius r 
%   xr1 The maximum x-coordinate values of the bounding square of the 
%   circle defined by radius r
%   yr0 The minimum y-coordinate values of the bounding square of the 
%   circle defined by radius r
%   yr1 The maximum y-coordinate values of the bounding square of the 
%   circle defined by radius r
%   pic A copy of the image for caculation

% R is the maximum value of the standard deviation,
%128 for grayscale image
R = 128;

% Get local mean by calling function immean(i,j,r)
m = immean(xr0,xr1,yr0,yr1,pic,i,j,r);

% Get local standard deviation by calling function imstd(i,r,j)
sig = imstd(xr0,xr1,yr0,yr1,pic,i,j,r);

% Calculate local adaptive thresholding
t = m*(1+k*((sig/R)-1))

end

