function m1 = p2d(H,m)  
%   project 2d point to another 2d plane

[hm,hn]=size(H);
if hm~=3 || hn~=3
    error('Incorrect transformation matrix');
end

[mr,~]=size(m);
if (mr ~= 2)
    error('Incorrect 2d points');
end
 
c3d = [m;  ones(1,size(m,2))];
h2d = H * c3d;

% transfer last row to 1 1 1 1 (homogeneous coordinate)
c2d = h2d(1:2,:)./ [h2d(3,:)' h2d(3,:)']';

m1 = c2d(1:2,:);


