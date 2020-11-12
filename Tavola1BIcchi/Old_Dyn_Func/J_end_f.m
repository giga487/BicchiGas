
function J = J_end_f(parameter,q,dq)

    a1 = parameter(1,1);
    a2 = parameter(2,1);
    a3 = parameter(3,1);
    a4 = parameter(4,1);
    a5 = parameter(5,1);
    a6 = parameter(6,1);
    m1 = parameter(1,2);
    m2 = parameter(2,2);
    m3 = parameter(3,2);
    m4 = parameter(4,2);
    m5 = parameter(5,2);
    m6 = parameter(6,2);
    q1 = q(1);
    q2 = q(2);
    q3 = q(3);
    q4 = q(4);
    q5 = q(5);
    q6 = q(6);
    dq1 = dq(1);
    dq2 = dq(2);
    dq3 = dq(3);
    dq4 = dq(4);
    dq5 = dq(5);
    dq6 = dq(6);
    
    J = J_end(a2,a4,a5,a6,q1,q2,q3,q4,q5,q6);
    
end