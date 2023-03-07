clear all;
clc;
close all;
a= imread('https://www.langan.com/wp-content/uploads/2020/06/KingsleyAerial-600x600-2.jpg');
a= double(a);
c= size(a);
N= c(1);
D0= input('Enter the cut-off frequency');
for u=1:1:c(1)
    for v=1:1:c(2)
        D= (((u-N/2))^2+(v-(N/2))^2)^0.5;
        if D<D0
            H(u,v)=1;
        else
            H(u,v)=0;
        end
    end
end
vv=fft2(a);

subplot(4,4,5);
imshow(vv),title('fourier')

vc=fftshift(vv);

subplot(4,4,6);
imshow(vc),title('shift fourier')

x=vc.*H;

subplot(4,4,7);
imshow(x),title('multiply factor')
X=abs(ifft2(x));
subplot(4,4,1);
imshow(uint8(a)),title('original')
subplot(4,4,2);
mesh(H),title('ILPF Frequency Response')
subplot(4,4,3);
imshow(uint8(X)),title('Filtered Image')
subplot(4,4,4);
imagesc(H), colormap(gray),title('2-D Ideal Lowpass Filter')

subplot(4,4,8);
imagesc(1-H), colormap(gray),title('2-D Ideal Highpass Filter')

x=vc.*(1-H);
X=abs(ifft2(x));
subplot(4,4,9);
mesh(1-H),title('ILPF Frequency Response')
subplot(4,4,10);
imshow(uint8(X)),title('Filtered Image')