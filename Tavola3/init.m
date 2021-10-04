

clc
clear


p = genpath("./");

addpath(p);


%% Parameter Init
l = 0.2; %m
gravity = 9.81; %m/s^2
r = 0.02; %m
m1 = 0.088338025; %kg
m2 = 0.022245336; %kg
M = 0.548069759; %kg

b1 = 0.1;
b2 = 0.1;

B = m1 + m2/3;
C = m1 + m2 + M;
D = 2/5 * m1 * r^2;

q0 = [0,0,0,0]';
delta = 0.1;
q0 = q0 + delta;
%% K control


kp = 100;
kd = 4;

KControl = [kp, kd];
%% Peso del controllo
K1 = 0.3;
K2 = 0.8;

K = [K1,K2];

