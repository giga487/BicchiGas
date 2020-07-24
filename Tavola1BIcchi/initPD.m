
clc
clear

addpath('Sim');
addpath('utils');



parameter = [0.50,10;
             1,5;
             0,10;
             0,2;
             0,4;
             0.4,5;];
         
theta0 = [(-pi/2);(pi/2);0;(-pi/2);(pi/2);0];
parameter = [parameter,theta0];

% parameter = [d,m,theta0];

q0 = [0,0,0,0,0,0]';
dq = q0;
[Pcom, Etip] = forwardKinematics(parameter, q0 );

x_COM0 = Pcom;
x_endEff0 = Etip(1:3,4);

Kd_endEff = 10;
K_endEff = [1000, Kd_endEff];

Kd_COM = 5;
K_COM = [50, Kd_COM];

qf =  [pi/3,0,1.5,pi/2,pi/3,0]';
[Pcom, Etip] = forwardKinematics(parameter,qf);

x_COM_D = [0;0;2];
x_endEff_D = Etip(1:3,4);

Switch_PD_OBJ = -1; % -1 è posizione fissa, 1 è insegumento traiettoria, switch dentro al blocco
Simulation_Time = 20;

% in caso di inseguimento di traiettoria
A_sin = 0.5;
f_sin = 1;

%% 
sim('PD',Simulation_Time);

%% 


