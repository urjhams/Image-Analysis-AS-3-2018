sigma = 1;
originalImage = imread('input_ex3.jpg');
figure; subplot(1,1,1), imshow(originalImage); title('original');

%a
grayScale = mat2gray(originalImage);
figure; plot(1,1,1), imshow(grayScale,[]); title('gray scale image');

%b
[Ix, Iy] = Gradient(mean(grayScale,3),sigma);
mag = sqrt(Ix.^2 + Iy.^2);
figure; plot(1,1,1), imshow(mag,[]); title('magnitude');
