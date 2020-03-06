
clc
clear
close all

%file init
addpath('utils');

syms g0
q = sym('q',[6 1],'real');
dq = sym('dq',[6 1],'real');
a = sym('a',[6 1],'real');
m = sym('m',[6 1],'real');
% a = [1,1,1,1,1,1,1];
% m = [1,1,1,1,1,1,1];


parameter = [a,m];
