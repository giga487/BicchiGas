
load('B_reg_matrix.mat')
load('C_matrix.mat')
load('G_matrix.mat')

Y_t = sym('Y', [6 22], 'real');
tau_ = sym('tau_', [6 1], 'real');
tau_r = sym('tau_r', [6 1], 'real');
tau = simplify(B_reg*ddq + C*dq + G);

% Print tau values in txt file
% fid = fopen('tau.txt', 'wt');
% [r,c] = size(tau);

% fprintf(fid,'tau = [');
% for i = 1:r
%     for j = 1:c
%         if(j == c)           
%             fprintf(fid,'%s;\n',tau(i,j));
%             continue
%         end
%         fprintf(fid,'%s,',tau(i,j));
%     end
% end
% fprintf(fid,'];');
% fclose(fid);

Pi = [m(1); (m(1)*(d(1)/2-d(1))); m(1)*(d(1)/2-d(1))^2; I(1);
      m(2); (m(2)*(d(2)/2-d(2))); m(2)*(d(2)/2-d(2))^2; I(2);
      m(3);                                             I(3);
      m(4); (m(4)*(d(4)/2-d(4))); m(4)*(d(4)/2-d(4))^2; I(4);
      m(5); (m(5)*(d(5)/2-d(5))); m(5)*(d(5)/2-d(5))^2; I(5);
      m(6); (m(6)*(d(6)/2-d(6))); m(6)*(d(6)/2-d(6))^2; I(6);]; 

%%
% primo link
tau_(1) = subs(tau(1), {d(1),I(1),m(2),I(2),m(3),I(3),m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0,0,0,0,0,0,0});
Y_t(1,1) = subs(tau_(1), m(1), 1);
tau_r(1) = simplify(tau(1) - (Y_t(1,1) * Pi(1)));

darivative_wrt_d(1) = diff(tau_r(1), d(1));
tau_(1) = subs(darivative_wrt_d(1), {d(1),I(1),m(2),I(2),m(3),I(3),m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0,0,0,0,0,0,0});
Y_t(1,2) = subs(tau_(1), m(1), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,2) * Pi(2)));

tau_(1) = subs(tau_r(1), {I(1),m(2),I(2),m(3),I(3),m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0,0,0,0,0,0});
Y_t(1,3) = subs(tau_(1), {m(1),d(1)}, {1,1});
tau_r(1) = simplify(tau_r(1) - (Y_t(1,3) * Pi(3)));

tau_(1) = subs(tau_r(1), {m(2),I(2),m(3),I(3),m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0,0,0,0,0});
Y_t(1,4) = subs(tau_(1), I(1), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,4) * Pi(4)));

% secondo link
tau_(1) = subs(tau_r(1), {d(2),I(2),m(3),I(3),m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0,0,0,0,0});
Y_t(1,5) = subs(tau_(1), m(2), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,5) * Pi(5)));

darivative_wrt_d(1) = diff(tau_r(1), d(2));
tau_(1) = subs(darivative_wrt_d(1), {d(2),I(2),m(3),I(3),m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0,0,0,0,0});
Y_t(1,6) = subs(tau_(1), m(2), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,6) * Pi(6)));

tau_(1) = subs(tau_r(1), {I(2),m(3),I(3),m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0,0,0,0});
Y_t(1,7) = subs(tau_(1), {m(2),d(2)}, {1,1});
tau_r(1) = simplify(tau_r(1) - (Y_t(1,7) * Pi(7)));

tau_(1) = subs(tau_r(1), {m(3),I(3),m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0,0,0});
Y_t(1,8) = subs(tau_(1), I(2), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,8) * Pi(8)));

% terzo link
tau_(1) = subs(tau_r(1), {I(3),m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0,0});
Y_t(1,9) = subs(tau_(1), m(3), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,9) * Pi(9)));

tau_(1) = subs(tau_r(1), {m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0});
Y_t(1,10) = subs(tau_(1), I(3), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,10) * Pi(10)));

% quarto link
tau_(1) = subs(tau_r(1), {d(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0});
Y_t(1,11) = subs(tau_(1), m(4), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,11) * Pi(11)));

darivative_wrt_d(1) = diff(tau_r(1), d(4));
tau_(1) = subs(darivative_wrt_d(1), {d(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0});
Y_t(1,12) = subs(tau_(1), m(4), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,12) * Pi(12)));

tau_(1) = subs(tau_r(1), {I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0});
Y_t(1,13) = subs(tau_(1), {m(4),d(4)}, {1,1});
tau_r(1) = simplify(tau_r(1) - (Y_t(1,13) * Pi(13)));

tau_(1) = subs(tau_r(1), {m(5),I(5),m(6),I(6)}, {0,0,0,0});
Y_t(1,14) = subs(tau_(1), I(4), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,14) * Pi(14)));

% quinto link
tau_(1) = subs(tau_r(1), {d(5),I(5),m(6),I(6)}, {0,0,0,0});
Y_t(1,15) = subs(tau_(1), m(5), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,15) * Pi(15)));

darivative_wrt_d(1) = diff(tau_r(1), d(5));
tau_(1) = subs(darivative_wrt_d(1), {d(5),I(5),m(6),I(6)}, {0,0,0,0});
Y_t(1,16) = subs(tau_(1), m(5), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,16) * Pi(16)));

tau_(1) = subs(tau_r(1), {I(5),m(6),I(6)}, {0,0,0});
Y_t(1,17) = subs(tau_(1), {m(5),d(5)}, {1,1});
tau_r(1) = simplify(tau_r(1) - (Y_t(1,17) * Pi(17)));

tau_(1) = subs(tau_r(1), {m(6),I(6)}, {0,0});
Y_t(1,18) = subs(tau_(1), I(5), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,18) * Pi(18)));

% sesto link
tau_(1) = subs(tau_r(1), {d(6),I(6)}, {0,0});
Y_t(1,19) = subs(tau_(1), m(6), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,19) * Pi(19)));

darivative_wrt_d(1) = diff(tau_r(1), d(6));
tau_(1) = subs(darivative_wrt_d(1), {d(6),I(6)}, {0,0});
Y_t(1,20) = subs(tau_(1), m(6), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,20) * Pi(20)));

tau_(1) = subs(tau_r(1), I(6), 0);
Y_t(1,21) = subs(tau_(1), {m(6),d(6)}, {1,1});
tau_r(1) = simplify(tau_r(1) - (Y_t(1,21) * Pi(21)));

Y_t(1,22) = subs(tau_(1), I(6), 1);
tau_r(1) = simplify(tau_r(1) - (Y_t(1,22) * Pi(22)));

%% test sulla correttezza
% tau_reg = simplify(Y_t * Pi);
% res = simplify(tau - tau_reg);

tau_reg = simplify(Y_t(1) * Pi);
res = simplify(tau(1) - tau_reg);
