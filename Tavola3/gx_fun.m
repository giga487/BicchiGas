function out1 = gx_fun(B,C,D,l,q)
%GX_FUN
%    OUT1 = GX_FUN(B,C,D,L,Q1)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    02-Oct-2021 14:40:06

q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);

out1 = 1.0./(D.*(C+B.*l.*cos(q1)));
