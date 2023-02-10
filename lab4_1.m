clear all;
close all;
clc;

X=imread('https://i.pinimg.com/originals/b9/28/76/b92876fa2d66c95a429cba4f74b85b9d.jpg');
Y=imread('https://live.staticflickr.com/2273/2077158526_da8aff2264_b.jpg');
Z=imread('https://cdn.britannica.com/67/143567-050-B54AD471/photograph-neighbourhood-shot-airplane.jpg');


hold all;

figure;
w=myimhist(X);
plot(w)

figure;
p=myimhist(Y);
plot(p)

figure;
q=myimhist(Z);
plot(q)

function [y]=myimhist(X)
[r,c]=size(X);
y=zeros(1,256);
for row=1:r
    for col=1:c
        z=X(row,col);
    y(z+1)=y(z+1)+1;
    end
end
end






