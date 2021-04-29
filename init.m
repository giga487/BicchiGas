clc
clear
close all

currentFile = genpath( './' );
addpath(currentFile);

g0 = sym('g0', [3 1], 'real');
q = sym('q', [6 1], 'real');
dq = sym('dq', [6 1], 'real');
ddq = sym('ddq', [6 1], 'real');
d = sym('d', [6 1], 'real');
m = sym('m', [6 1], 'real');

theta0 = [sym(-pi/2); sym(pi/2); 0; sym(-pi/2); sym(pi/2); 0];
parameter = [d, m, theta0];

%% Lancio lo script per plottare la configurazione iniziale

% main
