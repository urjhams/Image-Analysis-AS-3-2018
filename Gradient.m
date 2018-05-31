function [Ix, Iy] = Gradient(I, sigma)
  r = round(3*sigma);
  i = -r:r;
  g = exp(-i.^2 / (2*sigma^2)) / (sqrt(2*pi)*sigma); d = -i.*g / sigma^2;
  Ix = conv2(conv2(I, g', 'same'), d , 'same');
  Iy = conv2(conv2(I, g , 'same'), d', 'same');
end
