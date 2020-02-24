
clc
clear
close all

%file init
addpath('utils');

q = sym('q',[6 1],'real');
dq = sym('dq',[6 1],'real');
a = sym('a',[6 1],'real');
m = sym('m',[6 1],'real');
% a = [1,1,1,1,1,1,1];
% m = [1,1,1,1,1,1,1];

sym g0

parameter = [a;
             m];
