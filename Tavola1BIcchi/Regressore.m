
load('B_reg_matrix.mat')
load('C_matrix.mat')
load('G_matrix.mat')

Y_t = sym('Y', [6 24], 'real');
tau = simplify(B_reg*ddq + C*dq + G);

Pi = [m(1); (m(1)*(d(1)/2-d(1))); (I(1)+m(1)*(d(1)/2-d(1))^2); 0;
      m(2); (m(2)*(d(2)/2-d(2))); (I(2)+m(2)*(d(2)/2-d(2))^2); 0;
      m(3); (m(3)*(d(3)/2-d(3))); (I(3)+m(3)*(d(3)/2-d(3))^2); 0;
      m(4); (m(4)*(d(4)/2-d(4))); (I(4)+m(4)*(d(4)/2-d(4))^2); 0;
      m(5); (m(5)*(d(5)/2-d(5))); (I(5)+m(5)*(d(5)/2-d(5))^2); 0;
      m(6); (m(6)*(d(6)/2-d(6))); (I(6)+m(6)*(d(6)/2-d(6))^2); 0;];
 

%%
% for i = 1:6
%    for j = 1:24      
%       f = collect(tau(i), Pi(j));
%       [c,t] = coeffs(f, Pi(j));
%       Y_t(i,j) = c(1);    
%    end
% end
% 
% Y_t = simplify(Y_t);

%% Calcolo diretto del regressore

% Matrici di base del Tensore di Inerzia
E1 = [[1 0 0];[0 0 0];[0 0 0]];
E2 = [[0 1 0];[1 0 0];[0 0 0]];
E3 = [[0 0 1];[0 0 0];[1 0 0]];
E4 = [[0 0 0];[0 1 0];[0 0 0]];
E5 = [[0 0 0];[0 0 1];[0 1 0]];
E6 = [[0 0 0];[0 0 0];[0 0 1]];

E = [E1; -E2; -E3; E4; -E5; E6];

% Costruzione dei Jacobiani dei frame di D-H
[Pcom,Etip,T00,T01,T12,T23,T34,T45,T56] =  forwardKinematics(parameter, q);
p = Etip(1:3,4);

z0 = [0, 0, 1]';
p0 = [0, 0, 0]';

% J1
T = getTransformMatrix(q(1),d(1)/2,0,parameter(1,3));

J1 = simplify([[cross(z0,p-p0);z0],zeros(6,5)]);
rG1 = T(1:3,1:3);    

z1 = T(1:3,3);
p1 = T(1:3,4);

% J2
A1 = getTransformMatrix(q(1),d(1),0,parameter(1,3));
T = A1*getTransformMatrix(q(2),d(2)/2,0,parameter(2,3));

J2 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],zeros(6,4)]);
rG2 = T(1:3,1:3);    

z2 = T(1:3,3);
p2 = T(1:3,4);

% J3
A2 = A1*getTransformMatrix(q(2),d(2),0,parameter(2,3));
T = A2*getTransformMatrix(0,q(3)/2,0,parameter(3,3));

J3 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],[z2;zeros(3,1)],zeros(6,3)]);
rG3 = T(1:3,1:3);    

z3 = T(1:3,3);
p3 = T(1:3,4);

% J4
A3 = A2*getTransformMatrix(0,q(3),0,parameter(3,3));
T = A3*getTransformMatrix(q(4),d(4)/2,0,parameter(4,3));

J4 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],[z2;zeros(3,1)],[cross(z3,p-p3);z3],zeros(6,2)]);
rG4 = T(1:3,1:3);    

z4 = T(1:3,3);
p4 = T(1:3,4);

% J5
A4 = A3*getTransformMatrix(q(4),d(4),0,parameter(4,3));
T = A4*getTransformMatrix(q(5),d(5)/2,0,parameter(5,3));

J5 = simplify([[cross(z0,p-p0);z1],[cross(z1,p-p1);z1],[z2;zeros(3,1)],[cross(z3,p-p3);z1],[cross(z4,p-p4);z4],zeros(6,1)]);
rG5 = T(1:3,1:3);    

z5 = T(1:3,3);
p5 = T(1:3,4);

% J6
A5 = A4*getTransformMatrix(q(5),d(5),0,parameter(5,3));
T = A5*getTransformMatrix(q(6),d(6)/2,0,parameter(6,3));

J6 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],[z2;zeros(3,1)],[cross(z3,p-p3);z1],[cross(z4,p-p4);z4],[cross(z5,p-p5);z5]]);
rG6 = T(1:3,1:3);

z6 = T(1:3,3);
p6 = T(1:3,4);
      
JpG1 = J1(1:3,:);
JpG2 = J2(1:3,:);
JpG3 = J3(1:3,:);
JpG4 = J4(1:3,:);
JpG5 = J5(1:3,:);
JpG6 = J6(1:3,:);

JgG1 = J1(4:6,:);
JgG2 = J2(4:6,:);
JgG3 = J3(4:6,:);
JgG4 = J4(4:6,:);
JgG5 = J5(4:6,:);
JgG6 = J6(4:6,:);

% Quantità che contribuiscono al regressore


%% test sulla correttezza
tau_reg = simplify(Y_t * Pi);
res = simplify(tau - tau_reg);
