function [H, theta_range, rho] = hough_Detection(bw)
  [w, h] = size(bw);
  theta_range = -90:89;
  dMax = ceil(sqrt(w ^ 2 + h ^ 2));
  rho = -dMax : dMax;
  H = zeros(2 * dMax, length(theta_range));
  for x = 1 : w
    for y = 1 : h
      if (bw(x, y))
        for thetaIndex = 1 : length(theta_range)
          p = y * cos(theta_range(thetaIndex) * pi / 180) + x * sin(theta_range(thetaIndex) * pi / 180);
          pIndex = round(p + dMax) + 1;
          H(pIndex, thetaIndex) = H(pIndex, thetaIndex) + 1;
        end
      end
    end
  end
end
