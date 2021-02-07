clc
% clear
close all

currentFile = genpath( './' );
addpath(currentFile);

parameter = [0,     10;
             1,     5;
             0,     10;
             0,     2;
             0,     4;
             1,     2;];
         
theta0 = [(-pi/2); (pi/2); 0; (-pi/2); (pi/2); 0];
parameter = [parameter, theta0];

K_endEff = [1000, 10];

q0 = [0 0 0 0 0 0]';
dq0 = q0;
[Pcom, Etip] = forwardKinematics(parameter, q0);

x_COM0 = Pcom;
x_endEff0 = Etip(1:3,4);

qf =  [-pi/3, pi/3, 3, -pi/3, pi/3, pi/3]';
[Pcom, Etip] = forwardKinematics(parameter,qf);

x_endEff_D = Etip(1:3,4);

%% generazione traiettorie
Simulation_Time = 25;
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

for x = 1:1:6
    leg{x} = sprintf('q_%d\n', x);
end
legend(leg);
grid on;

%%
% Kp_endEff = 100;
% Kd_endEff = 10;
Vp = [100 100 100 100 100 100];
Vd = [10 10 10 10 10 10];
Kp_endEff = diag(Vp);
Kd_endEff = diag(Vd);
K_endEff = [Kp_endEff, Kd_endEff];

%% 
tic
disp("Calcolo simulazione");
sim('CompTorque', Simulation_Time);
disp("Fine simulazione");
toc

%% PLOT
plot_error(ans, 'CompTorque');
