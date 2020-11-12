

% PD_SIM

theta0 = [(-pi/2);(pi/2);(-pi/2);(pi/2);(-pi/2);0];

parameter = [1,1;
             1,1;
             0,1;
             1,1;
             1,1;
             1,1;];
         
parameter = [parameter,theta0];

q0 = [0,0,0,0,0,0]';
dq0 = q0;

% qd = [pi/3,0,2,0,0,0];
xd = [2,2,2]';