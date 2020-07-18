
addpath('func');

%Debug Progetto Serio

N = 250;

myMaxIter = 1000;

par.a1 = 1.3;
par.a2 = 1.6;

par.m1 = 1500;
par.m2 = 1350;

par.g = 9.81;

kh = 1.;
kj = 1.;
kdt = 0.;
kt = 0.;

par.Ixx1 = (par.m1*((par.a1/2)^2))/3;
par.Izz1 = (par.m1*((par.a1/2)^2))/3;
par.Ixx2 = (par.m2*((par.a2/2)^2))/3;
par.Izz2 = (par.m2*((par.a2/2)^2))/3;


tau = [];

%ricavo le traiettorie ottime e i guess

% for i = 1:1:N        
%     ddq(i) = 1/dt*dq(i+1)-dq(i);
%     tau(end+1) = DirectDynamics(q, dq, ddq);
% end



for i = 1:1:N
    
    pinvB = pinv(B(par,q(i)));
    
    ddq_p(end+1) = pinvB*(tau - C(par,q(i), dq(i))*dq(i) - G(par,q(i)));

    
end










