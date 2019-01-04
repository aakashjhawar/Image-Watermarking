clc; clear all; close all;

x = double(imread('images/watermarked.jpg'));
figure; 
subplot(121); imshow(x/255); title('Watermarked Image');
y = x; 
a = (imresize(imread('LNMIIT_colour.jpg'),[512 512]));
subplot(122); imshow(a); title('Logo');
a = rgb2gray(double(a));
z = a;
 g = 2; % Coefficient for watermark's strength
[rm, cm] = size(a);

% Dewatermarking
y = x;
dy1 = my_dct2(y(:,:,1));
dy2 = my_dct2(y(:,:,2));
dy3 = my_dct2(y(:,:,3));
dy1(1:rm,1:cm) = dy1(1:rm, 1:cm) -g * a;
dy2(1:rm,1:cm) = dy2(1:rm, 1:cm) -g * a;
dy3(1:rm,1:cm) = dy3(1:rm, 1:cm) -g * a;
y11 = my_idct2(dy1);
y22 = my_idct2(dy2);
y33 = my_idct2(dy3);
yy(:,:,1) = y11;
yy(:,:,2) = y22;
yy(:,:,3) = y33;

% figure; 
% subplot(121); imshow(yy/255); title('Dewatermarked image');
% subplot(122); imshow(abs(yy-x)*10000); title('comparision b/w yy and x');
% comparision showing all black image for no difference between yy and x

figure;
subplot(121); imshow(y/255); title('Watermarked Image');
subplot(122); imshow(yy/255); title('Dewatermarked Image');