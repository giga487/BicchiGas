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
Kp_endEff = 50 * eye(6);
Kp_endEff(1,1) = Kp_endEff(1,1) * 2;
Kp_endEff(2,2) = Kp_endEff(2,2) * 2;
% Kp_endEff(3,3) = Kp_endEff(3,3) * 10;
% Kp_endEff(4,4) = Kp_endEff(4,4) * 10;
% Kp_endEff(5,5) = Kp_endEff(5,5) * 10;
% Kp_endEff(6,6) = Kp_endEff(6,6) * 10;

Kd_endEff = 5 * eye(6);
Kd_endEff(1,1) = Kd_endEff(1,1) * 2;
Kd_endEff(2,2) = Kd_endEff(2,2) * 2;
Kd_endEff(3,3) = Kd_endEff(3,3) * 0.1;
% Kd_endEff(4,4) = Kd_endEff(4,4) * 10;
% Kd_endEff(5,5) = Kd_endEff(5,5) * 10;
% Kd_endEff(6,6) = Kd_endEff(6,6) * 10;

R = 1 * eye(6);
B = [zeros(6); eye(6)];
A = [zeros(6)   eye(6);
     -Kp_endEff -Kd_endEff];
Q = 1 * eye(12);
P = lyap(A,Q);

% ho inserito delle masse casuali, tutte 2.
mPi0 = [2; 2; 2; 2; 2; 2];

% scrivo una funzione simbolica per fare prima,
% tanto I_f è simmetrica, ho preso Ixx.
% syms I(m,d)
% f(m,d) = m*(d^2)/12;
%I_f ora è un vettore dipendente dai parametri mPi0 che gli passo.
% I_f = f(mPi0,parameter(:,1));
%Inserisco i valore I_f all'interno di Pi0 che è il vettore da cui
%inizializzo l'integratore
% Pi0 = double([mPi0(1); I_f(1); mPi0(2); I_f(2); mPi0(3); I_f(3);mPi0(4); I_f(4); mPi0(5); I_f(5); mPi0(6); I_f(6)]);
Pi0 = double([mPi0(1); mPi0(2); mPi0(3); mPi0(4); mPi0(5); mPi0(6)]);

%Calcolo il PI corretto, così non me lo calcolo
% I_f = f(parameter(:,2),parameter(:,1));
% Pi_OK = double([parameter(1,2); I_f(1); parameter(2,2); I_f(2); parameter(3,2); I_f(3);parameter(4,2); I_f(4); parameter(5,2); I_f(5); parameter(6,2); I_f(6)]);
Pi_OK = double([parameter(1,2); parameter(2,2); parameter(3,2); parameter(4,2); parameter(5,2); parameter(6,2)]);
%Creo un vettore di parametri iniziali volutamente errati,
%e passerò questi parametri al blocco di controllo del sistema.
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
    leg{x,1} = sprintf('q_%d\n', x);
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

%Nel blocco Errore Adattamento vado a valutare solamente l'errore delle
%masse questo perchè i valori delle Inerzie non sono parametri fissi, ma
%dipendono dall'angolo del braccio, col blocco Errore Adattamento
%visualizzo l'errore di tutto il blocco Pi, ma sopratutto vado ad estrarre
%le masse, che visualizzo con questa sezione dello script.

adattamento = out.adattamento.signals.values;
x = out.tout;

parSize = size(parameter,1);

figure;
hold on;
title("Controlled regressor errors");
for i = 1:1:parSize
    e = parameter(i,2)*ones(size(x,2)) - adattamento(:,i);
    plot(x, e, '.');
    leg{i,1} = "M_"+i; %inserisco nella tabella una label
end
legend(leg);
grid on;
hold off;
