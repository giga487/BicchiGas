function A = matrixDH(a,alfa,d,theta)
%sarebbe la matrice

% A = [cos(theta),-sin(theta)*cos(alfa),sin(theta)*sin(alfa),a*cos(theta);
%      sin(theta),cos(alfa)*cos(theta),-cos(theta)*sin(alfa),a*sin(theta);
%      0,sin(alfa),cos(alfa),d;
%      0,0,0,1];
%      
T01 = [Rx_rad(0),[0,0,d]';
       0,0,0,1];
T12 = [Rz_rad(theta),[0,0,0]';
       0,0,0,1];
T23 = [Rz_rad(0),[a,0,0]';
       0,0,0,1];
T34 = [Rx_rad(alfa),[0,0,0]';
       0,0,0,1];
   
A = T01*T12*T23*T34;
end