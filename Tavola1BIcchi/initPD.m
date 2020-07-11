
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