close all
clear all
clc

syms m1 m2 M l gravity r B C D F b1 b2 f g h real
% q = [theta dtheta x dx]
% dq = [dtheta ddtheta dx ddx]
q = sym('q',[4,1],'real');
dq = sym('dq',[4,1],'real');

dq(1) = q(2);
dq(2) = ((-b1*q(2))/D + ((b2*q(4) - gravity*l*sin(q(1))*B) * l*cos(q(1))*B) / ((C + l*cos(q(1))*B) * D*C) - (gravity*l*sin(q(1))*B)/C ) - F * (l*cos(q(1))*B) / ((C + l*cos(q(1))*B)*D);
dq(3) = q(4);
dq(4) = ((-b2*q(4) - gravity*l*sin(q(1))*B)) / (C + l*cos(q(1))*B) + F / ((C + l*cos(q(1))*B)*D);

f(1) = q(2);
f(2) = ((-b1*q(2))/D + ((b2*q(4) - gravity*l*sin(q(1))*B) * l*cos(q(1))*B) / ((C + l*cos(q(1))*B) * D*C) - (gravity*l*sin(q(1))*B)/C);
f(3) = q(4);
f(4) = ((-b2*q(4) - gravity*l*sin(q(1))*B)) / (C + l*cos(q(1))*B);
f = f';

g(1) = 0;
g(2) = (l*cos(q(1))*B) / ((C + l*cos(q(1))*B)*D);
g(3) = 0;
g(4) = 1 / ((C + l*cos(q(1))*B)*D);
g = g';

h(1) = q(1);
h(2) = q(3);
h = h';

%%

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

% matlabFunction(f,'File','f_fun');
% matlabFunction(g,'File','g_fun');
% matlabFunction(h,'File','h_fun');
