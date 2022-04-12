clc
clear
close all

load('LK')
Data = mccontrolLIPMWalking20200710134816LeftKnee;

t = Data(:,1);
Right = Data(:,2:4)/180*pi;
Left = Data(:,5:7)/180*pi;

% for u=1:length(t)
% Left(u,1) = 0.00;
% Left(u,2) = 0.02;
% Left(u,3) = 0.00;
% 
% Right(u,1:3) = [0 0 0];
% end

% no
figure(1)
subplot(311); k = 1;plot(t,Right(:,k)*180/pi,t,Left(:,k)*180/pi);title('pitch')
subplot(312);k = 2; plot(t,Right(:,k)*180/pi,t,Left(:,k)*180/pi);title('roll')
subplot(313); k = 3;plot(t,Right(:,k)*180/pi,t,Left(:,k)*180/pi);title('yaw')

for i=1:length(t)
RRight(1:3,1:3,i) = rot(3,Right(i,3),3)*rot(2,Right(i,1),3)*rot(1,Right(i,2),3);
RLeft(:,:,i) = rot(3,Left(i,3),3)*rot(2,Left(i,1),3)*rot(1,Left(i,2),3);

D_r(:,:,i) = RRight(:,:,i);
D_l(:,:,i) = RLeft(:,:,i);

D_r_hat(:,:,i) = OmitNonObservable(D_r(:,:,i));
D_l_hat(:,:,i) = OmitNonObservable(D_l(:,:,i));

RRightNew(:,:,i) = D_r_hat(1:3,1:3,i)*eye(3);
RLeftNew(:,:,i) = D_l_hat(1:3,1:3,i)*eye(3);

% R(:,:,i) = RLeftNew(:,:,i);
R(:,:,i) = RRightNew(:,:,i)'*RLeftNew(:,:,i);

q(i,1) = atan2(R(2,3,i),R(3,3,i));    %roll-pitch-yaw
q(i,2) = asin(R(1,3,i));    %roll-pitch-yaw
q(i,3) = atan2(-R(1,2,i),R(1,1,i));

% q(i,1) = asin(-R(2,3,i));    %roll-pitch-yaw
% q(i,2) = atan2(R(1,3,i),R(3,3,i));    %roll-pitch-yaw


end

figure(2)
plot(t,q*180/pi)
legend('roll','pitch','yaw')
