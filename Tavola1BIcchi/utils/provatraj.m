% first cubic polynomial

qi1  = 0;
dqi1 = 0;
qf1  = pi;
dqf1 = 0;
tf1  = 2;

% second cubic polynomial

qi2  = qf1;
dqi2 = dqf1;
qf2  = pi/2;
dqf2 = pi;
tf2  = 2;

% third cubic polynomial

qi3  = qf2;
dqi3 = dqf2;
qf3  = pi;
dqf3 = 0;
tf3  = 2;

T = .1;
tf = tf3;

q_vec = zeros(1,tf3/T);
dq_vec = [];
ddq_vec = [];

t = 0;
j = 1;

for t = 0:T:tf1    
    
    [a0, a1, a2, a3] = pol_coeffs(qi1,dqi1,qf1,dqf1,tf1);

    q_vec(j)   = a3*t^3 + a2*t^2 + a1*t + a0;
    dq_vec(j)  = 3*a3*t^2 + 2*a2*t + a1;
    ddq_vec(j) = 6*a3*t + 2*a2;

    j = j+1;
end

figure
hold on 
plot(q_vec,'r');
plot(dq_vec,'b');
plot(ddq_vec,'g'); 
legend('q','dq','ddq');
hold off