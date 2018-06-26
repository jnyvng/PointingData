function diff = calcDiffAngles(ang1, ang2)
ang1 = ang1(:);
ang2 = ang2(:);
diff = ang1-ang2;

diff = mod(diff,360);

lenAng = length(diff);

if (lenAng == 1)
    if diff > 180
        diff = diff - 360;
    elseif diff < -180
        diff = diff + 360;
    end
else
    diff(diff>180) = diff(diff>180) - 360;
    diff(diff<-180) = diff(diff<-180) + 360;
end


end