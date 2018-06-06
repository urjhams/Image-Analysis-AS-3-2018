%function [Hough,thetaRange,pRange] = hough_Detection(bw,gradient)
%  [rows, cols] = size(bw);
%  thetaMax = 90;
%  pMax = ceil(sqrt((cols - 1).^2 + (rows - 1).^2));   % ceil in octave = floor in matlab
%  thetaRange = -90:(thetaMax - 1);
%  pRange = -pMax:pMax;

%  Hough = zeros(pMax * 2 + 1,180);

%  for row = 1:rows
%    for col = 1:cols
%      if bw(row,col) > 0
%        x = col - 1;
%        y = row - 1;
%        for theta = thetaRange
%          p = round(x * cosd(theta) + y * sind(theta));
%          pIndex = p + pMax + 1;
%          thetaIndex = theta + thetaMax + 1;
%          Hough(pIndex, thetaIndex) = Hough(pIndex, thetaIndex) + 1
%        end
%      end
%    end
%  end
%end

function [H,theta_range,P_range] = hough_Detection(bw,gradient)
  [w, h] = size(bw);
  pMax = ceil(sqrt((w - 1).^2 + (h - 1).^2));
  theta_range = -90:89;
  p_range = -pMax:pMax
  H = zeros(2 * pMax + 1, 180);

  for x = 1:w
    for y = 1:h
      for theta = theta_range
        p = x * cosd(theta) + y * sind(theta);
        pIndex = round(p + pMax) + 1;
        H(pIndex,theta) = H(pIndex,theta) + 1;
      end
    end
  end
end
