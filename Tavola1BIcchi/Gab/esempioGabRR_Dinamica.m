

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
l = sym('l',[6 1],'real');
m = sym('m',[6 1],'real');
J1 = sym('J1',[3 1],'real');
J2 = sym('J2',[3 1],'real');

theta0 = [sym(-pi/2);sym(pi/2);0;sym(-pi/2);sym(pi/2);0];

parameter = [a,m,theta0];

% getTransformMatrix(theta, d, a, alpha)
A1 = simplify(getTransformMatrix(q(1),0,l(1),0));

T1 = A1;


p0 = [0;0;0];
p1 = simplify(A1(1:3,4));

z0 = [0;0;1];
z1 = A1(1:3,3);


J1g = simplify( [cross(z0,p1-p0),zeros(3,1);
                    z0 , zeros(3,1)]);
                
rG1 = T1(1:3,1:3);            
%%     

A1 = simplify(getTransformMatrix(q(1),0,parameter(1,1),0));
A2 = simplify(getTransformMatrix(q(2),0,l(2),0));


T1 = A1;
T2 = A1*A2;

p0 = [0;0;0];
p1 = simplify(A1(1:3,4));
p2 = simplify(T2(1:3,4));

z0 = [0;0;1];
z1 = A1(1:3,3);
z2 = T2(1:3,3);

p0 = [0;0;0];
p1 = simplify(A1(1:3,4));
p2 = simplify(T2(1:3,4));


J2g = simplify( [cross(z0,p2-p0),cross(z1,p2-p1);
                    z0 , z1]);
rG2 = T2(1:3,1:3);                   
%% 
I1 = [J1(1),0,0;
      0, J1(2),0;
      0,0,J1(3)];
I2 = [J2(1),0,0;
      0, J2(2),0;
      0,0,J2(3)];

I1_rot = rG1*I1*rG1';
I2_rot = rG2*I2*rG2';
Bp1 = simplify(parameter(1,2)*J1g(1:3,:)'*J1g(1:3,:))
Bp2 = simplify(parameter(2,2)*J2g(1:3,:)'*J2g(1:3,:))
Bo1 = simplify(J1g(4:6,:)'*I1_rot*J1g(4:6,:));
Bo2 = simplify(J2g(4:6,:)'*I2_rot*J2g(4:6,:));

B = Bp1+Bp2+Bo1+Bo2;

C = CoriolisMatrix(B,q,dq);

g = [0,-g0,0]';
G = -(m(1)*(J1g(1:3,:)')*g + m(2)*(J2g(1:3,:)')*g);

% OK TORNA 




