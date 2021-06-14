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

L_d = 3;
q0 = [0 0 0 0 pi/4 0]';
dq0 = (zeros(1,6))';
[Pcom, Etip] = forwardKinematics(parameter, q0);

x_COM0 = Pcom;
x_endEff0 = Etip(1:3, 4);

qf =  [-pi/3, pi/3, L_d, -pi/3, pi/5, pi/3]';

[Pcom, Etip] = forwardKinematics(parameter, qf);

x_endEff_D = Etip(1:3, 4);

%%
Kp_endEff = 1000 * eye(6);
Kp_endEff(1,1) = Kp_endEff(1,1) * 10;
Kp_endEff(2,2) = Kp_endEff(2,2) * 100;
Kp_endEff(3,3) = Kp_endEff(3,3) * 100;
Kp_endEff(4,4) = Kp_endEff(4,4) * 10;
Kp_endEff(5,5) = Kp_endEff(5,5) * 10;
% Kp_endEff(6,6) = Kp_endEff(6,6) * 10000;

Kd_endEff = 100 * eye(6);
% Kd_endEff(1,1) = Kd_endEff(1,1) * 10000;
Kd_endEff(2,2) = Kd_endEff(2,2) * 10;
Kd_endEff(3,3) = Kd_endEff(3,3) * 10;
% Kd_endEff(4,4) = Kd_endEff(4,4) * 1000;
% Kd_endEff(5,5) = Kd_endEff(5,5) * 1000000;
% Kd_endEff(6,6) = Kd_endEff(6,6) * 100;

%%
R = 10 * eye(12);
B = [zeros(6); eye(6)];
A = [zeros(6)   eye(6);
     -Kp_endEff -Kd_endEff];
Q = 1 * eye(12);
P = lyap(A,Q);

mPi0 = [2; 2; 2; 2; 2; 2];

syms I(m,d)
f(m,d) = m*(d^2)/12;

I_f = f(mPi0,parameter(:,1));

Pi0 = double([mPi0(1); I_f(1); mPi0(2); I_f(2); mPi0(3); I_f(3);mPi0(4); I_f(4); mPi0(5); I_f(5); mPi0(6); I_f(6)]);


parameter_to_adapt = [parameter(:,1), mPi0, parameter(:,3)];

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


%% Introduco un errore iniziale di 0.1 rad
delta = 0.1;
q0 = q0 + delta;

%% 
tic
disp("Calcolo simulazione");
sim('AdaptiveCompTorque', Simulation_Time);
disp("Fine simulazione");
toc

%% PLOT
%%plot_error(ans, 'AdaptiveCompTorque');

adattamento = out.adattamento.signals.values;
x = 1:1:size(adattamento,1);

parSize = size(parameter,1);

figure;
hold on;
title("Controlled regressor errors");
for i = 1:1:parSize
    e = parameter(i,2)*ones(size(x,2)) - adattamento(:,i);
    plot(x, e, '.');
    leg{i,1} = "M_"+i;
end
legend(leg);
grid on;
hold off;






