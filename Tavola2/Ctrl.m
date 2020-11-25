

clc 
syms C_f(q1,q2,q3,q4)
% theta è l'angolo di pitch  q(3)
% psi è l'angolo di yaw      q(4)

y = [q(3),q(4)]';

h1 = y(1,1);
h2 = y(2,1);

% Gamma0 = span(g0,...,g1) = g0

Gamma = liebracket(f_sym,g_sym,q,3);
Delta = [g_sym,Gamma];

%%

Delta_f(q1,q2,q3,q4) = Delta;
%% 
Delta_q3 = Delta_f(0,0,0,q4)
Delta_q4 = Delta_f(0,0,q3,0)
Delta_q1 = Delta_f(q1,0,0,0)

%% 

rank(Delta_q3)
%%
rank(Delta_q4)

%%

rank(Delta_q1)





