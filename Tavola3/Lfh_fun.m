function Lfh = Lfh_fun(l,q)
%LFH_FUN
%    LFH = LFH_FUN(L,Q1,Q2,Q4)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    05-Jan-2022 15:55:21

q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);

Lfh = q4+l.*q2.*cos(q1);
