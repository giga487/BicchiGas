
clc
clear
close all

%file init
addpath('utils');
addpath('PD');

syms g0 real
q = sym('q',[6 1],'real');
dq = sym('dq',[6 1],'real');
a = sym('a',[6 1],'real');
m = sym('m',[6 1],'real');
% a = [1,1,1,1,1,1,1];
% m = [1,1,1,1,1,1,1];


parameter = [a,m];

%% Lancio lo script per plottare la configurazione iniziale

main