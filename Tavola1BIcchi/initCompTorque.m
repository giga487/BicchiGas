
clc
clear

addpath('Sim');
addpath('utils');
addpath('utils/traj');


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
dq0 = q0;
[Pcom, Etip] = forwardKinematics(parameter, q0 );

x_COM0 = Pcom;
x_endEff0 = Etip(1:3,4);

Kd_endEff = 1000;
K_endEff = [1000, Kd_endEff];

Kd_COM = 5;
K_COM = [50, Kd_COM];

qf =  [pi/3,pi/6,1.5,pi/2,pi/3,pi/4]';
[Pcom, Etip] = forwardKinematics(parameter,qf);

x_COM_D = [0;0;2];
x_endEff_D = Etip(1:3,4);

%% generazione traiettorie

Simulation_Time = 20;
t_S = 0.1;

q_vec = size(Simulation_Time/t_S,size(q0,1));
dq_vec = size(Simulation_Time/t_S,size(q0,1));
ddq_vec = size(Simulation_Time/t_S,size(q0,1));

[a0, a1, a2, a3] = pol_coeffs(q0, dq0, qf, dq0, Simulation_Time);

[r,c] = size(a0);

for i = 1:1:c
    j = 1;
    for t = 0:t_S:Simulation_Time    

        q_vec(j,i)   = a3(i)*t^3 + a2(i)*t^2 + a1(i)*t + a0(i);
        dq_vec(j,i)  = 3*a3(i)*t^2 + 2*a2(i)*t + a1(i);
        ddq_vec(j,i) = 6*a3(i)*t + 2*a2(i);
        
        t_vec(j) = t;
        j = j+1;

    end
end

figure;
plot(t_vec,q_vec(:,:));
grid on;
%%
Switch_PD_OBJ = -1; % -1 è posizione fissa, 1 è insegumento traiettoria, switch dentro al blocco

%% 
sim('CompTorque',Simulation_Time);

%% 


