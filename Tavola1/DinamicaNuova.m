% clc
% clear
% close all

%currentFile = genpath( './' );
%addpath(currentFile);
% Dinamica Nuova Jacobiano Geometrico

p0 = [0;0;0];
z0 = [0;0;1];

%% 

[Pcom,Etip,T00,T01,T12,T23,T34,T45,T56] =  forwardKinematics(parameter, q);

A1 = T00*T01;
A2 = A1*T12;
A3 = A2*T23;
A4 = A3*T34;
A5 = A4*T45;
AT = A5*T56;

A_SphericalArm = T00*T01*T12*T23;
A_SphericalWrist = T34*T45*T56;

p = Etip(1:3,4);

%% Jacobian com function
J_com = jacobian(Pcom,q);

fid = fopen('J_com.txt', 'wt');
[r,c] = size(J_com);

fprintf(fid,'J_Com = [');
for i = 1:r
    for j = 1:c
        if(j == c)           
            fprintf(fid,'%s;\n',J_com(i,j));
            continue
        end
        fprintf(fid,'%s,',J_com(i,j));
    end
end
fprintf(fid,'];');
fclose(fid);

% J_com = jacobian(Pcom,q);

%% End effector
J_endeffector = jacobian(Etip(1:3,4),q);

fid = fopen('J_endef.txt', 'wt');
[r,c] = size(J_endeffector);

fprintf(fid,'J_end = [');
for i = 1:r
    for j = 1:c
        if(j == c)           
            fprintf(fid,'%s;\n',J_endeffector(i,j));
            continue
        end
        fprintf(fid,'%s,',J_endeffector(i,j));
    end
end
fprintf(fid,'];');
fclose(fid);

%% J1
T = getTransformMatrix(q(1),d(1)/2,0,parameter(1,3));
p0 = T(1:3,4);
J1 = simplify([[cross(z0,p-p0);z0],zeros(6,5)]);
rG1 = T(1:3,1:3);    

%% J2
A1 = getTransformMatrix(q(1),d(1),0,parameter(1,3));
T = A1*getTransformMatrix(q(2),d(2)/2,0,parameter(2,3));

z1 = T(1:3,3);
% z1 = A1(1:3,3);
% p1 = A1(1:3,4);
p1 = T(1:3,4);

J2 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],zeros(6,4)]);
rG2 = T(1:3,1:3);    

%% J3
A2 = A1*getTransformMatrix(q(2),d(2),0,parameter(2,3));
T = A2*getTransformMatrix(0,q(3)/2,0,parameter(3,3));

z2 = T(1:3,3);
% z2 = A2(1:3,3);
% p2 = A2(1:3,4);
% p = T(1:3,4);

J3 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],[z2;zeros(3,1)],zeros(6,3)]);
rG3 = T(1:3,1:3);    

%% J4
A3 = A2*getTransformMatrix(0,q(3),0,parameter(3,3));
T = A3*getTransformMatrix(q(4),d(4)/2,0,parameter(4,3));

z3 = T(1:3,3);
% z3 = A3(1:3,3);
% p3 = A3(1:3,4);
p3 = T(1:3,4);

J4 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],[z2;zeros(3,1)],[cross(z3,p-p3);z3],zeros(6,2)]);
rG4 = T(1:3,1:3);    

%% J5
A4 = A3*getTransformMatrix(q(4),d(4),0,parameter(4,3));
T = A4*getTransformMatrix(q(5),d(5)/2,0,parameter(5,3));

z4 = T(1:3,3);
% z4 = A4(1:3,3);
% p4 = A4(1:3,4);
p4 = T(1:3,4);

J5 = simplify([[cross(z0,p-p0);z1],[cross(z1,p-p1);z1],[z2;zeros(3,1)],[cross(z3,p-p3);z1],[cross(z4,p-p4);z4],zeros(6,1)]);
rG5 = T(1:3,1:3);    

%% J6
A5 = A4*getTransformMatrix(q(5),d(5),0,parameter(5,3));
T = A5*getTransformMatrix(q(6),d(6)/2,0,parameter(6,3));

z5 = T(1:3,3);
% z5 = A5(1:3,3);
% p5 = A5(1:3,4);
p5 = T(1:3,4);

J6 = simplify([[cross(z0,p-p0);z0],[cross(z1,p-p1);z1],[z2;zeros(3,1)],[cross(z3,p-p3);z1],[cross(z4,p-p4);z4],[cross(z5,p-p5);z5]]);
rG6 = T(1:3,1:3);    

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

%% B
display("Calcolo B");
tic
B = simplify((m(1)*(JpG1')*JpG1 + (JgG1')*rG1*I_f(m(1),d(1))*(rG1')*JgG1+...
     m(2)*(JpG2')*JpG2 + (JgG2')*rG2*I_f(m(2),d(2))*(rG2')*JgG2+...
     m(3)*(JpG3')*JpG3 + (JgG3')*rG3*I_f(m(3),q(3))*(rG3')*JgG3+...
     m(4)*(JpG4')*JpG4 + (JgG4')*rG4*I_f(m(4),d(4))*(rG4')*JgG4+...
     m(5)*(JpG5')*JpG5 + (JgG5')*rG5*I_f(m(5),d(5))*(rG5')*JgG5+...
     m(6)*(JpG6')*JpG6 + (JgG6')*rG6*I_f(m(6),d(6))*(rG6')*JgG6));

fid = fopen('B.txt', 'wt');
[r,c] = size(B);
fprintf(fid,'B = [');
for i = 1:r
    for j = 1:c
        if(j == c)           
            fprintf(fid,'%s;\n',B(i,j));
            continue
        end
        fprintf(fid,'%s,',B(i,j));
    end
end
fprintf(fid,'];');
fclose(fid);
toc
display("fine calcolo B\n");

%% C
display("Inizio calcolo C");
tic
C = CoriolisMatrix(B,q,dq);
toc
display("Generazione file C");
fid = fopen('C.txt', 'wt');
[r,c] = size(C);

fprintf(fid,'C = [');
for i = 1:r
    for j = 1:c
        if(j == c)           
            fprintf(fid,'%s;\n',C(i,j));
            continue
        end
        fprintf(fid,'%s,',C(i,j));
    end
end
fprintf(fid,'];');
fclose(fid);

display("Fine calcolo C");

%% G
display("Inizio calcolo G");
g = [0,0,-g0]';
tic
G = -(m(1)*(JpG1')*g+m(2)*(JpG2')*g +m(3)*(JpG3')*g + m(4)*(JpG4')*g + m(5)*(JpG5')*g + m(6)*(JpG6')*g);

fid = fopen('G.txt', 'wt');
[r,c] = size(G);

fprintf(fid,'G = [');
for i = 1:r
    for j = 1:c
        if(j == c)           
            fprintf(fid,'%s;\n',G(i,j));
            continue
        end
        fprintf(fid,'%s,',G(i,j));
    end
end
fprintf(fid,'];');
fclose(fid);
display("Fine calcolo G");
