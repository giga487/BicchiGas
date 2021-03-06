clc
% clear
close all

currentFile = genpath( './' );
addpath(currentFile);

% load('B_matrix.mat');
% load('C_matrix.mat');
% load('G_matrix.mat');

% matlabFunction(B,'File','B_fun');
% matlabFunction(C,'File','C_fun');
% matlabFunction(G,'File','G_fun');

parameter = [0,     10;
             1,     5;
             0,     10;
             0,     2;
             0,     4;
             1,     2;];
         
theta0 = [(-pi/2); (pi/2); 0; (-pi/2); (pi/2); 0];
parameter = [parameter, theta0];

L_d = 3;
q0 = [0 0 1 0 0 0]';
dq0 = (zeros(1,6))';
[Pcom, Etip] = forwardKinematics(parameter, q0);

x_COM0 = Pcom;
x_endEff0 = Etip(1:3, 4);

qf =  [-pi/3, pi/3, L_d, -pi/3, pi/3, pi/3]';
qf(3) = 2;

[Pcom, Etip] = forwardKinematics(parameter, qf);

x_endEff_D = Etip(1:3, 4);

%%
% Kp_endEff = 10000;
% Ki_endEff = 10;
% Kd_endEff = 10;

Kp_endEff = 1 * eye(6);
Kp_endEff(1,1) = Kp_endEff(1,1) * 1000000;
Kp_endEff(2,2) = Kp_endEff(2,2) * 100000;
Kp_endEff(3,3) = Kp_endEff(3,3) * 100000;
Kp_endEff(4,4) = Kp_endEff(4,4) * 10000;
Kp_endEff(5,5) = Kp_endEff(5,5) * 10000;
Kp_endEff(6,6) = Kp_endEff(6,6) * 100;

Ki_endEff = 1 * eye(6);
Ki_endEff(1,1) = Ki_endEff(1,1) * 1000000;
Ki_endEff(2,2) = Ki_endEff(2,2) * 100000;
Ki_endEff(3,3) = Ki_endEff(3,3) * 100000;
Ki_endEff(4,4) = Ki_endEff(4,4) * 10000;
Ki_endEff(5,5) = Ki_endEff(5,5) * 10000;
Ki_endEff(6,6) = Ki_endEff(6,6) * 100;

Kd_endEff = 1 * eye(6);
Kd_endEff(1,1) = Kd_endEff(1,1) * 10000;
Kd_endEff(2,2) = Kd_endEff(2,2) * 10000;
Kd_endEff(3,3) = Kd_endEff(3,3) * 1000;
Kd_endEff(4,4) = Kd_endEff(4,4) * 100;
Kd_endEff(5,5) = Kd_endEff(5,5) * 1000;
Kd_endEff(6,6) = Kd_endEff(6,6) * 10;

%% generazione traiettorie
Simulation_Time = 50;
t_S = 0.1;

q_vec = size(Simulation_Time/t_S,size(q0, 1));
dq_vec = size(Simulation_Time/t_S,size(q0, 1));
ddq_vec = size(Simulation_Time/t_S,size(q0, 1));

[a0, a1, a2, a3] = pol_coeffs(q0, dq0, qf, dq0, Simulation_Time);

[r,c] = size(a0);

for i = [1, 2, 3, 4, 5, 6]
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

for x = 1:1:6
    leg{x} = sprintf('q_%d\n', x);
end

legend(leg);
grid on;

%%
tic
disp("Calcolo simulazione");
% sim('PID', Simulation_Time);
disp("Fine simulazione");
toc

%% PLOT

% plot_error(ans, 'PID');
