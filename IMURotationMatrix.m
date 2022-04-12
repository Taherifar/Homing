function [ RIMU ] = IMURotationMatrix( eulerIMU )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% RIMU = ((rot(1,eulerIMU(1,1),3))'*(rot(2,eulerIMU(2,1),3))'*(rot(3,eulerIMU(3,1),3))')';
RIMU = rot(3,eulerIMU(3,1),3)*rot(2,eulerIMU(2,1),3)*rot(1,eulerIMU(1,1),3);

end

