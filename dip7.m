img=imread("https://www.wallpaperflare.com/static/408/403/823/australia-sydney-aerial-view-city-wallpaper.jpg");
img=rgb2gray(img);

%img=imread('cameraman.tif'); %for reference
img = im2double(img);

% Set the filter parameters
N = 4; % Order of the filter
D0 = 1000; % Cutoff frequency

% Implement the Butterworth highpass filter
[n, m] = size(img);
h = zeros(n,m);
for i = 1:n
    for j = 1:m
        D = sqrt((i - n/2)^2 + (j - m/2)^2);
        h(i,j) = 1 / (1 + (D0/D)^(2*N));
    end
end
filtered_img_butterworth_highpass = img-img .*h;

% Implement the Butterworth lowpass filter
[n, m] = size(img);
h = zeros(n,m);
for i = 1:n
    for j = 1:m
        D = sqrt((i - n/2)^2 + (j - m/2)^2);
        h(i,j) = 1 / (1 + (D/D0)^(2*N));
    end
end
filtered_img_butterworth_lowpass = img .* h;

% Implement the Gaussian highpass filter
[n, m] = size(img);
h = zeros(n,m);
for i = 1:n
    for j = 1:m
        D = sqrt((i - n/2)^2 + (j - m/2)^2);
        h(i,j) = 1 - exp(-(D^2)/(2*D0^2));
    end
end
filtered_img_gaussian_highpass = img - img .*h;

% Implement the Gaussian lowpass filter
[n, m] = size(img);
h = zeros(n,m);
for i = 1:n
    for j = 1:m
        D = sqrt((i - n/2)^2 + (j - m/2)^2);
        h(i,j) = exp(-(D^2)/(2*D0^2));
    end
end
filtered_img_gaussian_lowpass = img .* h;

% Display the original and filtered images
figure;
subplot(2,3,1); imshow(img); title('Original Image');
subplot(2,3,2); imshow(filtered_img_butterworth_highpass); title('Butterworth Highpass');
subplot(2,3,3); imshow(filtered_img_gaussian_highpass); title('Gaussian Highpass');
subplot(2,3,5); imshow(filtered_img_butterworth_lowpass); title('Butterworth Lowpass');
subplot(2,3,6); imshow(filtered_img_gaussian_lowpass); title('Gaussian Lowpass');