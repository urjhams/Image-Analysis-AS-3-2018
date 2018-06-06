function Assignment3_main()
  pkg load image;

  sigma = 1;
  originalImage = imread('input_ex3.jpg');


  %------------------ a Grayscale
  grayScale = mat2gray(originalImage);

  %------------------ b Gradient magnitude
  [Ix, Iy] = Gradient(mean(grayScale,3),sigma);
  mag = sqrt(Ix.^2 + Iy.^2);

  %------------------ c Binary mask.
  %Tried to use imbinarize but could not test that function in octave
  %binary = im2bw (mag, "mean");
  %binary = im2bw (mag, "concavity");
  bw = im2bw (mag, 0.07);

  %------------------ d Hough transform implement
  [H,thetas,P] = hough_Detection(bw);

  %------------------ e Voting array ploting
  figure; plot(1, 1, 1), imagesc(thetas, P, H), colormap('gray'); title('Hough voting result');

  %------------------ f Local maxima - Hough peaks
  peaks = houghpeaks(H, 20, 'threshold', ceil(0.3 * max(H(:))));

  %------------------ g Found extrema
  figure; subplot(3, 2, 4), imagesc(thetas, P, H), colormap('gray'); title('Hough peaks');
  axis on, axis normal, hold on;
  plot(thetas(peaks(:, 2)), P(peaks(:, 1)), 's', 'color', 'blue');

  %------------------ h Hough lines
  lines = houghlines(bw, thetas, P, peaks,'FillGap', 20, 'MinLength', 20);

  %------------------ i Final overlay


  figure;
  subplot(2,2,1), imshow(originalImage); title('Original');
  subplot(2,2,2), imshow(grayScale,[]); title('a) gray scale');
  subplot(2,2,3), imshow(mag,[]); title('b) Gradient magnitude');
  subplot(2,2,4), imshow(binary); title('c) Binary mask');

End
