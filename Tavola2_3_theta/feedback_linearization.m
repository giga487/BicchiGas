%% Per quanto visto nella Tavola 2 il sistema in forma ridotta è 
% localmente controllabile e osservabile, si procede quindi cercando un 
% cambio di variabili che porti il sistema in forma lineare.

%% (A) rank[g(x0) adfg(x0) ... adf3g(x0)] = n
adfg = jacobian(g, q)*f - jacobian(f, q)*g;
adf2g = jacobian(adfg, q)*f - jacobian(f, q)*adfg;
adf3g = jacobian(adf2g, q)*f - jacobian(f, q)*adf2g;

adfg_fun = matlabFunction(adfg);
adf2g_fun = matlabFunction(adf2g);
adf3g_fun = matlabFunction(adf3g);

g0 = g_fun(B,C,D,l,q0);
adfg0 = adfg_fun(B,C,D,b1,b2,l,0,0);
adf2g0 = adf2g_fun(B,C,D,b1,b2,gravity,l,0,0,0);
adf3g0 = adf3g_fun(B,C,D,b1,b2,gravity,l,0,0,0);

rank([g0 adfg0 adf2g0 adf3g0])
% La condizione (A) è pertanto verificata

%% (B) span{g, adfg, adf2g} sia involutivo
% [g [f g]] appartiene a span{g, adfg, adf2g}
gfg = jacobian(adfg, q)*g - jacobian(g, q)*adfg;

rank([g adfg adf2g gfg])
% La condizione (B) è pertanto verificata

%%
Lfh = jacobian(h, q)*f
Lgh = jacobian(h, q)*g
Lf2h = jacobian(Lfh, q)*f
% LfLgh = jacobian(Lgh, q)*f;
LgLfh = jacobian(Lfh, q)*g % != 0

% matlabFunction(Lfh,'File','Lfh_fun');
% matlabFunction(Lf2h,'File','Lf2h_fun');
% matlabFunction(LgLfh,'File','LgLfh_fun');

%% Feedback linearization
z = sym('z',[4,1],'real');
dz = sym('dz',[4,1],'real');
u = sym('u',[1,1],'real');
v = sym('v',[1,1],'real');

z(1) = h;
z(2) = Lfh;
z(3) = q(3);
z(4) = (-1/(l*cos(q(1))*B))*q(2) + q(4);

dz(1) = z(2);
dz(2) = Lf2h + LgLfh*F;
dz(3) = dq(3);
dz(4) = jacobian(z(4),q)*dq;

v = dz(2);
u = (v - Lf2h) / LgLfh;

%% Lg(PHIi(x)) = 0 r+1 <= i <= n
% allora la dinamica delle (n-r) variabili complementari è sia ininfluente
% sull'uscita del sistema linearizzato che indipendente dagli ingressi.
jacobian(z(3),q)*g
jacobian(z(4),q)*g

%% Infine perchè il cambio di variabili sia ammissibile deve essere verificata
% la condizione det(dPHI/dx) != 0
det(jacobian(z,q))

%%
% A_lin = [[0 1 0 0];
%          [0 0 1 0];
%          [0 0 0 1];
%          [0 0 0 0]];
% 
% B_lin = [0; 0; 0; 1];
% 
% C_lin = [1 0 0 0];
% 
% D_lin = 0;

%% Verifico la feedback linearization calcolata
% res1 = simplify(f_fun(B,C,D,b1,b2,gravity,l,q) + g_fun(B,C,D,l,q)*F);
% res2 = simplify(A_lin*z + B_lin*v);
% 
% res = res1 - res2

%% Parametri del modello
l = 0.2; %m
gravity = 9.81; %m/s^2
r = 0.02; %m
m1 = 0.088338025; %kg
m2 = 0.022245336; %kg
M = 0.548069759; %kg

b1 = 0.1;
b2 = 0.5;

B = m1 + m2/3;
C = m1 + m2 + M;
D = 2/5 * m1 * r^2;

Kp = 5;
Kd = 2.5;

%% Plot Controller Results
ref = [0,0,3,0]';

figure
plot(out.simout.Time, out.simout.Data);
grid on;
legend('e_{theta}','e_{dtheta}','e_{x}','e_{dx}');
title('error wrt time');
xlabel('time');
ylabel('error');

figure
plot(out.simout1.Time, out.simout1.Data);
% plot(out.simout1.Time, ref, '-');
grid on;
legend('theta','dtheta','x','dx');
title('state variable wrt time');
xlabel('time');
ylabel('state variables');
