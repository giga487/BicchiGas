%% main
parameter = [1  1;
             1  1;
             0  1;
             1  1;
             1  1;
             1  1;];
         
parameter = [parameter,theta0];

q = [0 0 3 0 0 0]';
dq = [1 1 1 1 1 1]';

p = plot_3D(parameter,q);

%%
% B = B_f(parameter, q, dq);
% C = C_f(parameter, q, dq); 
% G = G_f(parameter, q, dq);

B = B_f(q, parameter);
G = G_f(q, parameter);
C = C_f(q, dq, parameter);

tau = [0 0 0 0 0 0]';

%%
ddq = B\(tau-C*dq-G);
