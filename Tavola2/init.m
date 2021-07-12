

% Carro ponte, non chiedetemi perchè
clear
clc

syms L J  m_r m_p m_c theta phi dphi dtheta real
q = sym('q',[4,1],'real');
dq = sym('dq',[4,1],'real');

%% DINAMICA AGGEGGIO
%Nonlinear Dynamic Modelling and Analysis of a3-D Overhead Gantry Crane System with System Parameters Variation

m_prova = [1,2,3]';
B_11 = @(m_r, m_p, m_c)(m_r + m_p + m_c);
B_12 = 0;
B_13 = @(m_p,L,theta,phi)(m_p*L*cos(theta)*sin(phi)); 
B_14 = @(m_p,L,theta,phi)(m_p*L*sin(theta)*cos(phi));

B_21 = 0;
B_22 = @(m_p,m_c)(m_p + m_c);
B_23 = @(m_p,L,theta,phi)(m_p*L*cos(theta)*cos(phi)); 
B_24 = @(m_p,L,theta,phi)(-(m_p*L*sin(theta)*sin(phi))); 

B_31 = B_13;
B_32 = B_23;
B_33 = @(m_p, L, J)(m_p*L^2+J);
B_34 = 0;

B_41 = B_14;
B_42 = B_24;
B_43 = 0;
B_44 = @(m_p,L,theta,phi)(m_p*L^2);

% B@(m_p,m_c,m_r,L,J,theta,phi)([B_11, B_12, B_13, B_14]);
B = {B_11,B_12,B_13,B_14;
     B_21,B_22,B_23,B_24;
     B_31,B_32,B_33,B_34;
     B_41,B_42,B_34,B_44};
 
 
B_data = @(m_r,m_p,m_c,L,J,phi,theta)([B{1,1}(m_r,m_p,m_c)    , B{1,2}()               , B{1,3}(m_p,L,theta,phi), B{1,4}(m_p,L,theta,phi);
                                       B{2,1}()               , B{2,2}(m_p,m_c)        , B{2,3}(m_p,L,theta,phi), B{2,4}(m_p,L,theta,phi);
                                       B{3,1}(m_p,L,theta,phi), B{3,2}(m_p,L,theta,phi), B{3,3}(m_p, L, J)      , B{3,4}();
                                       B{4,1}(m_p,L,theta,phi), B{4,2}(m_p,L,theta,phi), B{4,3}()               , B{4,4}(m_p,L,theta,phi)]);


m_r = 1;
m_p = 2;
m_c = 5;
L = 10;
J = 100;

% 
% B_now = B_data(m_r,m_p,m_c,L,J,phi,theta);

B_parametrized = @(phi,theta)(B_data(m_r, m_p, m_c, L, J, phi,theta));


%% 
syms L J  m_r m_p m_c theta phi dphi dtheta real

C_13 = @(m_p,L,J,theta,phi,dtheta,dphi)(m_p*L*(-sin(theta)*sin(phi)*dtheta + cos(theta)*cos(phi)*dphi));
C_23 = @(m_p,L,J,theta,phi,dtheta,dphi)(m_p*L*(-sin(theta)*cos(phi)*dtheta - cos(theta)*sin(phi)*dphi));

C_14 = @(m_p,L,J,theta,phi,dtheta,dphi)(m_p*L*(cos(theta)*cos(phi)*dtheta - sin(theta)*sin(phi)*dphi));
C_24 = @(m_p,L,J,theta,phi,dtheta,dphi)(m_p*L*(-cos(theta)*sin(phi)*dtheta - sin(theta)*cos(phi)*dphi));

C_33 = 0;
C_43 = @(m_p,L,J,theta,phi,dtheta,dphi)(m_p*L^2*sin(theta)*cos(theta)*dphi);

C_34 = @(m_p,L,J,theta,phi,dtheta,dphi)(-m_p*L^2*sin(theta)*cos(theta)*dphi);
C_44 = @(m_p,L,J,theta,phi,dtheta,dphi)(m_p*L^2*sin(theta)*cos(theta)*dtheta);

