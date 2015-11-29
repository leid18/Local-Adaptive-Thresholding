% Please run GUI in the command window to have an easy access to 
% all the thresholding tests You can also run the thresholding test
% directly by changing some codes here

f = rgb2gray(imread(get(handles.FileNameEdit,'String')));
[m, n] = size(f);
r = str2double(get(handles.RadiusEdit,'String'));
k = str2double(get(handles.KEdit,'String'));
pic = f;

for i=1:m
    for j=1:n
    % Calculate the minimum x-coordinate value of the 
    % bounding square of the circle defined by radius r
    xr0 = i-r;
    if(xr0 < 1) 
       xr0 = 1;
    end

    % Calculate the maximun x-coordinate value of the
    % bounding square of the circle defined by radius r
    xr1 = i+r;
    if(xr1 > m)
        xr1 = m;
    end

    % Calculate the minimun y-coordinate value of the
    % bounding square of the circle defined by radius r
    yr0 = j-r;
    if(yr0 < 1)
        yr0 = 1; 
    end

    % Calculate the maximun y-coordinate value of the
    % bounding square of the circle defined by radius r
    yr1 = j+r;
    if(yr1 > n)
        yr1 = n; 
    end
        f(i,j) = imthreshold(xr0,xr1,yr0,yr1,pic,i,j,r,k);
    end
end

imshow(f);