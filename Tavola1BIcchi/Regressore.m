
load('B_reg_matrix.mat')
load('C_matrix.mat')
load('G_matrix.mat')

Y_t = sym('Y', [6 17], 'real');
tau_ = sym('tau_', [6 1], 'real');
tau_r = sym('tau_r', [6 1], 'real');
tau = simplify(B_reg*ddq + C*dq + G);

Pi = [m(1); (m(1)*(d(1)/2-d(1))); (I(1)+m(1)*(d(1)/2-d(1))^2);
      m(2); (m(2)*(d(2)/2-d(2))); (I(2)+m(2)*(d(2)/2-d(2))^2);
      m(3);                        I(3)                      ;
      m(4); (m(4)*(d(4)/2-d(4))); (I(4)+m(4)*(d(4)/2-d(4))^2);
      m(5); (m(5)*(d(5)/2-d(5))); (I(5)+m(5)*(d(5)/2-d(5))^2);
      m(6); (m(6)*(d(6)/2-d(6))); (I(6)+m(6)*(d(6)/2-d(6))^2);]; 

%%
% primo link
tau_(1) = subs(tau(1), {d(1),I(1)}, {0,0});
Y_t(1,1) = subs(tau_(1), m(1), 1);
tau_r(1) = tau(1) - Y_t(1,1) * Pi(1);

darivative_wrt_d(1) = diff(tau_r(1), d(1));
tau_(1) = subs(darivative_wrt_d(1), {d(1),I(1)}, {0,0});
Y_t(1,2) = subs(tau_(1), m(1), 1);
tau_r(1) = tau_r(1) - Y_t(1,2) * Pi(2);

Y_t(1,3) = subs(tau_r(1), {m(1),d(1),I(1)}, {1,1,1});
tau_r(1) = tau_r(1) - Y_t(1,3) * Pi(3);

% secondo link
tau_(1) = subs(tau_r(1), {d(2),I(2)}, {0,0});
Y_t(1,4) = subs(tau_(1), m(2), 1);
tau_r(1) = tau_r(1) - Y_t(1,4) * Pi(4);

darivative_wrt_d(1) = diff(tau_r(1), d(2));
tau_(1) = subs(darivative_wrt_d(1), {d(2),I(2)}, {0,0});
Y_t(1,5) = subs(tau_(1), m(2), 1);
tau_r(1) = tau_r(1) - Y_t(1,5) * Pi(5);

Y_t(1,6) = subs(tau_r(1), {m(2),d(2),I(2)}, {1,1,1});
tau_r(1) = tau_r(1) - Y_t(1,6) * Pi(6);

% terzo link
tau_(1) = subs(tau_r(1), I(3), 0);
Y_t(1,7) = subs(tau_(1), m(3), 1);
tau_r(1) = tau_r(1) - Y_t(1,7) * Pi(7);

Y_t(1,8) = subs(tau_r(1), I(3), 1);
tau_r(1) = tau_r(1) - Y_t(1,8) * Pi(8);

% quarto link
tau_(1) = subs(tau_r(1), {d(4),I(4)}, {0,0});
Y_t(1,9) = subs(tau_(1), m(4), 1);
tau_r(1) = tau_r(1) - Y_t(1,9) * Pi(9);

darivative_wrt_d(1) = diff(tau_r(1), d(4));
tau_(1) = subs(darivative_wrt_d(1), {d(4),I(4)}, {0,0});
Y_t(1,10) = subs(tau_(1), m(4), 1);
tau_r(1) = tau_r(1) - Y_t(1,10) * Pi(10);

Y_t(1,11) = subs(tau_r(1), {m(4),d(4),I(4)}, {1,1,1});
tau_r(1) = tau_r(1) - Y_t(1,11) * Pi(11);

% quinto link
tau_(1) = subs(tau_r(1), {d(5),I(5)}, {0,0});
Y_t(1,12) = subs(tau_(1), m(5), 1);
tau_r(1) = tau_r(1) - Y_t(1,12) * Pi(12);

darivative_wrt_d(1) = diff(tau_r(1), d(5));
tau_(1) = subs(darivative_wrt_d(1), {d(5),I(5)}, {0,0});
Y_t(1,13) = subs(tau_(1), m(5), 1);
tau_r(1) = tau_r(1) - Y_t(1,13) * Pi(13);

Y_t(1,14) = subs(tau_r(1), {m(5),d(5),I(5)}, {1,1,1});
tau_r(1) = tau_r(1) - Y_t(1,14) * Pi(14);

% sesto link
tau_(1) = subs(tau_r(1), {d(6),I(6)}, {0,0});
Y_t(1,15) = subs(tau_(1), m(6), 1);
tau_r(1) = tau_r(1) - Y_t(1,15) * Pi(15);

darivative_wrt_d(1) = diff(tau_r(1), d(6));
tau_(1) = subs(darivative_wrt_d(1), {d(6),I(6)}, {0,0});
Y_t(1,16) = subs(tau_(1), m(6), 1);
tau_r(1) = tau_r(1) - Y_t(1,16) * Pi(16);

Y_t(1,17) = subs(tau_r(1), {m(6),d(6),I(6)}, {1,1,1});
tau_r(1) = tau_r(1) - Y_t(1,17) * Pi(17);

tau_reg = simplify(Y_t(1) * Pi);
res = simplify(tau(1) - tau_reg);

%% test sulla correttezza
% tau_reg = simplify(Y_t * Pi);
% res = simplify(tau - tau_reg);
