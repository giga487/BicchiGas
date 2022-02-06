%% Zero dinamica
xi = sym('xi',[2,1],'real');
ni = sym('ni',[2,1],'real');
dni = sym('dni',[2,1],'real');
% zeta = sym('zeta',[4,1],'real');

syms dni_fun(xi1, xi2, ni1, ni2) lin_fun(l,gravity,r,m1,m2,M,b1,b2,B,C,D,ni1,ni2)

% zeta(1) = xi(1)-l*sin(ni(1)) + l*sin(ni(1));
% zeta(2) = ((l^2*cos(ni(1))^2*B)/((l^2*cos(ni(1))^2*B)-1))*ni(2) - (1/((l^2*cos(ni(1))^2*B)-1))*xi(2) + l*(((l*cos(ni(1))*B)/((l^2*cos(ni(1))^2*B)-1))*(ni(2)-xi(2)))*cos(ni(1));
% zeta(3) = ni(1)
% zeta(4) = (-1/(l*cos(ni(1))*B))*((l*cos(ni(1))*B)/((l^2*cos(ni(1))^2*B)-1))*(ni(2)-xi(2)) + (((l^2*cos(ni(1))^2*B)/((l^2*cos(ni(1))^2*B)-1))*ni(2) - (1/((l^2*cos(ni(1))^2*B)-1))*xi(2));

dni(1) = simplify(((l*cos(ni(1))*B)/((l^2*cos(ni(1))^2*B)-1))*(ni(2)-xi(2)));
dni(2) =  simplify(F/(D*(C + B*l*cos(ni(1)))) - (b2*(((l^2*cos(ni(1))^2*B)/((l^2*cos(ni(1))^2*B)-1))*ni(2) - (1/((l^2*cos(ni(1))^2*B)-1))*xi(2)) + B*gravity*l*sin(ni(1)))/(C + B*l*cos(ni(1))) + ((b1*(((l*cos(ni(1))*B)/((l^2*cos(ni(1))^2*B)-1))*(ni(2)-xi(2))))/D + (B*gravity*l*sin(ni(1)))/D + (B*l*cos(ni(1))*(b2*(((l^2*cos(ni(1))^2*B)/((l^2*cos(ni(1))^2*B)-1))*ni(2) - (1/((l^2*cos(ni(1))^2*B)-1))*xi(2)) + B*gravity*l*sin(ni(1))))/(D*(C + B*l*cos(ni(1)))) + (B*F*l*cos(ni(1)))/(D*(C + B*l*cos(ni(1)))))/(B*l*cos(ni(1))) - ((((l*cos(ni(1))*B)/((l^2*cos(ni(1))^2*B)-1))*(ni(2)-xi(2)))^2*sin(ni(1)))/(B*l*cos(ni(1))^2));

dni_fun(xi1, xi2, ni1, ni2) = dni;
dyn_zero = dni_fun(0, 0, ni1, ni2)

lin_fun(l,gravity,r,m1,m2,M,b1,b2,B,C,D,ni1,ni2) = jacobian(dyn_zero,[ni1,ni2]);

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

%%
Q = lin_fun(l,gravity,r,m1,m2,M,b1,b2,B,C,D,0,0);
E = simplify(eig(Q));

figure(1)
plot(real(E),imag(E),'o') % Plot real and imaginary parts
grid on
xlabel('Real')
ylabel('Imaginary')
title('Eigenvalues of the zero dymanic matix')

