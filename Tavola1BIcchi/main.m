% main

parameter = [0 1;
              1 1;
              1 1;
              0  1;
              0 1;
              1  1;];
      
q = [0,0,0,0,0,0];
dq = q;



plot_3D(parameter,q)

%%

B = B_f(parameter,q)
C = C_f(parameter,q,dq) 
G = G_f(parameter,q,dq)