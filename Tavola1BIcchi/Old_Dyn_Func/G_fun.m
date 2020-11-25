function G = G_fun(a2,a4,a5,a6,g0,m2,m3,m4,m5,m6,q1,q2,q3,q4,q5)
%G_FUN
%    G = G_FUN(A2,A4,A5,A6,G0,M2,M3,M4,M5,M6,Q1,Q2,Q3,Q4,Q5)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    14-May-2020 23:21:21

G = [-g0.*m6.*(a2.*sin(q1)+a4.*sin(q1)+(a6.*(cos(q5).*sin(q1)+sin(q5).*(cos(q1).*cos(q2).*cos(q4)-cos(q1).*sin(q2).*sin(q4))))./2.0-a5.*(cos(q1).*cos(q2).*sin(q4)+cos(q1).*cos(q4).*sin(q2))-q3.*cos(q1).*sin(q2))-g0.*m5.*(a2.*sin(q1)+a4.*sin(q1)-(a5.*(cos(q1).*cos(q2).*sin(q4)+cos(q1).*cos(q4).*sin(q2)))./2.0-q3.*cos(q1).*sin(q2))-g0.*m4.*(a2.*sin(q1)+(a4.*sin(q1))./2.0-q3.*cos(q1).*sin(q2))-g0.*m3.*(a2.*sin(q1)-(q3.*cos(q1).*sin(q2))./2.0)-(a2.*g0.*m2.*sin(q1))./2.0;g0.*m6.*(-a5.*(sin(q1).*sin(q2).*sin(q4)-cos(q2).*cos(q4).*sin(q1))+q3.*cos(q2).*sin(q1)+(a6.*sin(q5).*(cos(q2).*sin(q1).*sin(q4)+cos(q4).*sin(q1).*sin(q2)))./2.0)-g0.*m5.*((a5.*(sin(q1).*sin(q2).*sin(q4)-cos(q2).*cos(q4).*sin(q1)))./2.0-q3.*cos(q2).*sin(q1))+(g0.*m3.*q3.*cos(q2).*sin(q1))./2.0+g0.*m4.*q3.*cos(q2).*sin(q1);(g0.*m3.*sin(q1).*sin(q2))./2.0+g0.*m4.*sin(q1).*sin(q2)+g0.*m5.*sin(q1).*sin(q2)+g0.*m6.*sin(q1).*sin(q2);-g0.*m6.*(a5.*(sin(q1).*sin(q2).*sin(q4)-cos(q2).*cos(q4).*sin(q1))-(a6.*sin(q5).*(cos(q2).*sin(q1).*sin(q4)+cos(q4).*sin(q1).*sin(q2)))./2.0)-(a5.*g0.*m5.*(sin(q1).*sin(q2).*sin(q4)-cos(q2).*cos(q4).*sin(q1)))./2.0;a6.*g0.*m6.*(cos(q1).*sin(q5)-cos(q5).*(sin(q1).*sin(q2).*sin(q4)-cos(q2).*cos(q4).*sin(q1))).*(-1.0./2.0);0.0];