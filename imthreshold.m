function [ f ] = imthreshold( xr0,xr1,yr0,yr1,pic,i,j,r,k)
%IMTHRESHOLD Calculate the local thresholding
%   t = imagative( xr0,xr1,yr0,yr1,pic,i,j,r,k ) calculate the
%   thresholding result of pixel(i,j)
%   xr0 The minimum x-coordinate values of the bounding square of the 
%   circle defined by radius r 
%   xr1 The maximum x-coordinate values of the bounding square of the 
%   circle defined by radius r
%   yr0 The minimum y-coordinate values of the bounding square of the 
%   circle defined by radius r
%   yr1 The maximum y-coordinate values of the bounding square of the 
%   circle defined by radius r
%   pic A copy of the image for caculation

% Get local adaptive thresholding t by calling function imadaptive(i,j,r,k)
t = imadaptive (xr0,xr1,yr0,yr1,pic,i,j,r,k);

% g is the intensity of a pixel at location(i,j)
g = double(pic(i,j));

% Calculate local thresholding f
if g <= t
    f = 0
else
    f = 255
end

end

