function q=rot2q_Ankle(R)

% beta = asin(-R(1,3));
% alpha = asin(R(2,3)/cos(beta));

% beta = atan2(-R(1,3),R(1,1));   %Ali: In order to increase the range, atan2 is used
% alpha = atan2(R(2,3),R(3,3));   %Ali: the order is roll-pitch with negative sign

alpha = asin(-R(3,2));                  %Ali: This is yaw-roll-pitch. but the yaw angle will not affect the roll and pitch if you use the third row
beta = atan2(R(3,1),R(3,3));

gamma = 0;
q = [alpha; beta; gamma];

end

