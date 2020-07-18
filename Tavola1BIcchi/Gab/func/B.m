function [B] = B(par,q)


	b11 = (par.m1 * (par.a1^2)/4) + (par.m2 * (par.a1^2 + (par.a2^2)/4 + par.a1*par.a2*cos(q(2)))) + par.Izz1 + par.Izz2;
	b12 = par.m2 * ((par.a1 * par.a2/2 * cos(q(2))) + (par.a2^2)/4) + par.Izz2;
	b21 = par.m2 * ((par.a1 * par.a2/2 * cos(q(2))) + (par.a2^2)/4) + par.Izz2;
	b22 = par.m2 * (par.a2^2)/4 + par.Izz2;
	
    B = [b11, b12; b21, b22];
end

