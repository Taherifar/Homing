function q=rot2q(R)
% gamma=asin(R(2,1));
% alpha=asin(-R(2,3)/cos(gamma));
% beta=asin(-R(3,1)/cos(gamma));

beta = asin(-R(3,1));
% beta = asin(R(3,1));
alpha = asin(R(3,2)/cos(beta));
% alpha = atan2(R(3,2),R(3,3));
gamma = atan2(R(2,1),R(1,1));
q = [alpha; beta; gamma];
end