
[Pcom,Etip,T00,T01,T12,T23,T34,T45,T56] =  forwardKinematics(parameter, q);
p = Etip(1:3,4);

z0 = [0, 0, 1]';
p0 = [0, 0, 0]';

%% J1
T = getTransformMatrix(q(1),d(1)/2,0,parameter(1,3));

J1 = simplify([[cross(z0,p-p0);z0],zeros(6,5)]);
rG1 = T(1:3,1:3);    

z1 = T(1:3,3);
p1 = T(1:3,4);

%% J2
A1 = getTransformMatrix(q(1),d(1),0,parameter(1,3));
T = A1*getTransformMatrix(q(2),d(2)/2,0,parameter(2,3));

J2 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],zeros(6,4)]);
rG2 = T(1:3,1:3);    

z2 = T(1:3,3);
p2 = T(1:3,4);

%% J3
A2 = A1*getTransformMatrix(q(2),d(2),0,parameter(2,3));
T = A2*getTransformMatrix(0,q(3)/2,0,parameter(3,3));

J3 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],[z2;zeros(3,1)],zeros(6,3)]);
rG3 = T(1:3,1:3);    

z3 = T(1:3,3);
p3 = T(1:3,4);

%% J4
A3 = A2*getTransformMatrix(0,q(3),0,parameter(3,3));
T = A3*getTransformMatrix(q(4),d(4)/2,0,parameter(4,3));

J4 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],[z2;zeros(3,1)],[cross(z3,p-p3);z3],zeros(6,2)]);
rG4 = T(1:3,1:3);    

z4 = T(1:3,3);
p4 = T(1:3,4);

%% J5
A4 = A3*getTransformMatrix(q(4),d(4),0,parameter(4,3));
T = A4*getTransformMatrix(q(5),d(5)/2,0,parameter(5,3));

J5 = simplify([[cross(z0,p-p0);z1],[cross(z1,p-p1);z1],[z2;zeros(3,1)],[cross(z3,p-p3);z1],[cross(z4,p-p4);z4],zeros(6,1)]);
rG5 = T(1:3,1:3);    

z5 = T(1:3,3);
p5 = T(1:3,4);

%% J6
A5 = A4*getTransformMatrix(q(5),d(5),0,parameter(5,3));
T = A5*getTransformMatrix(q(6),d(6)/2,0,parameter(6,3));

J6 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],[z2;zeros(3,1)],[cross(z3,p-p3);z1],[cross(z4,p-p4);z4],[cross(z5,p-p5);z5]]);
rG6 = T(1:3,1:3);

z6 = T(1:3,3);
p6 = T(1:3,4);

% J = simplify( [cross(z0,P-p0),cross(z1,P-p1),z2,cross(z3,P-p3),cross(z4,P-p4),cross(z5,P-p5);
%                     z0 , z1 , zeros(3,1), z3 , z4 , z5]);

%%          
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

%% Inertia Matrix
B = simplify((m(1)*(JpG1')*JpG1 + (JgG1')*rG1*I_f(m(1),d(1))*(rG1')*JgG1+...
              m(2)*(JpG2')*JpG2 + (JgG2')*rG2*I_f(m(2),d(2))*(rG2')*JgG2+...
              m(3)*(JpG3')*JpG3 + (JgG3')*rG3*I_f(m(3),q(3))*(rG3')*JgG3+...
              m(4)*(JpG4')*JpG4 + (JgG4')*rG4*I_f(m(4),d(4))*(rG4')*JgG4+...
              m(5)*(JpG5')*JpG5 + (JgG5')*rG5*I_f(m(5),d(5))*(rG5')*JgG5+...
              m(6)*(JpG6')*JpG6 + (JgG6')*rG6*I_f(m(6),d(6))*(rG6')*JgG6));
 
% B_reg = simplify((m(1)*(JpG1')*JpG1 + (JgG1')*rG1*I(1)*(rG1')*JgG1+...
%                   m(2)*(JpG2')*JpG2 + (JgG2')*rG2*I(2)*(rG2')*JgG2+...
%                   m(3)*(JpG3')*JpG3 + (JgG3')*rG3*I(3)*(rG3')*JgG3+...
%                   m(4)*(JpG4')*JpG4 + (JgG4')*rG4*I(4)*(rG4')*JgG4+...
%                   m(5)*(JpG5')*JpG5 + (JgG5')*rG5*I(5)*(rG5')*JgG5+...
%                   m(6)*(JpG6')*JpG6 + (JgG6')*rG6*I(6)*(rG6')*JgG6))

%% Coriolis Matrix
C = sym('C', [6 6], 'real');
gamma = sym('gamma', [6 1], 'real');

for i = 1:1:6
   for j = 1:1:6
       for k = 1:1:6
           gamma(k) = (diff(B(i,j),q(k)) + diff(B(i,k),q(j)) - diff(B(j,k),q(i)))*dq(k);
       
       end
       C(i,j) = simplify(0.5 * sum(gamma));
   end
end

%% Gravitational Matrix
G = simplify(-(m(1)*(JpG1')*g0 + m(2)*(JpG2')*g0 + m(3)*(JpG3')*g0 + m(4)*(JpG4')*g0 + m(5)*(JpG5')*g0 + m(6)*(JpG6')*g0));

%% Generazione delle funzioni per il calcolo delle matrici B, C, G
% load('B_matrix.mat');
% load('C_matrix.mat');
% load('G_matrix.mat');

% matlabFunction(B,'File','B_fun');
% matlabFunction(C,'File','C_fun');
% matlabFunction(G,'File','G_fun');
