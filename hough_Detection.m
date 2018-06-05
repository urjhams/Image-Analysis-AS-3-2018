function [Hough,thetaRange,pRange] = hough_Detection(bw,gradient)
  [rows, cols] = size(bw);
  thetaMax = 90;
  pMax = ceil(sqrt((cols - 1).^2 + (rows - 1).^2));   % ceil in octave = floor in matlab
  thetaRange = -90:(thetaMax - 1);
  pRange = -pMax:pMax;

  Hough = zeros(pMax * 2 + 1,180);

  for row = 1:rows
    for col = 1:cols
      if bw(row,col) > 0
        x = col - 1;
        y = row - 1;
        for theta = thetaRange
          p = round(x * cosd(theta) + y * sind(theta));
          pIndex = p + pMax + 1;
          thetaIndex = theta + thetaMax + 1;
          Hough(pIndex, thetaIndex) = Hough(pIndex, thetaIndex) + 1
        end
      end
    end
  end
end
