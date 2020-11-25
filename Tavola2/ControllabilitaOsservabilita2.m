
clc
q = sym('q',[4,1],'real');
dq = sym('dq',[4,1],'real');

B = B_parametrized(q(3),q(4));
C = C_parametrized(q(3),q(4),dq(3),dq(4));
G = G_parametrized(q(3),q(3));

f = simplify(B\(-C*dq(1:4)-G));

g = simplify(B\Ft);

h1 = q(1);
h2 = q(2);
h3 = q(3);
h4 = q(4);

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

%% 
GammaG1 = liebracket(f, g, q, 3);












