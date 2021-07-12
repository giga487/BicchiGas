

% CTRL
clc


f_ = f_exp;
g_ = g_exp;

h1 = atan(tan(x(4))*sin(x(3)));
h2 = asin(sin(x(4))*cos(x(3)));
%% 
Lf_h1 = jacobian(h1, x)*f_;
Lg_h1 = jacobian(h1, x)*g_;
Lg_Lf_h1 = jacobian(Lf_h1, x)*g_;

Lf_h2 = jacobian(h2, x)*f_;
Lg_h2 = jacobian(h2, x)*g_;
Lg_Lf_h2 = jacobian(Lf_h2, x)*g_;

%%

% GammaG1 = liebracket(f_, g_, x, 2);