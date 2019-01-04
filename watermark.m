function y = watermark(image, logo)
	x = image;
	a = logo;
	a = rgb2gray(double(a));

	x1 = x(:,:,1);
	x2 = x(:,:,2);
	x3 = x(:,:,3);
	dx1 = my_dct2(x1); dc11 = dx1;
	dx2 = my_dct2(x2); dc22 = dx2;
	dx3 = my_dct2(x3); dc33 = dx3;
	% load m.dat % binary mask for watermarking
	g = 10; % Coefficient for watermark's strength

	[rm, cm] = size(a);
	dx1(1:rm,1:cm) = dx1(1:rm, 1:cm) + g*a;
	dx2(1:rm,1:cm) = dx2(1:rm, 1:cm) + g*a;
	dx3(1:rm,1:cm) = dx3(1:rm, 1:cm) + g*a;
	figure; 
	subplot(1,3,1); imshow(dx1); title('dx1 - R');
	subplot(1,3,2); imshow(dx2); title('dx2 - G');
	subplot(1,3,3); imshow(dx3); title('dx3 - B');

	y1 = my_idct2(dx1);
	y2 = my_idct2(dx2);
	y3 = my_idct2(dx3);
	y(:,:,1) = y1;
	y(:,:,2) = y2;
	y(:,:,3) = y3;
	figure;
	% subplot(231); imshow(y1); title('y1');
	% subplot(232); imshow(y3); title('y2');
	% subplot(233); imshow(y3); title('y3');
	subplot(121); imshow(y/255); title('Watermarked image');
	subplot(122); imshow(abs(y-x)*100); title('comparision b/w y and x') % comparision
end