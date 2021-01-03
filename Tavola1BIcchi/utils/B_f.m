function B = B_f(q,param)

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


B = [m1*(d2*cos(q1) + d5*cos(q1)*cos(q4) + d4*sin(q1)*sin(q2) + q3*sin(q1)*sin(q2) - d5*cos(q2)*sin(q1)*sin(q4) + d6*cos(q5)*sin(q1)*sin(q2) + d6*cos(q1)*sin(q4)*sin(q5) + d6*cos(q2)*cos(q4)*sin(q1)*sin(q5))^2 + m2*(d2*cos(q1) + d5*cos(q1)*cos(q4) + d4*sin(q1)*sin(q2) + q3*sin(q1)*sin(q2) - d5*cos(q2)*sin(q1)*sin(q4) + d6*cos(q5)*sin(q1)*sin(q2) + d6*cos(q1)*sin(q4)*sin(q5) + d6*cos(q2)*cos(q4)*sin(q1)*sin(q5))^2 + m3*(d2*cos(q1) + d5*cos(q1)*cos(q4) + d4*sin(q1)*sin(q2) + q3*sin(q1)*sin(q2) - d5*cos(q2)*sin(q1)*sin(q4) + d6*cos(q5)*sin(q1)*sin(q2) + d6*cos(q1)*sin(q4)*sin(q5) + d6*cos(q2)*cos(q4)*sin(q1)*sin(q5))^2 + m4*(d2*cos(q1) + d5*cos(q1)*cos(q4) + d4*sin(q1)*sin(q2) + q3*sin(q1)*sin(q2) - d5*cos(q2)*sin(q1)*sin(q4) + d6*cos(q5)*sin(q1)*sin(q2) + d6*cos(q1)*sin(q4)*sin(q5) + d6*cos(q2)*cos(q4)*sin(q1)*sin(q5))^2 + m5*(d2*cos(q1) + d5*cos(q1)*cos(q4) + d4*sin(q1)*sin(q2) + q3*sin(q1)*sin(q2) - d5*cos(q2)*sin(q1)*sin(q4) + d6*cos(q5)*sin(q1)*sin(q2) + d6*cos(q1)*sin(q4)*sin(q5) + d6*cos(q2)*cos(q4)*sin(q1)*sin(q5))^2 + m6*(d2*cos(q1) + d5*cos(q1)*cos(q4) + d4*sin(q1)*sin(q2) + q3*sin(q1)*sin(q2) - d5*cos(q2)*sin(q1)*sin(q4) + d6*cos(q5)*sin(q1)*sin(q2) + d6*cos(q1)*sin(q4)*sin(q5) + d6*cos(q2)*cos(q4)*sin(q1)*sin(q5))^2 + (d1^2*m1)/12 + m1*(d2*sin(q1) - d4*cos(q1)*sin(q2) + d5*cos(q4)*sin(q1) - q3*cos(q1)*sin(q2) + d5*cos(q1)*cos(q2)*sin(q4) - d6*cos(q1)*cos(q5)*sin(q2) + d6*sin(q1)*sin(q4)*sin(q5) - d6*cos(q1)*cos(q2)*cos(q4)*sin(q5))^2 + m2*(d2*sin(q1) - d4*cos(q1)*sin(q2) + d5*cos(q4)*sin(q1) - q3*cos(q1)*sin(q2) + d5*cos(q1)*cos(q2)*sin(q4) - d6*cos(q1)*cos(q5)*sin(q2) + d6*sin(q1)*sin(q4)*sin(q5) - d6*cos(q1)*cos(q2)*cos(q4)*sin(q5))^2 + m3*(d2*sin(q1) - d4*cos(q1)*sin(q2) + d5*cos(q4)*sin(q1) - q3*cos(q1)*sin(q2) + d5*cos(q1)*cos(q2)*sin(q4) - d6*cos(q1)*cos(q5)*sin(q2) + d6*sin(q1)*sin(q4)*sin(q5) - d6*cos(q1)*cos(q2)*cos(q4)*sin(q5))^2 + m4*(d2*sin(q1) - d4*cos(q1)*sin(q2) + d5*cos(q4)*sin(q1) - q3*cos(q1)*sin(q2) + d5*cos(q1)*cos(q2)*sin(q4) - d6*cos(q1)*cos(q5)*sin(q2) + d6*sin(q1)*sin(q4)*sin(q5) - d6*cos(q1)*cos(q2)*cos(q4)*sin(q5))^2 + m5*(d2*sin(q1) - d4*cos(q1)*sin(q2) + d5*cos(q4)*sin(q1) - q3*cos(q1)*sin(q2) + d5*cos(q1)*cos(q2)*sin(q4) - d6*cos(q1)*cos(q5)*sin(q2) + d6*sin(q1)*sin(q4)*sin(q5) - d6*cos(q1)*cos(q2)*cos(q4)*sin(q5))^2 + m6*(d2*sin(q1) - d4*cos(q1)*sin(q2) + d5*cos(q4)*sin(q1) - q3*cos(q1)*sin(q2) + d5*cos(q1)*cos(q2)*sin(q4) - d6*cos(q1)*cos(q5)*sin(q2) + d6*sin(q1)*sin(q4)*sin(q5) - d6*cos(q1)*cos(q2)*cos(q4)*sin(q5))^2 + (d6^2*m6*(cos(q2)*cos(q6)*sin(q5) - sin(q2)*sin(q4)*sin(q6) + cos(q4)*cos(q5)*cos(q6)*sin(q2))^2)/12 + (d6^2*m6*(cos(q6)*sin(q2)*sin(q4) + cos(q2)*sin(q5)*sin(q6) + cos(q4)*cos(q5)*sin(q2)*sin(q6))^2)/12 + (d6^2*m6*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))^2)/12 + (d2^2*m2*cos(q2)^2)/12 + (d4^2*m4*cos(q2)^2)/12 + (d5^2*m5*cos(q1)^2)/12 + (m3*q3^2*cos(q2)^2)/12 + (d2^2*m2*sin(q2)^2)/12 + (d5^2*m5*sin(q1)^2)/12 + (m3*q3^2*sin(q2)^2)/12 + (d4^2*m4*cos(q4)^2*sin(q2)^2)/12 + (d4^2*m4*sin(q2)^2*sin(q4)^2)/12,(d5^2*m5)/12 - d2*d4*m2*cos(q2) - d2*d4*m3*cos(q2) - d2*d4*m4*cos(q2) - d2*d4*m5*cos(q2) - d2*d4*m6*cos(q2) - d2*m2*q3*cos(q2) - d2*m3*q3*cos(q2) - d2*m4*q3*cos(q2) - d2*m5*q3*cos(q2) - d2*m6*q3*cos(q2) - d5^2*m2*cos(q4)*sin(q2)*sin(q4) - d5^2*m3*cos(q4)*sin(q2)*sin(q4) + d6^2*m2*cos(q4)*sin(q2)*sin(q4) - d5^2*m4*cos(q4)*sin(q2)*sin(q4) + d6^2*m3*cos(q4)*sin(q2)*sin(q4) - d5^2*m5*cos(q4)*sin(q2)*sin(q4) + d6^2*m4*cos(q4)*sin(q2)*sin(q4) - d5^2*m6*cos(q4)*sin(q2)*sin(q4) + d6^2*m5*cos(q4)*sin(q2)*sin(q4) + d6^2*m6*cos(q4)*sin(q2)*sin(q4) - d2*d6*m2*cos(q2)*cos(q5) - d4*d5*m2*cos(q2)*cos(q4) - d2*d6*m3*cos(q2)*cos(q5) - d4*d5*m3*cos(q2)*cos(q4) - d2*d6*m4*cos(q2)*cos(q5) - d4*d5*m4*cos(q2)*cos(q4) - d2*d6*m5*cos(q2)*cos(q5) - d4*d5*m5*cos(q2)*cos(q4) - d2*d6*m6*cos(q2)*cos(q5) - d4*d5*m6*cos(q2)*cos(q4) - d5*m2*q3*cos(q2)*cos(q4) - d5*m3*q3*cos(q2)*cos(q4) - d5*m4*q3*cos(q2)*cos(q4) - d5*m5*q3*cos(q2)*cos(q4) - d5*m6*q3*cos(q2)*cos(q4) - d2*d5*m2*sin(q2)*sin(q4) - d2*d5*m3*sin(q2)*sin(q4) - d2*d5*m4*sin(q2)*sin(q4) - d2*d5*m5*sin(q2)*sin(q4) - d2*d5*m6*sin(q2)*sin(q4) - d5*d6*m2*sin(q2)*sin(q5) - d5*d6*m3*sin(q2)*sin(q5) - d5*d6*m4*sin(q2)*sin(q5) - d5*d6*m5*sin(q2)*sin(q5) - d5*d6*m6*sin(q2)*sin(q5) - d6^2*m2*cos(q2)*cos(q5)*sin(q4)*sin(q5) - d6^2*m3*cos(q2)*cos(q5)*sin(q4)*sin(q5) - d6^2*m4*cos(q2)*cos(q5)*sin(q4)*sin(q5) - d6^2*m5*cos(q2)*cos(q5)*sin(q4)*sin(q5) - d6^2*m6*cos(q2)*cos(q5)*sin(q4)*sin(q5) - d5*d6*m2*cos(q2)*cos(q4)*cos(q5) - d5*d6*m3*cos(q2)*cos(q4)*cos(q5) - d5*d6*m4*cos(q2)*cos(q4)*cos(q5) - d5*d6*m5*cos(q2)*cos(q4)*cos(q5) - d5*d6*m6*cos(q2)*cos(q4)*cos(q5) + d2*d6*m2*cos(q4)*sin(q2)*sin(q5) + d2*d6*m3*cos(q4)*sin(q2)*sin(q5) + d2*d6*m4*cos(q4)*sin(q2)*sin(q5) - d4*d6*m2*cos(q2)*sin(q4)*sin(q5) + d2*d6*m5*cos(q4)*sin(q2)*sin(q5) - d4*d6*m3*cos(q2)*sin(q4)*sin(q5) + d2*d6*m6*cos(q4)*sin(q2)*sin(q5) - d4*d6*m4*cos(q2)*sin(q4)*sin(q5) - d4*d6*m5*cos(q2)*sin(q4)*sin(q5) - d4*d6*m6*cos(q2)*sin(q4)*sin(q5) - d6*m2*q3*cos(q2)*sin(q4)*sin(q5) - d6*m3*q3*cos(q2)*sin(q4)*sin(q5) - d6*m4*q3*cos(q2)*sin(q4)*sin(q5) - d6*m5*q3*cos(q2)*sin(q4)*sin(q5) - d6*m6*q3*cos(q2)*sin(q4)*sin(q5) - d6^2*m2*cos(q4)*cos(q5)^2*sin(q2)*sin(q4) - d6^2*m3*cos(q4)*cos(q5)^2*sin(q2)*sin(q4) - d6^2*m4*cos(q4)*cos(q5)^2*sin(q2)*sin(q4) - d6^2*m5*cos(q4)*cos(q5)^2*sin(q2)*sin(q4) - d6^2*m6*cos(q4)*cos(q5)^2*sin(q2)*sin(q4) + 2*d5*d6*m2*cos(q4)^2*sin(q2)*sin(q5) + 2*d5*d6*m3*cos(q4)^2*sin(q2)*sin(q5) + 2*d5*d6*m4*cos(q4)^2*sin(q2)*sin(q5) + 2*d5*d6*m5*cos(q4)^2*sin(q2)*sin(q5) + 2*d5*d6*m6*cos(q4)^2*sin(q2)*sin(q5),-sin(q2)*(d2 + d5*cos(q4) + d6*sin(q4)*sin(q5))*(m3 + m4 + m5 + m6),(d5^2*m5)/12 + (d4^2*m4*cos(q2))/12 + d5^2*m4*cos(q2) + d5^2*m5*cos(q2) + (d6^2*m4*cos(q2))/2 + d5^2*m6*cos(q2) + (d6^2*m5*cos(q2))/2 + (d6^2*m6*cos(q2))/2 - (d6^2*m4*cos(2*q5)*cos(q2))/2 - (d6^2*m5*cos(2*q5)*cos(q2))/2 - (d6^2*m6*cos(2*q5)*cos(q2))/2 + d2*d5*m4*cos(q2)*cos(q4) + d2*d5*m5*cos(q2)*cos(q4) + d2*d5*m6*cos(q2)*cos(q4) - d4*d5*m4*sin(q2)*sin(q4) - d4*d5*m5*sin(q2)*sin(q4) - d4*d5*m6*sin(q2)*sin(q4) - d5*m4*q3*sin(q2)*sin(q4) - d5*m5*q3*sin(q2)*sin(q4) - d5*m6*q3*sin(q2)*sin(q4) + (d6^2*m4*sin(2*q5)*cos(q4)*sin(q2))/2 + (d6^2*m5*sin(2*q5)*cos(q4)*sin(q2))/2 + (d6^2*m6*sin(2*q5)*cos(q4)*sin(q2))/2 + d2*d6*m4*cos(q2)*sin(q4)*sin(q5) + d2*d6*m5*cos(q2)*sin(q4)*sin(q5) + d2*d6*m6*cos(q2)*sin(q4)*sin(q5) + d4*d6*m4*cos(q4)*sin(q2)*sin(q5) + d4*d6*m5*cos(q4)*sin(q2)*sin(q5) - d5*d6*m4*cos(q5)*sin(q2)*sin(q4) + d4*d6*m6*cos(q4)*sin(q2)*sin(q5) - d5*d6*m5*cos(q5)*sin(q2)*sin(q4) - d5*d6*m6*cos(q5)*sin(q2)*sin(q4) + d6*m4*q3*cos(q4)*sin(q2)*sin(q5) + d6*m5*q3*cos(q4)*sin(q2)*sin(q5) + d6*m6*q3*cos(q4)*sin(q2)*sin(q5),sin(q2)*sin(q4)*((d6^2*m6*(cos(q2)*cos(q6)*sin(q5) - sin(q2)*sin(q4)*sin(q6) + cos(q4)*cos(q5)*cos(q6)*sin(q2))^2)/12 + (d6^2*m6*(cos(q6)*sin(q2)*sin(q4) + cos(q2)*sin(q5)*sin(q6) + cos(q4)*cos(q5)*sin(q2)*sin(q6))^2)/12 + (d6^2*m6*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))^2)/12) - (cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))*((d6^2*m6*(sin(q6)*(cos(q1)*cos(q5)*sin(q4) - sin(q1)*sin(q2)*sin(q5) + cos(q2)*cos(q4)*cos(q5)*sin(q1)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*(cos(q6)*sin(q2)*sin(q4) + cos(q2)*sin(q5)*sin(q6) + cos(q4)*cos(q5)*sin(q2)*sin(q6)))/12 - (d6^2*m6*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))*(cos(q5)*sin(q1)*sin(q2) + cos(q1)*sin(q4)*sin(q5) + cos(q2)*cos(q4)*sin(q1)*sin(q5)))/12 + (d6^2*m6*(cos(q6)*(cos(q1)*cos(q5)*sin(q4) - sin(q1)*sin(q2)*sin(q5) + cos(q2)*cos(q4)*cos(q5)*sin(q1)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*(cos(q2)*cos(q6)*sin(q5) - sin(q2)*sin(q4)*sin(q6) + cos(q4)*cos(q5)*cos(q6)*sin(q2)))/12) - (cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4))*((d6^2*m6*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))*(cos(q1)*cos(q5)*sin(q2) - sin(q1)*sin(q4)*sin(q5) + cos(q1)*cos(q2)*cos(q4)*sin(q5)))/12 + (d6^2*m6*(cos(q6)*(cos(q1)*sin(q2)*sin(q5) + cos(q5)*sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)*cos(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(cos(q2)*cos(q6)*sin(q5) - sin(q2)*sin(q4)*sin(q6) + cos(q4)*cos(q5)*cos(q6)*sin(q2)))/12 + (d6^2*m6*(sin(q6)*(cos(q1)*sin(q2)*sin(q5) + cos(q5)*sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)*cos(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(cos(q6)*sin(q2)*sin(q4) + cos(q2)*sin(q5)*sin(q6) + cos(q4)*cos(q5)*sin(q2)*sin(q6)))/12) - d6*m5*(cos(q1)*cos(q5)*sin(q4) - sin(q1)*sin(q2)*sin(q5) + cos(q2)*cos(q4)*cos(q5)*sin(q1))*(d2*sin(q1) - d4*cos(q1)*sin(q2) + d5*cos(q4)*sin(q1) - q3*cos(q1)*sin(q2) + d5*cos(q1)*cos(q2)*sin(q4) - d6*cos(q1)*cos(q5)*sin(q2) + d6*sin(q1)*sin(q4)*sin(q5) - d6*cos(q1)*cos(q2)*cos(q4)*sin(q5)) - d6*m6*(cos(q1)*cos(q5)*sin(q4) - sin(q1)*sin(q2)*sin(q5) + cos(q2)*cos(q4)*cos(q5)*sin(q1))*(d2*sin(q1) - d4*cos(q1)*sin(q2) + d5*cos(q4)*sin(q1) - q3*cos(q1)*sin(q2) + d5*cos(q1)*cos(q2)*sin(q4) - d6*cos(q1)*cos(q5)*sin(q2) + d6*sin(q1)*sin(q4)*sin(q5) - d6*cos(q1)*cos(q2)*cos(q4)*sin(q5)) + d6*m5*(cos(q1)*sin(q2)*sin(q5) + cos(q5)*sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)*cos(q5))*(d2*cos(q1) + d5*cos(q1)*cos(q4) + d4*sin(q1)*sin(q2) + q3*sin(q1)*sin(q2) - d5*cos(q2)*sin(q1)*sin(q4) + d6*cos(q5)*sin(q1)*sin(q2) + d6*cos(q1)*sin(q4)*sin(q5) + d6*cos(q2)*cos(q4)*sin(q1)*sin(q5)) + d6*m6*(cos(q1)*sin(q2)*sin(q5) + cos(q5)*sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)*cos(q5))*(d2*cos(q1) + d5*cos(q1)*cos(q4) + d4*sin(q1)*sin(q2) + q3*sin(q1)*sin(q2) - d5*cos(q2)*sin(q1)*sin(q4) + d6*cos(q5)*sin(q1)*sin(q2) + d6*cos(q1)*sin(q4)*sin(q5) + d6*cos(q2)*cos(q4)*sin(q1)*sin(q5)) + (d5^2*m5*cos(q1)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))/12 + (d5^2*m5*sin(q1)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))/12,(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))*((d6^2*m6*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))^2)/12 + (d6^2*m6*(sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))^2)/12 + (d6^2*m6*(cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))^2)/12) - (sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2))*((d6^2*m6*(sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*(sin(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4))))/12 + (d6^2*m6*(cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*(cos(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4))))/12 - (d6^2*m6*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)))/12) - (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*((d6^2*m6*(sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*(sin(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))))/12 + (d6^2*m6*(cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*(cos(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))))/12 - (d6^2*m6*(sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5)))/12);
(d5^2*m5)/12 - d2*d4*m2*cos(q2) - d2*d4*m3*cos(q2) - d2*d4*m4*cos(q2) - d2*d4*m5*cos(q2) - d2*d4*m6*cos(q2) - d2*m2*q3*cos(q2) - d2*m3*q3*cos(q2) - d2*m4*q3*cos(q2) - d2*m5*q3*cos(q2) - d2*m6*q3*cos(q2) - d5^2*m2*cos(q4)*sin(q2)*sin(q4) - d5^2*m3*cos(q4)*sin(q2)*sin(q4) + d6^2*m2*cos(q4)*sin(q2)*sin(q4) - d5^2*m4*cos(q4)*sin(q2)*sin(q4) + d6^2*m3*cos(q4)*sin(q2)*sin(q4) - d5^2*m5*cos(q4)*sin(q2)*sin(q4) + d6^2*m4*cos(q4)*sin(q2)*sin(q4) - d5^2*m6*cos(q4)*sin(q2)*sin(q4) + d6^2*m5*cos(q4)*sin(q2)*sin(q4) + d6^2*m6*cos(q4)*sin(q2)*sin(q4) - d2*d6*m2*cos(q2)*cos(q5) - d4*d5*m2*cos(q2)*cos(q4) - d2*d6*m3*cos(q2)*cos(q5) - d4*d5*m3*cos(q2)*cos(q4) - d2*d6*m4*cos(q2)*cos(q5) - d4*d5*m4*cos(q2)*cos(q4) - d2*d6*m5*cos(q2)*cos(q5) - d4*d5*m5*cos(q2)*cos(q4) - d2*d6*m6*cos(q2)*cos(q5) - d4*d5*m6*cos(q2)*cos(q4) - d5*m2*q3*cos(q2)*cos(q4) - d5*m3*q3*cos(q2)*cos(q4) - d5*m4*q3*cos(q2)*cos(q4) - d5*m5*q3*cos(q2)*cos(q4) - d5*m6*q3*cos(q2)*cos(q4) - d2*d5*m2*sin(q2)*sin(q4) - d2*d5*m3*sin(q2)*sin(q4) - d2*d5*m4*sin(q2)*sin(q4) - d2*d5*m5*sin(q2)*sin(q4) - d2*d5*m6*sin(q2)*sin(q4) - d5*d6*m2*sin(q2)*sin(q5) - d5*d6*m3*sin(q2)*sin(q5) - d5*d6*m4*sin(q2)*sin(q5) - d5*d6*m5*sin(q2)*sin(q5) - d5*d6*m6*sin(q2)*sin(q5) - d6^2*m2*cos(q2)*cos(q5)*sin(q4)*sin(q5) - d6^2*m3*cos(q2)*cos(q5)*sin(q4)*sin(q5) - d6^2*m4*cos(q2)*cos(q5)*sin(q4)*sin(q5) - d6^2*m5*cos(q2)*cos(q5)*sin(q4)*sin(q5) - d6^2*m6*cos(q2)*cos(q5)*sin(q4)*sin(q5) - d5*d6*m2*cos(q2)*cos(q4)*cos(q5) - d5*d6*m3*cos(q2)*cos(q4)*cos(q5) - d5*d6*m4*cos(q2)*cos(q4)*cos(q5) - d5*d6*m5*cos(q2)*cos(q4)*cos(q5) - d5*d6*m6*cos(q2)*cos(q4)*cos(q5) + d2*d6*m2*cos(q4)*sin(q2)*sin(q5) + d2*d6*m3*cos(q4)*sin(q2)*sin(q5) + d2*d6*m4*cos(q4)*sin(q2)*sin(q5) - d4*d6*m2*cos(q2)*sin(q4)*sin(q5) + d2*d6*m5*cos(q4)*sin(q2)*sin(q5) - d4*d6*m3*cos(q2)*sin(q4)*sin(q5) + d2*d6*m6*cos(q4)*sin(q2)*sin(q5) - d4*d6*m4*cos(q2)*sin(q4)*sin(q5) - d4*d6*m5*cos(q2)*sin(q4)*sin(q5) - d4*d6*m6*cos(q2)*sin(q4)*sin(q5) - d6*m2*q3*cos(q2)*sin(q4)*sin(q5) - d6*m3*q3*cos(q2)*sin(q4)*sin(q5) - d6*m4*q3*cos(q2)*sin(q4)*sin(q5) - d6*m5*q3*cos(q2)*sin(q4)*sin(q5) - d6*m6*q3*cos(q2)*sin(q4)*sin(q5) - d6^2*m2*cos(q4)*cos(q5)^2*sin(q2)*sin(q4) - d6^2*m3*cos(q4)*cos(q5)^2*sin(q2)*sin(q4) - d6^2*m4*cos(q4)*cos(q5)^2*sin(q2)*sin(q4) - d6^2*m5*cos(q4)*cos(q5)^2*sin(q2)*sin(q4) - d6^2*m6*cos(q4)*cos(q5)^2*sin(q2)*sin(q4) + 2*d5*d6*m2*cos(q4)^2*sin(q2)*sin(q5) + 2*d5*d6*m3*cos(q4)^2*sin(q2)*sin(q5) + 2*d5*d6*m4*cos(q4)^2*sin(q2)*sin(q5) + 2*d5*d6*m5*cos(q4)^2*sin(q2)*sin(q5) + 2*d5*d6*m6*cos(q4)^2*sin(q2)*sin(q5),(d2^2*m2)/12 + d4^2*m2 + d4^2*m3 + (d5^2*m2)/2 + (13*d4^2*m4)/12 + (d5^2*m3)/2 + (d6^2*m2)/2 + d4^2*m5 + (d5^2*m4)/2 + (d6^2*m3)/2 + d4^2*m6 + (7*d5^2*m5)/12 + (d6^2*m4)/2 + (d5^2*m6)/2 + (d6^2*m5)/2 + (7*d6^2*m6)/12 + m2*q3^2 + (13*m3*q3^2)/12 + m4*q3^2 + m5*q3^2 + m6*q3^2 + 2*d4*m2*q3 + 2*d4*m3*q3 + 2*d4*m4*q3 + 2*d4*m5*q3 + 2*d4*m6*q3 - (d5^2*m2*cos(2*q4))/2 - (d5^2*m3*cos(2*q4))/2 + (d6^2*m2*cos(2*q4))/2 - (d5^2*m4*cos(2*q4))/2 + (d6^2*m3*cos(2*q4))/2 - (d5^2*m5*cos(2*q4))/2 + (d6^2*m4*cos(2*q4))/2 - (d5^2*m6*cos(2*q4))/2 + (d6^2*m5*cos(2*q4))/2 + (d6^2*m6*cos(2*q4))/2 + (d6^2*m2*cos(q5)^2)/2 + (d6^2*m3*cos(q5)^2)/2 + (d6^2*m4*cos(q5)^2)/2 + (d6^2*m5*cos(q5)^2)/2 + (d6^2*m6*cos(q5)^2)/2 + 2*d4*d6*m2*cos(q5) + 2*d4*d6*m3*cos(q5) + 2*d4*d6*m4*cos(q5) + 2*d4*d6*m5*cos(q5) + 2*d4*d6*m6*cos(q5) + 2*d6*m2*q3*cos(q5) + 2*d6*m3*q3*cos(q5) + 2*d6*m4*q3*cos(q5) + 2*d6*m5*q3*cos(q5) + 2*d6*m6*q3*cos(q5) - (d6^2*m2*cos(2*q4)*cos(q5)^2)/2 - (d6^2*m3*cos(2*q4)*cos(q5)^2)/2 - (d6^2*m4*cos(2*q4)*cos(q5)^2)/2 - (d6^2*m5*cos(2*q4)*cos(q5)^2)/2 - (d6^2*m6*cos(2*q4)*cos(q5)^2)/2 - d5*d6*m2*sin(2*q4)*sin(q5) - d5*d6*m3*sin(2*q4)*sin(q5) - d5*d6*m4*sin(2*q4)*sin(q5) - d5*d6*m5*sin(2*q4)*sin(q5) - d5*d6*m6*sin(2*q4)*sin(q5),(d5*sin(q4) - d6*cos(q4)*sin(q5))*(m3 + m4 + m5 + m6),(d5^2*m5)/12 + (d6^2*m6)/12 - d4*d5*m4*cos(q4) - d4*d5*m5*cos(q4) - d4*d5*m6*cos(q4) - d5*m4*q3*cos(q4) - d5*m5*q3*cos(q4) - d5*m6*q3*cos(q4) - d6^2*m4*cos(q5)*sin(q4)*sin(q5) - d6^2*m5*cos(q5)*sin(q4)*sin(q5) - d6^2*m6*cos(q5)*sin(q4)*sin(q5) - d5*d6*m4*cos(q4)*cos(q5) - d5*d6*m5*cos(q4)*cos(q5) - d5*d6*m6*cos(q4)*cos(q5) - d4*d6*m4*sin(q4)*sin(q5) - d4*d6*m5*sin(q4)*sin(q5) - d4*d6*m6*sin(q4)*sin(q5) - d6*m4*q3*sin(q4)*sin(q5) - d6*m5*q3*sin(q4)*sin(q5) - d6*m6*q3*sin(q4)*sin(q5),(d5^2*m5*cos(q4))/12 + d6^2*m5*cos(q4) + (13*d6^2*m6*cos(q4))/12 + d4*d6*m5*cos(q4)*cos(q5) + d4*d6*m6*cos(q4)*cos(q5) + d6*m5*q3*cos(q4)*cos(q5) + d6*m6*q3*cos(q4)*cos(q5) - d5*d6*m5*sin(q4)*sin(q5) - d5*d6*m6*sin(q4)*sin(q5),(d6^2*m6*sin(q4)*sin(q5))/12;
-sin(q2)*(d2 + d5*cos(q4) + d6*sin(q4)*sin(q5))*(m3 + m4 + m5 + m6),(d5*sin(q4) - d6*cos(q4)*sin(q5))*(m3 + m4 + m5 + m6),m3 + m4 + m5 + m6,0,-d6*sin(q5)*(m5 + m6),0;
(d5^2*m5)/12 + (d4^2*m4*cos(q2))/12 + d5^2*m4*cos(q2) + d5^2*m5*cos(q2) + (d6^2*m4*cos(q2))/2 + d5^2*m6*cos(q2) + (d6^2*m5*cos(q2))/2 + (d6^2*m6*cos(q2))/2 - (d6^2*m4*cos(2*q5)*cos(q2))/2 - (d6^2*m5*cos(2*q5)*cos(q2))/2 - (d6^2*m6*cos(2*q5)*cos(q2))/2 + d2*d5*m4*cos(q2)*cos(q4) + d2*d5*m5*cos(q2)*cos(q4) + d2*d5*m6*cos(q2)*cos(q4) - d4*d5*m4*sin(q2)*sin(q4) - d4*d5*m5*sin(q2)*sin(q4) - d4*d5*m6*sin(q2)*sin(q4) - d5*m4*q3*sin(q2)*sin(q4) - d5*m5*q3*sin(q2)*sin(q4) - d5*m6*q3*sin(q2)*sin(q4) + (d6^2*m4*sin(2*q5)*cos(q4)*sin(q2))/2 + (d6^2*m5*sin(2*q5)*cos(q4)*sin(q2))/2 + (d6^2*m6*sin(2*q5)*cos(q4)*sin(q2))/2 + d2*d6*m4*cos(q2)*sin(q4)*sin(q5) + d2*d6*m5*cos(q2)*sin(q4)*sin(q5) + d2*d6*m6*cos(q2)*sin(q4)*sin(q5) + d4*d6*m4*cos(q4)*sin(q2)*sin(q5) + d4*d6*m5*cos(q4)*sin(q2)*sin(q5) - d5*d6*m4*cos(q5)*sin(q2)*sin(q4) + d4*d6*m6*cos(q4)*sin(q2)*sin(q5) - d5*d6*m5*cos(q5)*sin(q2)*sin(q4) - d5*d6*m6*cos(q5)*sin(q2)*sin(q4) + d6*m4*q3*cos(q4)*sin(q2)*sin(q5) + d6*m5*q3*cos(q4)*sin(q2)*sin(q5) + d6*m6*q3*cos(q4)*sin(q2)*sin(q5),(d5^2*m5)/12 + (d6^2*m6)/12 - d4*d5*m4*cos(q4) - d4*d5*m5*cos(q4) - d4*d5*m6*cos(q4) - d5*m4*q3*cos(q4) - d5*m5*q3*cos(q4) - d5*m6*q3*cos(q4) - (d6^2*m4*sin(2*q5)*sin(q4))/2 - (d6^2*m5*sin(2*q5)*sin(q4))/2 - (d6^2*m6*sin(2*q5)*sin(q4))/2 - d5*d6*m4*cos(q4)*cos(q5) - d5*d6*m5*cos(q4)*cos(q5) - d5*d6*m6*cos(q4)*cos(q5) - d4*d6*m4*sin(q4)*sin(q5) - d4*d6*m5*sin(q4)*sin(q5) - d4*d6*m6*sin(q4)*sin(q5) - d6*m4*q3*sin(q4)*sin(q5) - d6*m5*q3*sin(q4)*sin(q5) - d6*m6*q3*sin(q4)*sin(q5),0,(d4^2*m4)/12 + d5^2*m4 + (13*d5^2*m5)/12 + (d6^2*m4)/2 + d5^2*m6 + (d6^2*m5)/2 + (7*d6^2*m6)/12 - (d6^2*m4*cos(2*q5))/2 - (d6^2*m5*cos(2*q5))/2 - (d6^2*m6*cos(2*q5))/2,(d5^2*m5*cos(q4))/12 + (d6^2*m6*cos(q4))/12 - d5*d6*m5*cos(q5) - d5*d6*m6*cos(q5),(d6^2*m6*sin(q4)*sin(q5))/12;
(d5^2*m5*cos(q4))/12 + d6^2*m5*sin(q2)*sin(q4) + (13*d6^2*m6*sin(q2)*sin(q4))/12 - d5*d6*m5*cos(q2)*cos(q5) - d5*d6*m6*cos(q2)*cos(q5) + d2*d6*m5*sin(q2)*sin(q5) + d2*d6*m6*sin(q2)*sin(q5) - d2*d6*m5*cos(q2)*cos(q4)*cos(q5) - d2*d6*m6*cos(q2)*cos(q4)*cos(q5) + d4*d6*m5*cos(q5)*sin(q2)*sin(q4) + d4*d6*m6*cos(q5)*sin(q2)*sin(q4) + d5*d6*m5*cos(q4)*sin(q2)*sin(q5) + d5*d6*m6*cos(q4)*sin(q2)*sin(q5) + d6*m5*q3*cos(q5)*sin(q2)*sin(q4) + d6*m6*q3*cos(q5)*sin(q2)*sin(q4),(d5^2*m5*cos(q4))/12 + d6^2*m5*cos(q4) + (13*d6^2*m6*cos(q4))/12 + d4*d6*m5*cos(q4)*cos(q5) + d4*d6*m6*cos(q4)*cos(q5) + d6*m5*q3*cos(q4)*cos(q5) + d6*m6*q3*cos(q4)*cos(q5) - d5*d6*m5*sin(q4)*sin(q5) - d5*d6*m6*sin(q4)*sin(q5),-d6*sin(q5)*(m5 + m6),(d5^2*m5*cos(q4))/12 + (d6^2*m6*cos(q4))/12 - d5*d6*m5*cos(q5) - d5*d6*m6*cos(q5),(d5^2*m5)/12 + d6^2*m5 + (13*d6^2*m6)/12,((d6^2*m6*(cos(q6)*(cos(q1)*cos(q5)*sin(q4) - sin(q1)*sin(q2)*sin(q5) + cos(q2)*cos(q4)*cos(q5)*sin(q1)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*((cos(q6)*(cos(q1)*sin(q2)*sin(q5) + cos(q5)*sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)*cos(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)) + (cos(q6)*(cos(q1)*cos(q5)*sin(q4) - sin(q1)*sin(q2)*sin(q5) + cos(q2)*cos(q4)*cos(q5)*sin(q1)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)) - sin(q2)*sin(q4)*(cos(q2)*cos(q6)*sin(q5) - sin(q2)*sin(q4)*sin(q6) + cos(q4)*cos(q5)*cos(q6)*sin(q2))))/12 + (d6^2*m6*(sin(q6)*(cos(q1)*cos(q5)*sin(q4) - sin(q1)*sin(q2)*sin(q5) + cos(q2)*cos(q4)*cos(q5)*sin(q1)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*((sin(q6)*(cos(q1)*sin(q2)*sin(q5) + cos(q5)*sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)*cos(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)) + (sin(q6)*(cos(q1)*cos(q5)*sin(q4) - sin(q1)*sin(q2)*sin(q5) + cos(q2)*cos(q4)*cos(q5)*sin(q1)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)) - sin(q2)*sin(q4)*(cos(q6)*sin(q2)*sin(q4) + cos(q2)*sin(q5)*sin(q6) + cos(q4)*cos(q5)*sin(q2)*sin(q6))))/12)*(cos(q5)*sin(q1)*sin(q2) + cos(q1)*sin(q4)*sin(q5) + cos(q2)*cos(q4)*sin(q1)*sin(q5)) - ((d6^2*m6*(cos(q6)*(cos(q1)*sin(q2)*sin(q5) + cos(q5)*sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)*cos(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*((cos(q6)*(cos(q1)*sin(q2)*sin(q5) + cos(q5)*sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)*cos(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)) + (cos(q6)*(cos(q1)*cos(q5)*sin(q4) - sin(q1)*sin(q2)*sin(q5) + cos(q2)*cos(q4)*cos(q5)*sin(q1)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)) - sin(q2)*sin(q4)*(cos(q2)*cos(q6)*sin(q5) - sin(q2)*sin(q4)*sin(q6) + cos(q4)*cos(q5)*cos(q6)*sin(q2))))/12 + (d6^2*m6*(sin(q6)*(cos(q1)*sin(q2)*sin(q5) + cos(q5)*sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)*cos(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*((sin(q6)*(cos(q1)*sin(q2)*sin(q5) + cos(q5)*sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)*cos(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)) + (sin(q6)*(cos(q1)*cos(q5)*sin(q4) - sin(q1)*sin(q2)*sin(q5) + cos(q2)*cos(q4)*cos(q5)*sin(q1)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)) - sin(q2)*sin(q4)*(cos(q6)*sin(q2)*sin(q4) + cos(q2)*sin(q5)*sin(q6) + cos(q4)*cos(q5)*sin(q2)*sin(q6))))/12)*(cos(q1)*cos(q5)*sin(q2) - sin(q1)*sin(q4)*sin(q5) + cos(q1)*cos(q2)*cos(q4)*sin(q5)) + (d6^2*m6*sin(q2)*sin(q4)*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5)))/12;
(d6^2*m6*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))*((sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2))^2 + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))^2 + (cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))^2))/12 - (d6^2*m6*(sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*((sin(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(sin(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12 - (d6^2*m6*(cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*((cos(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(cos(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12,(d6^2*m6*sin(q4)*sin(q5))/12,0,(d6^2*m6*sin(q4)*sin(q5))/12,(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4))*((d6^2*m6*(cos(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*((cos(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(cos(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12 + (d6^2*m6*(sin(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*((sin(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(sin(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12 + (d6^2*m6*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2))*((sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2))^2 + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))^2 + (cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))^2))/12) + (cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))*((d6^2*m6*(cos(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*((cos(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(cos(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12 + (d6^2*m6*(sin(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*((sin(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(sin(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12 + (d6^2*m6*(sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*((sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2))^2 + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))^2 + (cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))^2))/12) - sin(q2)*sin(q4)*((d6^2*m6*(sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*((sin(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(sin(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12 - (d6^2*m6*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))*((sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2))^2 + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))^2 + (cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))^2))/12 + (d6^2*m6*(cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*((cos(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(cos(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12),(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2))*((d6^2*m6*(cos(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*((cos(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(cos(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12 + (d6^2*m6*(sin(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*((sin(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(sin(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12 + (d6^2*m6*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2))*((sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2))^2 + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))^2 + (cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))^2))/12) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*((d6^2*m6*(cos(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*((cos(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(cos(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12 + (d6^2*m6*(sin(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4)))*((sin(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(sin(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12 + (d6^2*m6*(sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*((sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2))^2 + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))^2 + (cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))^2))/12) - (cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))*((d6^2*m6*(sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*((sin(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(sin(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) - cos(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (sin(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) + cos(q6)*sin(q2)*sin(q4))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12 - (d6^2*m6*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))*((sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2))^2 + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))^2 + (cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))^2))/12 + (d6^2*m6*(cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*((cos(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) + cos(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q4)*sin(q1) + cos(q1)*cos(q2)*sin(q4)))*(sin(q5)*(sin(q1)*sin(q4) - cos(q1)*cos(q2)*cos(q4)) - cos(q1)*cos(q5)*sin(q2)) + (sin(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) + cos(q5)*sin(q1)*sin(q2))*(cos(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q2)*cos(q4)*sin(q1)) - sin(q1)*sin(q2)*sin(q5)) + sin(q6)*(cos(q1)*cos(q4) - cos(q2)*sin(q1)*sin(q4))) - (cos(q6)*(cos(q2)*sin(q5) + cos(q4)*cos(q5)*sin(q2)) - sin(q2)*sin(q4)*sin(q6))*(cos(q2)*cos(q5) - cos(q4)*sin(q2)*sin(q5))))/12);
];


end