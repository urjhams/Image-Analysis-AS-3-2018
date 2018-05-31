function Assignment3_main()
  pkg load image;
  
  sigma = 1;
  originalImage = imread('input_ex3.jpg');
  

  %a Grayscale
  grayScale = mat2gray(originalImage);
 

  %b Gradient magnitude
  [Ix, Iy] = Gradient(mean(grayScale,3),sigma);
  mag = sqrt(Ix.^2 + Iy.^2);
  
  %c Binary mask. Tried to use imbinarize but could not test that function in octave
  %binary = im2bw (mag, "mean");
  %binary = im2bw (mag, "concavity");
  binary = im2bw (mag, 0.07);
  
  
  %d Hough transform
  
  
  %e Voting array
  
  %f Local maxima - Hough peaks
  %peaks  = houghpeaks(H,2);
  
  %g Found extrema
  
  %h Hough lines
  
  %i Final overlay
  
  
  
  subplot(2,2,1), imshow(originalImage); title('Original');
  subplot(2,2,2), imshow(grayScale,[]); title('a) gray scale');
  subplot(2,2,3), imshow(mag,[]); title('b) Gradient magnitude');
  subplot(2,2,4), imshow(binary); title('c) Binary mask');
  
End