clc
clearvars -except tau_PDtraj tau_CompTorque tau_AdCompTorque t_PDtraj t_CompTorque t_AdCompTorque
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
% q0 = [0 0 L_d 0 0 0]';
q0 = [0 0 0 0 0 0]';
dq0 = (zeros(1,6))';
[Pcom, Etip] = forwardKinematics(parameter, q0);

x_COM0 = Pcom;
x_endEff0 = Etip(1:3, 4);

qf =  [-pi/3, pi/3, L_d, -pi/3, pi/3, pi/3]';
% qf = q0;

[Pcom, Etip] = forwardKinematics(parameter, qf);

x_endEff_D = Etip(1:3, 4);

%%
% Kp_endEff = 1 * eye(6);
% Kp_endEff(1,1) = Kp_endEff(1,1) * 1000;
% Kp_endEff(2,2) = Kp_endEff(2,2) * 100000;
% Kp_endEff(3,3) = Kp_endEff(3,3) * 10000;
% Kp_endEff(4,4) = Kp_endEff(4,4) * 10000;
% Kp_endEff(5,5) = Kp_endEff(5,5) * 10000;
% Kp_endEff(6,6) = Kp_endEff(6,6) * 10;
% 
% Kd_endEff = 1 * eye(6);
% Kd_endEff(1,1) = Kd_endEff(1,1) * 100;
% Kd_endEff(2,2) = Kd_endEff(2,2) * 1000;
% Kd_endEff(3,3) = Kd_endEff(3,3) * 1000;
% Kd_endEff(4,4) = Kd_endEff(4,4) * 1000;
% Kd_endEff(5,5) = Kd_endEff(5,5) * 1000;
% Kd_endEff(6,6) = Kd_endEff(6,6) * 10;

Kp_endEff = 1 * eye(6);
Kp_endEff(1,1) = Kp_endEff(1,1) * 1000;
Kp_endEff(2,2) = Kp_endEff(2,2) * 100000;
Kp_endEff(3,3) = Kp_endEff(3,3) * 10000;
Kp_endEff(4,4) = Kp_endEff(4,4) * 10000;
Kp_endEff(5,5) = Kp_endEff(5,5) * 10000;
Kp_endEff(6,6) = Kp_endEff(6,6) * 10;

Kd_endEff = 1 * eye(6);
Kd_endEff(1,1) = Kd_endEff(1,1) * 100;
Kd_endEff(2,2) = Kd_endEff(2,2) * 1000;
Kd_endEff(3,3) = Kd_endEff(3,3) * 1000;
Kd_endEff(4,4) = Kd_endEff(4,4) * 1000;
Kd_endEff(5,5) = Kd_endEff(5,5) * 1000;
Kd_endEff(6,6) = Kd_endEff(6,6) * 10;

%%
R = 1 * eye(6);
B = [zeros(6); eye(6)];
A = [zeros(6)   eye(6);
     -Kp_endEff -Kd_endEff];
Q = 1 * eye(12);
P = lyap(A,Q);

% delta_m = 0.5;
delta_m = 0;
Pi0 = parameter(:,2) + delta_m;
Pi0 = double([Pi0(1); Pi0(2); Pi0(3); Pi0(4); Pi0(5); Pi0(6)]);

Pi = double([parameter(1,2); parameter(2,2); parameter(3,2); parameter(4,2); parameter(5,2); parameter(6,2)]);

parameter_to_adapt = [parameter(:,1), Pi0, parameter(:,3)];

%% generazione traiettorie
Simulation_Time = 50;
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
    leg{x,1} = sprintf('q_%d\n', x);
end

legend(leg);
grid on;


%% Introduco un errore iniziale di 0.1 rad
delta = 0.1;
% delta = 0;
q0 = q0 + delta;

%% 
tic
disp("Calcolo simulazione");
sim('AdaptiveCompTorque', Simulation_Time);
disp("Fine simulazione");
toc

%% PLOT
%Nel blocco Errore Adattamento vado a valutare solamente l'errore delle
%masse questo perch� i valori delle Inerzie non sono parametri fissi, ma
%dipendono dall'angolo del braccio, col blocco Errore Adattamento
%visualizzo l'errore di tutto il blocco Pi, ma sopratutto vado ad estrarre
%le masse, che visualizzo con questa sezione dello script.

adattamento = ans.adattamento.signals.values;
x = ans.tout;

parSize = size(parameter,1);

figure;
hold on;
title("Controlled regressor errors");
for i = 1:1:parSize
    e = parameter(i,2)*ones(size(x,2)) - adattamento(:,i);
    plot(x, e);
    leg{i,1} = "m_"+i; %inserisco nella tabella una label
end
legend(leg);
xlabel('time [s]');
ylabel('error [kg]');
grid on;
hold off;

plot_error(ans, 'AdaptiveCompTorque');
