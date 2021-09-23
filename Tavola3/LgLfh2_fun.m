function LgLfh2 = LgLfh2_fun(B,C,D,l,q)
%LGLFH2_FUN
%    LGLFH2 = LGLFH2_FUN(B,C,D,L,Q1)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    23-Sep-2021 18:39:15

q1 = q(1);

LgLfh2 = 1.0./(D.*(C+B.*l.*cos(q1)));
