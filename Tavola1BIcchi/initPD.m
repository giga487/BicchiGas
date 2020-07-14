
clc
clear

addpath('Sim');
addpath('utils');



parameter = [1,1;
             1,1;
             0,1;
             1,1;
             1,1;
             1,1;];
         
theta0 = [(-pi/2);(pi/2);0;(-pi/2);(pi/2);0];
parameter = [parameter,theta0];

% parameter = [d,m,theta0];


[Pcom, Etip] = forwardKinematics(parameter, [0,0,0,0,0,0]');

x_com0 = Pcom;
x_endEff0 = Etip(1:3,4);

Kp = 100;
Kd = 10;

[Pcom, Etip] = forwardKinematics(parameter, [pi/3,0,2,0,pi/3,0]');

x_com_D = Pcom;
x_endEff_D = Etip(1:3,4);


