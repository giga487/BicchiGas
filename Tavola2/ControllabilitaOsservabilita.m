
syms u 
% B*ddq + C*dq + G = Ft;
% 
% ddq = B\(-C*dq-G+Ft);
% 
% ddq = B\(-C*dq-G) + B\Ft;
% dx = B\(-C*dq-G) + B\Ft;
% dx = f

B = B_parametrized(q(7),q(8));
C = C_parametrized(q(7),q(8),dq(7),dq(8));
G = G_parametrized(q(7),q(8));
%%
% f2 = @(q(5),q(6),q(7),q(8))(simplify(B_parametrized(q(7),q(8))\(-C_parametrized(q(7),q(8),dq(7),dq(8))*dq(5:8)-G_parametrized(q(7),q(8)))));
% 
% % f1 = @(q(1),q(2),q(3),q(4))();
% 
% g1 = @()(sym(zeros(4,1)));
% g2 = @(q5,q6,q7,q8)(simplify(B\Ft));

%% faccio questo perchè, attualmente dx è ddq
% vado ad inserire una serie di 1, sulla diagonale principale in modo da
% ottenere x y theta phi e non la derivata.
f = @(q1,q2,q3,q4,q5,q6,q7,q8)([f1(q1,q2,q3,q4);f2(q5,q6,q7,q8)]);
g = @(q1,q2,q3,q4,q5,q6,q7,q8)([g1();g2(q5,q6,q7,q8)]);

h1 = q(1);
h2 = q(2);
h3 = q(3);
h4 = q(4);

% ddq = f+g*u;
% 
% n = 2;
%% 
Lf_h1 = jacobian(h1, q)*f;
Lg_h1 = jacobian(h1, q)*g;
Lg_Lf_h1 = jacobian(Lf_h1, q)*g;

Lf_h2 = jacobian(h2, q)*f;
Lg_h2 = jacobian(h2, q)*g;
Lg_Lf_h2 = jacobian(Lf_h2, q)*g;

Lf_h3 = jacobian(h3, q)*f;
Lg_h3 = jacobian(h3, q)*g;
Lg_Lf_h3 = jacobian(Lf_h3, q)*g;

Lf_h4 = jacobian(h4, q)*f;
Lg_h4 = jacobian(h4, q)*g;
Lg_Lf_h4 = jacobian(Lf_h4, q)*g;









