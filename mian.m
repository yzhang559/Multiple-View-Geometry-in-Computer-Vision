% An example in book "Multiple view geometry in computer vision (p35)"

clc;
% original image with perspective distortion
[I,map]=imread('test_image/original.jpg');
% 4 black points marked on 2 images 
original=[251 333 335 253; 191 189 225 230];
projective=[201 287 287 201;188 188 221 221];
% calculate the projective transformation matrix H from points provided
% above
H=find_projection_matrix(original,projective);

I2 = imtrans(I,H);
% show the image after projective transformation, the result should look 
% like 'projective.jpg'(the points location should be precise to ensure it
% looks like 'projective.jpg')
imshow(I2);
axis on
