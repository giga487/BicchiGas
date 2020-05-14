% Cinematica Stanford


[Etip,T00,T01,T12,T23,T34,T45,T56] =  forwardKinematics(parameter, q);

A1 = T00*T01;
A2 = A1*T12;
A3 = A2*T23;
A4 = A3*T34;
A5 = A4*T45;
AT = A5*T56;

%% Dinamica Giunti

TG1 = getTransformMatrix(q(1),parameter(1,1)/2,0,parameter(1,3));
pG1 = TG1(1:3,4);
rG1 = TG1(1:3,1:3);

p = pG1;
r = rG1;

JpG1 = [jacobian(p(1),q);
        jacobian(p(2),q);
        jacobian(p(3),q)];

%JoG1    
dR_q1 = diff(r,q(1));
dR_q2 = diff(r,q(2));
dR_q3 = diff(r,q(3));
dR_q4 = diff(r,q(4));
dR_q5 = diff(r,q(5));
dR_q6 = diff(r,q(6));

TOR1vee = simplify(r'*dR_q1);
TOR2vee = simplify(r'*dR_q2);
TOR3vee = simplify(r'*dR_q3);
TOR4vee = simplify(r'*dR_q4);
TOR5vee = simplify(r'*dR_q5);
TOR6vee = simplify(r'*dR_q6);

TOR1 = [TOR1vee(3,2);TOR1vee(1,3);TOR1vee(2,1)];
TOR2 = [TOR2vee(3,2);TOR2vee(1,3);TOR2vee(2,1)];
TOR3 = [TOR3vee(3,2);TOR3vee(1,3);TOR3vee(2,1)];
TOR4 = [TOR4vee(3,2);TOR4vee(1,3);TOR4vee(2,1)];
TOR5 = [TOR5vee(3,2);TOR5vee(1,3);TOR5vee(2,1)];
TOR6 = [TOR6vee(3,2);TOR6vee(1,3);TOR6vee(2,1)];

JoG1 =  simplify([TOR1,TOR2,TOR3,TOR4,TOR5,TOR6]);

JG1 = [JpG1;JoG1];

%%

TG = A1*getTransformMatrix(q(2),parameter(2,1)/2,0,parameter(2,3));

pG2 = TG(1:3,4);
rG2 = TG(1:3,1:3);

p = pG2;
r = rG2;

JpG2 = [jacobian(p(1),q);
        jacobian(p(2),q);
        jacobian(p(3),q)];

%JoG1    
dR_q1 = diff(r,q(1));
dR_q2 = diff(r,q(2));
dR_q3 = diff(r,q(3));
dR_q4 = diff(r,q(4));
dR_q5 = diff(r,q(5));
dR_q6 = diff(r,q(6));

TOR1vee = simplify(r'*dR_q1);
TOR2vee = simplify(r'*dR_q2);
TOR3vee = simplify(r'*dR_q3);
TOR4vee = simplify(r'*dR_q4);
TOR5vee = simplify(r'*dR_q5);
TOR6vee = simplify(r'*dR_q6);

TOR1 = [TOR1vee(3,2);TOR1vee(1,3);TOR1vee(2,1)];
TOR2 = [TOR2vee(3,2);TOR2vee(1,3);TOR2vee(2,1)];
TOR3 = [TOR3vee(3,2);TOR3vee(1,3);TOR3vee(2,1)];
TOR4 = [TOR4vee(3,2);TOR4vee(1,3);TOR4vee(2,1)];
TOR5 = [TOR5vee(3,2);TOR5vee(1,3);TOR5vee(2,1)];
TOR6 = [TOR6vee(3,2);TOR6vee(1,3);TOR6vee(2,1)];

JoG2 =  simplify([TOR1,TOR2,TOR3,TOR4,TOR5,TOR6]);

JG2 = [JpG2;JoG2];

%%

TG = A2*getTransformMatrix(0,q(3)/2,0,parameter(3,3));
pG3 = TG(1:3,4);
rG3 = TG(1:3,1:3);

p = pG3;
r = rG3;

JpG3 = [jacobian(p(1),q);
        jacobian(p(2),q);
        jacobian(p(3),q)];

dR_q1 = diff(r,q(1));
dR_q2 = diff(r,q(2));
dR_q3 = diff(r,q(3));
dR_q4 = diff(r,q(4));
dR_q5 = diff(r,q(5));
dR_q6 = diff(r,q(6));

TOR1vee = simplify(r'*dR_q1);
TOR2vee = simplify(r'*dR_q2);
TOR3vee = simplify(r'*dR_q3);
TOR4vee = simplify(r'*dR_q4);
TOR5vee = simplify(r'*dR_q5);
TOR6vee = simplify(r'*dR_q6);

TOR1 = [TOR1vee(3,2);TOR1vee(1,3);TOR1vee(2,1)];
TOR2 = [TOR2vee(3,2);TOR2vee(1,3);TOR2vee(2,1)];
TOR3 = [TOR3vee(3,2);TOR3vee(1,3);TOR3vee(2,1)];
TOR4 = [TOR4vee(3,2);TOR4vee(1,3);TOR4vee(2,1)];
TOR5 = [TOR5vee(3,2);TOR5vee(1,3);TOR5vee(2,1)];
TOR6 = [TOR6vee(3,2);TOR6vee(1,3);TOR6vee(2,1)];

JoG3 =  simplify([TOR1,TOR2,TOR3,TOR4,TOR5,TOR6]);

JG3 = [JpG3;JoG3];

%% 

TG = A3*getTransformMatrix(q(4),parameter(4,1)/2,0,parameter(4,3));
pG4 = TG(1:3,4);
rG4 = TG(1:3,1:3);

p = pG4;
r = rG4;

JpG4 = [jacobian(p(1),q);
        jacobian(p(2),q);
        jacobian(p(3),q)];

%JoG1    
dR_q1 = diff(r,q(1));
dR_q2 = diff(r,q(2));
dR_q3 = diff(r,q(3));
dR_q4 = diff(r,q(4));
dR_q5 = diff(r,q(5));
dR_q6 = diff(r,q(6));

TOR1vee = simplify(r'*dR_q1);
TOR2vee = simplify(r'*dR_q2);
TOR3vee = simplify(r'*dR_q3);
TOR4vee = simplify(r'*dR_q4);
TOR5vee = simplify(r'*dR_q5);
TOR6vee = simplify(r'*dR_q6);

TOR1 = [TOR1vee(3,2);TOR1vee(1,3);TOR1vee(2,1)];
TOR2 = [TOR2vee(3,2);TOR2vee(1,3);TOR2vee(2,1)];
TOR3 = [TOR3vee(3,2);TOR3vee(1,3);TOR3vee(2,1)];
TOR4 = [TOR4vee(3,2);TOR4vee(1,3);TOR4vee(2,1)];
TOR5 = [TOR5vee(3,2);TOR5vee(1,3);TOR5vee(2,1)];
TOR6 = [TOR6vee(3,2);TOR6vee(1,3);TOR6vee(2,1)];

JoG4 =  simplify([TOR1,TOR2,TOR3,TOR4,TOR5,TOR6]);

JG4 = [JpG4;JoG4];

%% 

TG = A4*getTransformMatrix(q(5),parameter(5,1)/2,0,parameter(5,3));
pG5 = TG(1:3,4);
rG5 = TG(1:3,1:3);

p = pG5;
r = rG5;

JpG5 = [jacobian(p(1),q);
        jacobian(p(2),q);
        jacobian(p(3),q)];

%JoG1    
dR_q1 = diff(r,q(1));
dR_q2 = diff(r,q(2));
dR_q3 = diff(r,q(3));
dR_q4 = diff(r,q(4));
dR_q5 = diff(r,q(5));
dR_q6 = diff(r,q(6));

TOR1vee = simplify(r'*dR_q1);
TOR2vee = simplify(r'*dR_q2);
TOR3vee = simplify(r'*dR_q3);
TOR4vee = simplify(r'*dR_q4);
TOR5vee = simplify(r'*dR_q5);
TOR6vee = simplify(r'*dR_q6);

TOR1 = [TOR1vee(3,2);TOR1vee(1,3);TOR1vee(2,1)];
TOR2 = [TOR2vee(3,2);TOR2vee(1,3);TOR2vee(2,1)];
TOR3 = [TOR3vee(3,2);TOR3vee(1,3);TOR3vee(2,1)];
TOR4 = [TOR4vee(3,2);TOR4vee(1,3);TOR4vee(2,1)];
TOR5 = [TOR5vee(3,2);TOR5vee(1,3);TOR5vee(2,1)];
TOR6 = [TOR6vee(3,2);TOR6vee(1,3);TOR6vee(2,1)];

JoG5 =  simplify([TOR1,TOR2,TOR3,TOR4,TOR5,TOR6]);

JG5 = [JpG5;JoG5];

%% 

TG = A5*getTransformMatrix(q(6),parameter(6,1)/2,0,parameter(6,3));
pG6 = TG(1:3,4);
rG6 = TG(1:3,1:3);

p = pG6;
r = rG6;

JpG6 = [jacobian(p(1),q);
        jacobian(p(2),q);
        jacobian(p(3),q)];

%JoG1    
dR_q1 = diff(r,q(1));
dR_q2 = diff(r,q(2));
dR_q3 = diff(r,q(3));
dR_q4 = diff(r,q(4));
dR_q5 = diff(r,q(5));
dR_q6 = diff(r,q(6));

TOR1vee = simplify(r'*dR_q1);
TOR2vee = simplify(r'*dR_q2);
TOR3vee = simplify(r'*dR_q3);
TOR4vee = simplify(r'*dR_q4);
TOR5vee = simplify(r'*dR_q5);
TOR6vee = simplify(r'*dR_q6);

TOR1 = [TOR1vee(3,2);TOR1vee(1,3);TOR1vee(2,1)];
TOR2 = [TOR2vee(3,2);TOR2vee(1,3);TOR2vee(2,1)];
TOR3 = [TOR3vee(3,2);TOR3vee(1,3);TOR3vee(2,1)];
TOR4 = [TOR4vee(3,2);TOR4vee(1,3);TOR4vee(2,1)];
TOR5 = [TOR5vee(3,2);TOR5vee(1,3);TOR5vee(2,1)];
TOR6 = [TOR6vee(3,2);TOR6vee(1,3);TOR6vee(2,1)];

JoG6 =  simplify([TOR1,TOR2,TOR3,TOR4,TOR5,TOR6]);

JG6 = [JpG6;JoG6];

%%

B = (m(1)*(JpG1')*JpG1 + (JoG1')*rG1*I_f(m(1),a(1))*(rG1')*JoG1+...
          m(2)*(JpG2')*JpG2 + (JoG2')*rG2*I_f(m(2),a(2))*(rG2')*JoG2+...
          m(3)*(JpG3')*JpG3 + (JoG3')*rG3*I_f(m(3),a(3))*(rG3')*JoG3+...
          m(4)*(JpG4')*JpG4 + (JoG4')*rG4*I_f(m(4),a(4))*(rG4')*JoG4+...
          m(5)*(JpG5')*JpG5 + (JoG5')*rG5*I_f(m(5),a(5))*(rG5')*JoG5+...
          m(6)*(JpG6')*JpG6 + (JpG6')*rG6*I_f(m(6),a(6))*(rG6')*JoG6);

B_f1 = matlabFunction(B,'File','B_fun','Optimize',false);%%

%%
C = CoriolisMatrix(B,q,dq);

%%
C_f1 = matlabFunction(C,'File','C_fun','Optimize',false);

%%

g = [0,-g0,0]';

G = -(m(1)*(JpG1')*g+m(2)*(JpG2')*g +m(3)*(JpG3')*g + +m(4)*(JpG4')*g +m(5)*(JpG5')*g + m(6)*(JpG6')*g);

G_f1 = matlabFunction(G,'File','G_fun','Optimize',false);


