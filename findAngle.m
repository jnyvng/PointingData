function [ang1, ang2, ang] = findAngle (ref, obj1, obj2)
dist1 = obj1 - ref;
dist2 = obj2 - ref;

ang1 = atan2(dist1(2,:), dist1(1,:))*180/pi;
ang2 = atan2(dist2(2,:), dist2(1,:))*180/pi;

ang = calcDiffAngles(ang1,ang2);

end