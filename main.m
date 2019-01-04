clc; clear all; close all;

x = double(imread('images/Lenna.png'));
figure; 
subplot(121); imshow(x/255); title('Original Image');
y = x; 
% a = zeros(512, 512);
% a(100:250,100:350) = 1;
a = imread('images/LNMIIT.jpg');
subplot(122); imshow(a); title('Logo');
% save m.dat a -ascii

% Watermarking
y = watermark(x,a);
z = y;
[r,c,s] = size(z);

% Dewatermarking
% Clean Image (known mask)
yy = dewatermark(x,z,a);

figure;
subplot(131); imshow(x/255); title('Original Image');
subplot(132); imshow(y/255); title('Watermarked Image');
subplot(133); imshow(yy/255); title('Dewatermarked Image');
% comparision showing all black image for no difference between yy and x