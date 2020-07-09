% Dinamica Nuova Jacobiano Geometrico

% clc
% clear
% load('din1.mat');

[Etip,A00,A1,A2,A3,A4,A5,A6] =  forwardKinematics(parameter, q);

T1 = A1;
T2 = A1*A2;
T3 = A1*A2*A3;
T4 = A1*A2*A3*A4;
T5 = A1*A2*A3*A4*A5;
T6 = A1*A2*A3*A4*A5*A6;

A_sperhicalArm = A1*A2*A3;
A_SphericalWrist = A4*A5*A6;

%% 
z0 = [0;0;1];
z1 = A1(1:3,3);
z2 = T2(1:3,3);
z3 = T3(1:3,3);
z4 = T4(1:3,3);
z5 = T5(1:3,3);

p0 = [0;0;0];
p1 = A1(1:3,4);
p2 = T2(1:3,4);
p3 = T3(1:3,4);
p4 = T4(1:3,4);
p5 = T5(1:3,4);
P = T6(1:3,4);

rG1 = T1(1:3,1:3);
rG2 = T2(1:3,1:3);
rG3 = T3(1:3,1:3);
rG4 = T4(1:3,1:3);
rG5 = T5(1:3,1:3);
rG6 = T6(1:3,1:3);

J = simplify( [cross(z0,P-p0),cross(z1,P-p1),z2,cross(z3,P-p3),cross(z4,P-p4),cross(z5,P-p5);
                    z0 , z1 , zeros(3,1), z3 , z4 , z5]);

%%          
JG1 = [J(:,1),zeros(6,5)];
JG2 = [J(:,1:2),zeros(6,4)];
JG3 = [J(:,1:3),zeros(6,3)];
JG4 = [J(:,1:4),zeros(6,2)];
JG5 = [J(:,1:5),zeros(6,1)];
JG6 = [J(:,1:6),zeros(6,0)];

%% B
B = (m(1)*(JG1(1:3,:)')*JG1(1:3,:) + (JG1(4:6,:)')*rG1*I_f(m(1),d(1))*(rG1')*JG1(4:6,:)+...
     m(2)*(JG2(1:3,:)')*JG2(1:3,:) + (JG2(4:6,:)')*rG2*I_f(m(2),d(2))*(rG2')*JG2(4:6,:)+...
     m(3)*(JG3(1:3,:)')*JG3(1:3,:) + (JG3(4:6,:)')*rG3*I_f(m(3),d(3))*(rG3')*JG3(4:6,:)+...
     m(4)*(JG4(1:3,:)')*JG4(1:3,:) + (JG4(4:6,:)')*rG4*I_f(m(4),d(4))*(rG4')*JG4(4:6,:)+...
     m(5)*(JG5(1:3,:)')*JG5(1:3,:) + (JG5(4:6,:)')*rG5*I_f(m(5),d(5))*(rG5')*JG5(4:6,:)+...
     m(6)*(JG6(1:3,:)')*JG6(1:3,:) + (JG6(4:6,:)')*rG6*I_f(m(6),d(6))*(rG6')*JG6(4:6,:));

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

%% C

C = CoriolisMatrix(B,q,dq);

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


%% G

g = [0,0,-g0]';
tic
G = -(m(1)*(JG1(1:3,:)')*g+m(2)*(JG2(1:3,:)')*g +m(3)*(JG3(1:3,:)')*g + m(4)*(JG4(1:3,:)')*g + m(5)*(JG5(1:3,:)')*g + m(6)*(JG6(1:3,:)')*g);

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

