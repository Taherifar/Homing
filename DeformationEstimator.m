function [ D ] = DeformationEstimator(RIMURigid_r,RIMURigid_m,RIMURigid_l,RIMU_r,RIMU_m,RIMU_l)
%Calculates an estimate of deformation rotation matrix.
%   RIMU: Several rotation matrices calculated by IMU observer.
%       RIMU_r: Right IMU rotation matrix.
%       RIMU_m: Middle IMU rotation matrix.
%       RIMU_l: Left IMU rotation matrix.
%   RIMURigid: Several rigid rotation matrices calculated by IMU observer.
%   D: Matrix of several deformation rotation matrices.
%       D_r: Right deformation rotation matrix.
%       D_l: Left deformation rotation matrix.
%       D_m: Middle deformation rotation matrix.
%% Deflection Rotation Matrices

D_r = RIMU_r*RIMURigid_r';
D_l = RIMU_l*RIMURigid_l';
D_m = RIMU_m*RIMURigid_m';

D = [D_r;D_l;D_m];
end