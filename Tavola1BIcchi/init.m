 
clc
clear
close all

%file init
addpath('utils');
addpath('Sim');


syms g0 real
q = sym('q',[6 1],'real');
dq = sym('dq',[6 1],'real');
d = sym('d',[6 1],'real');
m = sym('m',[6 1],'real');
% a = [1,1,1,1,1,1,1];
% m = [1,1,1,1,1,1,1];

% d(1) = (0);
% d(4) = (0);
% d(5) = (0);

theta0 = [sym(-pi/2);sym(pi/2);0;sym(-pi/2);sym(pi/2);0];

parameter = [d,m,theta0];



%% Lancio lo script per plottare la configurazione iniziale

% main