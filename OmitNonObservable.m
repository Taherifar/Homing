function Dhat = OmitNonObservable(D)

ez = [0;0;1];

Crossvector = cross(ez,tilt(D));

theta = AngleofVectors(ez,tilt(D));

N = norm(Crossvector);

Dhat = rot(Crossvector/N,-theta,4);

% q = rot2q(D); %other method
% Dhat = zeros(4,4); Dhat(4,4) = 1;
% Dhat(1:3,1:3) = rot(2,q(2),3)*rot(1,q(1),3);


end

