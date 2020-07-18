
function [tau] = DirectDynamics(par,q,dq,ddq)

    tau = B(par,q)*ddq + C(par, q, dq)* dq + G(par, q);
end