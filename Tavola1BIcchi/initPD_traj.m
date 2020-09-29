
clc
clear
close all

currentFile = genpath( './' );
addpath(currentFile);

%%

parameter = [0.50,10;
             1,5;
             0,10;
             1,2;
             0,4;
             1, 2;];
         
theta0 = [(-pi/2);(pi/2);0;(-pi/2);(pi/2);0];
parameter = [parameter,theta0];

q0 = [0,0,1,0,0,0]';
dq0 = q0;
[Pcom, Etip] = forwardKinematics(parameter, q0);

x_COM0 = Pcom;
x_endEff0 = Etip(1:3,4);

K_endEff = [1000, 10];

qf =  [-pi/3,pi/6,1.5,pi/2,pi/3,0]';
%qf =  [q0(1:end-1);0];
[Pcom, Etip] = forwardKinematics(parameter,qf);

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
q_vec(:,3)   = qf(3);
dq_vec(:,3)   = 0;
ddq_vec(:,3)   = 0;
figure;
plot(t_vec,q_vec(:,:));
for x = 1:1:6
    leg{x} = sprintf('Tau_%d\n', x);
end
legend(leg);
grid on;

%% 
tic
display("Calcolo simulazione ");
sim('PD_traj',Simulation_Time);
display("Fine simulazione ");
toc
%% PLOT

plot_error(ans, 'PD_traj');

