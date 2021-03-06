function G = G_f(q,param)

q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);
q5 = q(5);
q6 = q(6);

d1 = param(1,1);
d2 = param(2,1);
%     d3 = param(3,1);
d4 = param(4,1);
d5 = param(5,1);
d6 = param(6,1);

m1 = param(1,2);
m2 = param(2,2);
m3 = param(3,2);
m4 = param(4,2);
m5 = param(5,2);
m6 = param(6,2);

g01 = 9.81;

G = [0;
- g01*m2*(d4*sin(q2) + q3*sin(q2) - d5*cos(q2)*sin(q4) + d6*cos(q5)*sin(q2) + d6*cos(q2)*cos(q4)*sin(q5)) - g01*m3*(d4*sin(q2) + q3*sin(q2) - d5*cos(q2)*sin(q4) + d6*cos(q5)*sin(q2) + d6*cos(q2)*cos(q4)*sin(q5)) - g01*m4*(d4*sin(q2) + q3*sin(q2) - d5*cos(q2)*sin(q4) + d6*cos(q5)*sin(q2) + d6*cos(q2)*cos(q4)*sin(q5)) - g01*m5*(d4*sin(q2) + q3*sin(q2) - d5*cos(q2)*sin(q4) + d6*cos(q5)*sin(q2) + d6*cos(q2)*cos(q4)*sin(q5)) - g01*m6*(d4*sin(q2) + q3*sin(q2) - d5*cos(q2)*sin(q4) + d6*cos(q5)*sin(q2) + d6*cos(q2)*cos(q4)*sin(q5));
g01*m3*cos(q2) + g01*m4*cos(q2) + g01*m5*cos(q2) + g01*m6*cos(q2);
g01*m4*sin(q2)*(d5*cos(q4) + d6*sin(q4)*sin(q5)) + g01*m5*sin(q2)*(d5*cos(q4) + d6*sin(q4)*sin(q5)) + g01*m6*sin(q2)*(d5*cos(q4) + d6*sin(q4)*sin(q5));
- d6*g01*m5*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - d6*g01*m6*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2));
0;
];

end






