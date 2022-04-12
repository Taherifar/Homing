function theta = AngleofVectors(u,v)


CosTheta = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
theta = real(acos(CosTheta));

end

