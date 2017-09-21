function [ H ] = find_projection_matrix(original,projective)
% find_projection_matrix calculate the projective transformation matrix H
%   A transformation that maps lines to lines (but does not necessarily 
%   preserve parallelism) is a projective transformation.
% 
%   In projective transformation, given 4 non-collinear points in original 
%   image and the corresponding 4 points in transformed image,
%   calculate the non-singular 3 × 3 matrix H that express the plane
%   projective transformation.
% 
%   SYNTAX
%   [H] = find_projection_matrix(original,projective)
% 
%   INPUT
%   original      - x, y coordinates of 4 points in original image
%                 - [x1,x2,x3,x4; y1,y2,y3,y4]
% 
%   projective    - x, y coordinates of 4 points in transformed image
%                 - [u1,u2,u3,u4; v1,v2,v3,v4]
% 
%   OUTPUT
%   H:            - 3 × 3 projective matrix
% 
%   REFERENCES:
%   Hartley, R., & Zisserman, A. (2015). Multiple view geometry in computer 
%   vision. Cambridge: Cambridge Univ. Press. 
% 
%   Copyright 2017, yzhang559
%   Licensed for use under Apache License, Version 2.  See LICENSE for 
%   details.


%check input
[om,on]=size(original);
[cm,cn]=size(projective);
if ((om ~= 2) | (on ~= 4))
    error('Invalid input original points matrix');
end
if ((cm ~= 2) | (cn ~= 4))
    error('Invalid input projective points matrix');
end

% calculate in homogeneous coordinates
app=[1 1 1];
O=[original(:,(1:3));app];
O1=[original(:,4);1];
p1=O\O1;

Pro=[projective(:,(1:3));app];
Pro1=[projective(:,4);1];
p2=Pro\Pro1;

A=zeros(3,3);
for i = 1:3
    for j = 1:3
        A(i,j)=O(i,j)*p1(j);
    end
end

B=zeros(3,3);
for i = 1:3
    for j = 1:3
        B(i,j)=Pro(i,j)*p2(j);
    end
end

H=B/A;
end

