function [ Rd ] = rot( axis, q, dim)
cq = cos(q);
sq = sin(q);
if length(axis)==1
    if axis==1
        R=[1 0 0 0;0 cq -sq 0;0 sq cq 0;0 0 0 1];
    elseif axis==2
        R=[cq 0 sq 0;0 1 0 0;-sq 0 cq 0;0 0 0 1];
    elseif axis==3
        R=[cq -sq 0 0;sq cq 0 0;0 0 1 0;0 0 0 1];
    else
%         wrong axis
        stop
    end
elseif length(axis)==3
    
    ux=axis(1); uy=axis(2); uz=axis(3);
    
    R = [cq+ux^2*(1-cq)      ux*uy*(1-cq)-uz*sq  ux*uz*(1-cq)+uy*sq  0;
         ux*uy*(1-cq)+uz*sq  cq+uy^2*(1-cq)      uy*uz*(1-cq)-ux*sq  0;
         ux*uz*(1-cq)-uy*sq  uy*uz*(1-cq)+ux*sq  cq+uz^2*(1-cq)      0;
         0                   0                   0                   1];
    
else
%     wrong axis
    stop
end
if and(dim~=3,dim~=4)
%     wrong dimension
    stop
end
Rd=R(1:dim,1:dim);
end

