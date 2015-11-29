function [ m ] = immean(xr0,xr1,yr0,yr1,pic,i,j,r)
%IMMEAN Calculate the local mean
%   t = immean( xr0,xr1,yr0,yr1,pic,i,j,r,k ) calculate the local
%   mean of pixel(i,j)
%   xr0 The minimum x-coordinate values of the bounding square of the 
%   circle defined by radius r 
%   xr1 The maximum x-coordinate values of the bounding square of the 
%   circle defined by radius r
%   yr0 The minimum y-coordinate values of the bounding square of the 
%   circle defined by radius r
%   yr1 The maximum y-coordinate values of the bounding square of the 
%   circle defined by radius r
%   pic A copy of the image for caculation

% The original value for calculation
mean=0;
% A counter to count pixels inside the circle difined by radius r
counter=0;
    for x1 = xr0:xr1
        for y1=yr0:yr1
            % if the pixcel is inside the circle
            if ((sqrt((i-x1)^2+(j-y1)^2)) <= r)
                mean=mean+double(pic(x1,y1));
                counter=counter+1;
            end
        end
    end

% Local mean = total pixcel values / number of values
m = mean/counter

end

