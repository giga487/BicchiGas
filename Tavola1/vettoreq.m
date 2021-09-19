function [q_d, dq_d, ddq_d] = vettoreq(a0,a1,a2,a3,t)

[r,c] = size(a1);
q_d = zeros(r,1);
dq_d = zeros(r,1);
ddq_d = zeros(r,1);

    for i = 1:1:r

        q_d(i)   = a3(i)*t^3 + a2(i)*t^2 + a1(i)*t + a0(i);
        dq_d(i)  = 3*a3(i)*t^2 + 2*a2(i)*t + a1(i);
        ddq_d(i) = 6*a3(i)*t + 2*a2(i);

    end
end