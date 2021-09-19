
load('B_matrix.mat')
load('C_matrix.mat')
load('G_matrix.mat')

Y_t = sym('Y', [6 6], 'real');
tau_ = sym('tau_', [6 1], 'real');
tau_r = sym('tau_r', [6 1], 'real');
tau = simplify(B*ddq + C*dq + G);

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

% Pi = [m(1); I(1);
%       m(2); I(2);
%       m(3); I(3);
%       m(4); I(4);
%       m(5); I(5);
%       m(6); I(6);];

Pi = [m(1);
      m(2);
      m(3);
      m(4);
      m(5);
      m(6);];

%%
[r,c] = size(tau);
for i = 1:r
    % primo link
    tau_(i) = subs(tau(i), {m(2),m(3),m(4),m(5),m(6)}, {0,0,0,0,0});
    Y_t(i,1) = subs(tau_(i), m(1), 1);
    tau_r(i) = simplify(tau(i) - (Y_t(i,1) * Pi(1)));

%     tau_(i) = subs(tau_r(i), {m(2),I(2),m(3),I(3),m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0,0,0,0,0});
%     Y_t(i,2) = subs(tau_(i), I(1), 1);
%     tau_r(i) = simplify(tau_r(i) - (Y_t(i,2) * Pi(2)));

    % secondo link
    tau_(i) = subs(tau_r(i), {m(3),m(4),m(5),m(6)}, {0,0,0,0});
    Y_t(i,2) = subs(tau_(i), m(2), 1);
    tau_r(i) = simplify(tau_r(i) - (Y_t(i,2) * Pi(2)));

%     tau_(i) = subs(tau_r(i), {m(3),I(3),m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0,0,0});
%     Y_t(i,4) = subs(tau_(i), I(2), 1);
%     tau_r(i) = simplify(tau_r(i) - (Y_t(i,4) * Pi(4)));

    % terzo link
    tau_(i) = subs(tau_r(i), {m(4),m(5),m(6)}, {0,0,0});
    Y_t(i,3) = subs(tau_(i), m(3), 1);
    tau_r(i) = simplify(tau_r(i) - (Y_t(i,3) * Pi(3)));

%     tau_(i) = subs(tau_r(i), {m(4),I(4),m(5),I(5),m(6),I(6)}, {0,0,0,0,0,0});
%     Y_t(i,6) = subs(tau_(i), I(3), 1);
%     tau_r(i) = simplify(tau_r(i) - (Y_t(i,6) * Pi(6)));

    % quarto link
    tau_(i) = subs(tau_r(i), {m(5),m(6)}, {0,0});
    Y_t(i,4) = subs(tau_(i), m(4), 1);
    tau_r(i) = simplify(tau_r(i) - (Y_t(i,4) * Pi(4)));

%     tau_(i) = subs(tau_r(i), {m(5),I(5),m(6),I(6)}, {0,0,0,0});
%     Y_t(i,8) = subs(tau_(i), I(4), 1);
%     tau_r(i) = simplify(tau_r(i) - (Y_t(i,8) * Pi(8)));

    % quinto link
    tau_(i) = subs(tau_r(i), m(6), 0);
    Y_t(i,5) = subs(tau_(i), m(5), 1);
    tau_r(i) = simplify(tau_r(i) - (Y_t(i,5) * Pi(5)));

%     tau_(i) = subs(tau_r(i), {m(6),I(6)}, {0,0});
%     Y_t(i,10) = subs(tau_(i), I(5), 1);
%     tau_r(i) = simplify(tau_r(i) - (Y_t(i,10) * Pi(10)));

    % sesto link
%     tau_(i) = subs(tau_r(i), I(6), 0);
    Y_t(i,6) = subs(tau_r(i), m(6), 1);
    tau_r(i) = simplify(tau_r(i) - (Y_t(i,6) * Pi(6)));

%     Y_t(i,12) = subs(tau_r(i), I(6), 1);
%     tau_r(i) = simplify(tau_r(i) - (Y_t(i,12) * Pi(12)));
end

%% test sulla correttezza
tau_reg = simplify(Y_t * Pi);
res = simplify(tau - tau_reg)

%% Generazione della funzione per il calcolo della matrice Y
matlabFunction(Y_t,'File','Y_fun');
