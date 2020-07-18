function [C] = C(par,q,dq)

 	c11 = (-0.5 * par.m2 * par.a1 * par.a2 * sin(q(2))) * dq(2);
	c12 = (-0.5 * par.m2 * par.a1 * par.a2 * sin(q(2))) * (dq(1) + dq(2));
	c21 = (par.m2 * par.a1 * par.a2 * sin(q(2))) * dq(1);
	c22 = 0;
	
    C = [c11,c12;c21,c22];
end

