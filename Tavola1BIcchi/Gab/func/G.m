function [G] = G(par,q)

    
	g1 = par.g * (par.m1*(par.a1/2)*cos(q(1)) + par.m2*(par.a1*cos(q(1)) + par.a2/2*cos(q(1) + q(2))));
	g2 = par.g * par.m2*(par.a2/2)*cos(q(1) + q(1));
	G = [g1; g2];
    
end

