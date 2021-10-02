close all
clear all
clc

syms m1 m2 M l g r B C D F b1 b2 f g h real
% q = [theta dtheta x dx]
% dq = [dtheta ddtheta dx ddx]
q = sym('q',[4,1],'real');
dq = sym('dq',[4,1],'real');

dq(1) = q(2);
dq(2) = ( (-b1*q(2))/D + ((b2*q(4) - g*l*sin(q(1))*B) * l*cos(q(1))*B) / ((C + l*cos(q(1))*B) * D*C) - (g*l*sin(q(1))*B)/D ) - F * (l*cos(q(1))*B) / ((C + l*cos(q(1))*B)*D);
dq(3) = q(4);
dq(4) = ((-b2*q(4) - g*l*sin(q(1))*B)) / (C + l*cos(q(1))*B) + F / ((C + l*cos(q(1))*B)*D);

f(1) = q(2);
f(2) = ( (-b1*q(2))/D + ((b2*q(4) - g*l*sin(q(1))*B) * l*cos(q(1))*B) / ((C + l*cos(q(1))*B) * D*C) - (g*l*sin(q(1))*B)/D );
f(3) = q(4);
f(4) = ((-b2*q(4) - g*l*sin(q(1))*B)) / (C + l*cos(q(1))*B);
f = f';

g(1) = 0;
g(2) = (l*cos(q(1))*B) / ((C + l*cos(q(1))*B)*D);
g(3) = 0;
g(4) = 1 / ((C + l*cos(q(1))*B)*D);
g = g';

h(1) = q(1);
h(2) = q(3);
h = h';
