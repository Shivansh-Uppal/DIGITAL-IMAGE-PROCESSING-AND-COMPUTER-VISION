subplot(2,2,1);
A=imread("C:\Users\shivansh uppal\Downloads\index.jpeg");
imshow(A)

subplot(2,2,2);
B=imread("C:\Users\shivansh uppal\Downloads\google-type.gif");
imshow(B)

subplot(2,2,[3,4]);
C=imread("https://www.w3schools.com/css/img_lights.jpg");
imshow(C)

% if you use subplot it will create subplot for each image else you can try
% for single single image, if you use figure before imshow that image will
% show, and in last if you do hold all if will have all images

