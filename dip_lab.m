clc;

d=10;
order=2;
im=imread('https://www.maptiler.com/media/2018-09-17-first-batch-of-high-res-satellite-imagery-in-maptiler-cloud-1.png');
im=rgb2gray(im);
im = im2double(im);

subplot(1,2,1)
imshow(im);
title('Original image');
[r c]=size(im);
homo(im,d,r,c,order)
