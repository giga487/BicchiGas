
clc
clear

addpath('Sim');
addpath('utils');



parameter = [0.50,1;
             0.3,1;
             0,1;
             0,1;
             0,1;
             0.4,1;];
         
theta0 = [(-pi/2);(pi/2);0;(-pi/2);(pi/2);0];
parameter = [parameter,theta0];

% parameter = [d,m,theta0];

q0 = [0,0,0,0,0,0]';
dq = q0;
[Pcom, Etip] = forwardKinematics(parameter, q0 );

x_COM0 = Pcom;
x_endEff0 = Etip(1:3,4);

Kd_endEff = 5;
K_endEff = [1000, Kd_endEff];

Kd_COM = 5;
K_COM = [50, Kd_COM];

qf =  [pi/3,0,1,0,pi/3,0]';
[Pcom, Etip] = forwardKinematics(parameter,qf);

x_COM_D = [0;0;2];
x_endEff_D = Etip(1:3,4);


