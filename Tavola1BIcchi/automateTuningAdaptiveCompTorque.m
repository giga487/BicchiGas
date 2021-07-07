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

%% generazione traiettorie
S_Time = 25;
T_s = 0.1;

[a0, a1, a2, a3] = InitSimulationAdaptiveCompTorque(q0, dq0, qf, dq0, S_Time, T_s);

%Introduco un errore iniziale di 0.1 rad, NON sul calcolo delle traiettorie
%questo parametro viene preso dalla simulazione

delta = 0.1;
q0 = q0 + delta;
%%

Kp_endEff = 100 * eye(6);
Kp_endEff(1,1) = Kp_endEff(1,1) * 2;
Kp_endEff(2,2) = Kp_endEff(2,2) * 50;
Kp_endEff(3,3) = Kp_endEff(3,3) * 5;
Kp_endEff(4,4) = Kp_endEff(4,4) * 10;
Kp_endEff(5,5) = Kp_endEff(5,5) * 10;
Kp_endEff(6,6) = Kp_endEff(6,6) * 10;

Kd_endEff = 10 * eye(6);
Kd_endEff(1,1) = Kd_endEff(1,1) * 10;
Kd_endEff(2,2) = Kd_endEff(2,2) * 50;
Kd_endEff(3,3) = Kd_endEff(3,3) * 2;
Kd_endEff(4,4) = Kd_endEff(4,4) * 5;
Kd_endEff(5,5) = Kd_endEff(5,5) * 5;
Kd_endEff(6,6) = Kd_endEff(6,6) * 10;

% ho inserito delle masse casuali, tutte 2.
% mPi0 = [2; 2; 2; 2; 2; 2];
delta_m = 0.5;
mPi0 = parameter(:,2) + delta_m;

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

eRx = [];

R = 1*r*eye(6);
B = [zeros(6); eye(6)];
A = [zeros(6)   eye(6);
     -Kp_endEff -Kd_endEff];
Q = 1 * eye(12);
P = lyap(A,Q);


%% 
for i = 1:1:2
    
    Q = 1*i * eye(12);
    P = lyap(A,Q);
    
    in(i) = Simulink.SimulationInput('AdaptiveCompTorque');
    in(i) = in(i).setBlockParameter('AdaptiveCompTorque/','P',num2str(P));
end

%% 
tic
disp("Calcolo simulazione");
SimOut = parsim(in,'ShowSimulationManager','on','ShowProgress','on');
%SimOut = sim('AdaptiveCompTorque', S_Time);

disp("Fine simulazione");
toc

%% 
outputErrorJoint = SimOut.e_joint.signals.values(end,:);
rx = 0;
for i = 1:1:size(q0,1)
    rx = outputErrorJoint(end,i)^2 + rx;
end

eRx(end+1,1) = sqrt(rx);



