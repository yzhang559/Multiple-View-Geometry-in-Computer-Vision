function [I2] = imtrans(I,H)
%   imtrans implements the projective transformations of a image

%   INPUT   
%   I      -indexed image
%   H      -non-singular 3 × 3 matrix H that express the plane projective 
%           transformation
% 
%   OUTPUT
%   I2      -indexed projected image
% 
%   Copyright 2017, yzhang559
%   Licensed for use under Apache License, Version 2.  See LICENSE for 
%   details.  

%   check input
[hm,hn]=size(H);
if ((hm ~= 3) || (hn ~= 3))
    error('Invalid input transformation');
end


%   get bounding of original image
corners = [1, 1, size(I,2), size(I,2);
           1, size(I,1), 1, size(I,1)];
       
corners_2=p2d(H,corners);

%   get bounding of projected image
minx = floor(min(corners_2(1,:)));
maxx = ceil(max(corners_2(1,:)));
miny = floor(min(corners_2(2,:)));
maxy = ceil(max(corners_2(2,:)));

[x,y] = meshgrid(minx:maxx,miny:maxy);

pp = p2d(inv(H),[tocol(x)';tocol(y)']);
xi=tomatrix(pp(1,:)',size(x,1));
yi=tomatrix(pp(2,:)',size(y,1));
%   interp color value in original image to the corresponding location 
%   in projected image
I2=interp2(1:size(I,2), 1:size(I,1),double(I),xi,yi,'linear',NaN);

I2 = uint8(I2);
end