C_11 = 0;
C_12 = 0;
C_21 = 0;
C_22 = 0;
C_31 = 0;
C_32 = 0;
C_41 = 0;
C_42 = 0;
      
C_ = {C_11,C_12,C_13,C_14;
      C_21,C_22,C_23,C_24;
      C_31,C_32,C_33,C_34;
      C_41,C_42,C_34,C_44};
  
C_data =  @(m_r,m_p,m_c,L,J, phi, theta, dphi, dtheta)([C_{1,1}(), C_{1,2}(), C_{1,3}(m_p,L,J,theta,phi,dtheta,dphi), C_{1,4}(m_p,L,J,theta,phi,dtheta,dphi);
                                                        C_{2,1}(), C_{2,2}(), C_{2,3}(m_p,L,J,theta,phi,dtheta,dphi), C_{2,4}(m_p,L,J,theta,phi,dtheta,dphi);
                                                        C_{3,1}(), C_{3,2}(), C_{3,3}(),         C_{3,4}(m_p,L,J,theta,phi,dtheta,dphi);
                                                        C_{4,1}(), C_{4,2}(), C_{4,3}(m_p,L,J,theta,phi,dtheta,dphi), C_{4,4}(m_p,L,J,theta,phi,dtheta,dphi)]);
m_r = 1;
m_p = 2;
m_c = 5;
L = 10;
J = 100;

%% 

C_parametrized = @(phi,theta, dphi, dtheta)(C_data(m_r, m_p, m_c, L, J, phi, theta, dphi, dtheta));
% C = C_parametrized(q(3),q(4),dq(3),dq(4));

%% 
syms L J  m_r m_p m_c g theta phi dphi dtheta real

m_r = 1;
m_p = 2;
m_c = 5;
L = 10;
J = 100;
g = 9.81;

G_1 = 0; G_2 = 0; G_4 = 0;
G_3 = @(m_p, L, phi, theta)(m_p*g*L*sin(theta));

G_ = {G_1;G_2;G_3;G_4};

G_data = @(m_p, L, phi, theta)([G_{1,1}();G_{2,1}();G_{3,1}(m_p, L, phi, theta);G_{4,1}()]);
G_parametrized = @(phi, theta)(G_data(m_p, L, phi, theta));

% G = G_parametrized(q(1),q(2));

%% 
Ft = [1,1,0,0]'; 

H = [q(1);q(2)];
%% Messo in forma di spazio degli stati

clearvars -except G_parametrized C_parametrized B_parametrized Ft q dq

%% 
syms u 


f = @(q1,q2,q3,q4,dq1,dq2,dq3,dq4)((B_parametrized(q3,q4)\(-C_parametrized(q3,q4,dq3,dq4)*[dq1;dq2;dq3;dq4]-G_parametrized(q3,q4))));

f_sym = simplify(f(q(1),q(2),q(3),q(4),dq(1),dq(2),dq(3),dq(4)));

f0 = f(0,0,0,0,0,0,0,0);

g = @(q3,q4)((B_parametrized(q3,q4)\Ft));

g_sym = simplify(g(q(3),q(4)));

g0 = g(0,0);

%% Espansione degli stati, aggiungo le posizioni nello spazio degli stati,
%quindi una matrice 0 I per far tornare tutto, ( se fosse lineare )

%x1,x2,x3,x4 = x y phi tetha
%x5,x6,x7,x8 = derivate

x = sym('x',[8,1],'real');

f_exp = @(x1,x2,x3,x4,x5,x6,x7,x8)([[x5,x6,x7,x8]';f(x1,x2,x3,x4,x5,x6,x7,x8)]); 

%Prova
f_exp_dq0 = f_exp(q(1),q(2),q(3),q(4),0,0,0,0); 

%espando anche g
g_exp = @(q3,q4)([[0,0,0,0]';g(q3,q4)]);

%Prova
g_exp_00 = g_exp(0,0); 
 