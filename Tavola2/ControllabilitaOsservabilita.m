
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









