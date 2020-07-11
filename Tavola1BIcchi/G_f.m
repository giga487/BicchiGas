
function G = G_f(q,param)

q1 = q(1);
q2 = q(2);
d3 = q(3);
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

g0 = 9.81;

G = [g0*m4*((d4*cos(q1)*sin(q2))/2 - d2*sin(q1) + q3*cos(q1)*sin(q2)) - g0*m6*(d5*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)) + d2*sin(q1) + (d6*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)))/2 - d4*cos(q1)*sin(q2) - q3*cos(q1)*sin(q2)) - g0*m5*((d5*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))/2 + d2*sin(q1) - d4*cos(q1)*sin(q2) - q3*cos(q1)*sin(q2)) - g0*m3*(d2*sin(q1) - (q3*cos(q1)*sin(q2))/2) - (d2*g0*m2*sin(q1))/2,;
g0*m5*(d4*cos(q2)*sin(q1) + q3*cos(q2)*sin(q1) + (d5*sin(q1)*sin(q2)*sin(q4))/2) + g0*m4*((d4*cos(q2)*sin(q1))/2 + q3*cos(q2)*sin(q1)) + g0*m6*((d6*(cos(q2)*cos(q5)*sin(q1) - cos(q4)*sin(q1)*sin(q2)*sin(q5)))/2 + d4*cos(q2)*sin(q1) + q3*cos(q2)*sin(q1) + d5*sin(q1)*sin(q2)*sin(q4)) + (g0*m3*q3*cos(q2)*sin(q1))/2,;
(g0*m3*sin(q1)*sin(q2))/2 + g0*m4*sin(q1)*sin(q2) + g0*m5*sin(q1)*sin(q2) + g0*m6*sin(q1)*sin(q2),;
- g0*m6*(d5*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - (d6*sin(q5)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))/2) - (d5*g0*m5*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)))/2,;
(d6*g0*m6*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)))/2,;
0,;
];

end






