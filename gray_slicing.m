clear all;
close all;
clc;

X=imread('https://medschool.co/images/detail/cxr/breast-shadows.jpg');
subplot(2,2,3)
imshow(X)
y=X;

[w,h]=size(X);

for i=1:w
    for j=1:h
    if X(i,j)>=100 && X(i,j)<=200
        y(i,j)=255;
    else
        y(i,j)=0;
    end
    end
end

subplot(2,2,1)
imshow(y);

for i=1:w
    for j=1:h
    if X(i,j)>=100 && X(i,j)<=200
        y(i,j)=255;
    else
        y(i,j)=X(i,j);
    end
    end
end

subplot(2,2,2)
imshow(y)
hold all;