

%% BI COSO
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

theta0 = [sym(-pi/2);sym(pi/2);0;sym(-pi/2);sym(pi/2);0];

parameter = [a,m,theta0];

% getTransformMatrix(theta, d, a, alpha)
A1 = simplify(getTransformMatrix(q(1),0,parameter(1),0));
A2 = simplify(getTransformMatrix(q(2),0,parameter(2),0));
A3 = simplify(getTransformMatrix(q(3),0,parameter(3),0));

T1 = A1;
T2 = A1*A2;
T3 = A1*A2*A3;

p0 = [0;0;0];
p1 = simplify(A1(1:3,4));
p2 = simplify(T2(1:3,4));
P = simplify(T3(1:3,4));

z0 = [0;0;1];
z1 = A1(1:3,3);
z2 = T2(1:3,3);
z3 = T3(1:3,3);

J = simplify( [cross(z0,P-p0),cross(z1,P-p1),cross(z2,P-p2);
                    z0 , z1 , z2]);













