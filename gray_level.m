clear all;
close all;
clc;

a=imread('https://medschool.co/images/detail/cxr/breast-shadows.jpg');

[w,q,e]=size(a);

for i=1:w
    for j=1:q
        for k=1:e
        t(i,j,k)=a(i,j,k);
        end
    end
end

for i=1:w
    for j=1:q
        for k=1:e
        n(i,j,k)=255-a(i,j,k);
        end
    end
end

d=im2double(a);
l=d;

for i=1:w
    for j=1:q
        for k=1:e
        z=log10(1+d(i,j,k))/log10(100);
        l(i,j,k)=z;
        end
    end
end

for i=1:w
    for j=1:q
        for k=1:e
        p(i,j,k)=power(a(i,j,k),k);
        end
    end
end

subplot(2,3,1);
imshow(a);

subplot(2,3,2);
imshow(t);

subplot(2,3,3);
imshow(n);

subplot(2,3,4);
imshow(l);

subplot(2,3,5);
imshow(p);