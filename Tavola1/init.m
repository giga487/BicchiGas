clc
clear
close all

currentFile = genpath( './' );
addpath(currentFile);

g0 = sym('g0', [3 1], 'real');
d = sym('d', [6 1], 'real');
m = sym('m', [6 1], 'real');

q = sym('q', [6 1], 'real');
dq = sym('dq', [6 1], 'real');
ddq = sym('ddq', [6 1], 'real');

% t = sym('t', 'real');
% q = arrayfun(@(N) str2sym(sprintf('q%d(t)',N)), 1:6).';
% dq = arrayfun(@(N) str2sym(sprintf('dq%d(t)',N)), 1:6).';
% ddq = arrayfun(@(N) str2sym(sprintf('ddq%d(t)',N)), 1:6).';

I = sym('I', [6 1], 'real');

theta0 = [sym(-pi/2); sym(pi/2); 0; sym(-pi/2); sym(pi/2); 0];
parameter = [d, m, theta0];

%% Lancio lo script per plottare la configurazione iniziale

% main
