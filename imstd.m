function [ s ] = imstd( xr0,xr1,yr0,yr1,pic,i,j,r )
%IMSTD Calculate local standard deviation
%   t = imstd( xr0,xr1,yr0,yr1,pic,i,j,r ) calculate the local
%   standard deviation of pixel(i,j)
%   xr0 The minimum x-coordinate values of the bounding square of the 
%   circle defined by radius r 
%   xr1 The maximum x-coordinate values of the bounding square of the 
%   circle defined by radius r
%   yr0 The minimum y-coordinate values of the bounding square of the 
%   circle defined by radius r
%   yr1 The maximum y-coordinate values of the bounding square of the 
%   circle defined by radius r
%   pic A copy of the image for caculation

% A counter start from 1
ctr=1;
% The original value for calculation
sig=0;
% Get the local mean, minimum x-coordinate value, maximum x- coordinate
% value, minimum y-coordinate value, maximum y-coordinate value and pic
% by calling function immean
mean = immean(xr0,xr1,yr0,yr1,pic,i,j,r);

for x1 = xr0:xr1
    for y1=yr0:yr1
        % if pixel is inside the circle defined by radius r
        if ((sqrt((i-x1)^2+(j-y1)^2)) <= r)
            sig = sig + double(pic(x1,y1) - mean)^2;
            ctr=ctr+1;
        end
    end 
end
% Calculate the local standard deciation
s = sig/(ctr-1)

end

