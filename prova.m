clear all
clc

x1 = sym('x1', 'real');
x2 = sym('x2', 'real');
x3 = sym('x3', 'real');
g1 = [cos(x3) sin(x3) 0]';
g2 = [sin(x3) -cos(x3) 0]';

dg1_x1 = diff(g1, x1);
dg2_x1 = diff(g2, x1);
dg1_x2 = diff(g1, x2);
dg2_x2 = diff(g2, x2);
dg1_x3 = diff(g1, x3);
dg2_x3 = diff(g2, x3);

dg1 = [dg1_x1, dg1_x2, dg1_x3];
dg2 = [dg2_x1, dg2_x2, dg2_x3];

res = dg2*g1 - dg1*g2;
