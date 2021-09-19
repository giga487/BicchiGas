%% Per quanto visto nella Tavola 2 il sistema in forma ridotta � 
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

% rank([g0 adfg0 adf2g0 adf3g0]) = 4
% La condizione (A) � pertanto verificata

%% (B) span{g, adfg, adf2g} sia involutivo
% [g [f g]] appartiene a span{g, adfg, adf2g}
gfg = jacobian(adfg, q)*g - jacobian(g, q)*adfg;

% rank([g adfg adf2g gfg]) = 4
% La condizione (B) � pertanto verificata

% Quindi esiste un cambiamento totale di variabili e una retroazione
% statica degli stati che linearizzano il sistema.
%%
Lfh1 = jacobian(h(1), q)*f;
Lgh1 = jacobian(h(1), q)*g;
Lf2h1 = jacobian(Lfh1, q)*f;
% LfLgh1 = jacobian(Lgh1, q)*f;
LgLfh1 = jacobian(Lfh1, q)*g; % != 0

Lfh2 = jacobian(h(2), q)*f;
Lgh2 = jacobian(h(2), q)*g;
Lf2h2 = jacobian(Lfh2, q)*f;
% LfLgh2 = jacobian(Lgh2, q)*f;
LgLfh2 = jacobian(Lfh2, q)*g; % != 0

%% Feedback linearization
z = sym('z',[4,1],'real');
dz = sym('dz',[4,1],'real');
u = sym('u',[1,2],'real');
v = sym('v',[1,2],'real');

z(1) = h(1);
z(2) = Lfh1;
z(3) = h(2);
z(4) = Lfh2;

dz(1) = z(2);
dz(2) = Lf2h1 + LgLfh1*F;
dz(3) = z(4);
dz(4) = Lf2h2 + LgLfh2*F;

% u(1) = (v(1) - Lf2h1) / LgLfh1;
% u(2) = (v(2) - Lf2h2) / LgLfh2;

%%
A = [[0 1 0 0];
     [0 0 0 0];
     [0 0 0 1];
     [0 0 0 0]];

B = [[0; 1; 0; 0] [0; 0; 0; 1]];

C = 