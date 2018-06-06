function [H,theta_range,p_range] = hough_Detection(bw)
  [h, w] = size(bw);
  pMax = ceil(sqrt(w.^2 + h.^2));
  theta_range = -90:89;
  p_range = -pMax:pMax;
  H = zeros(2 * pMax + 1, length(p_range));

  for x = 1:w
    for y = 1:h
      if bw(x,y) ~= 0
        for thetaIndex = 1:length(theta_range)
          p = x * cos(theta_range(thetaIndex) + pi/180) + y * sin(theta_range(thetaIndex) + pi/180);
          pIndex = round(p + pMax) + 1;
          H(pIndex,thetaIndex) = H(pIndex,thetaIndex) + 1;
        end
      end
    end
  end
end
