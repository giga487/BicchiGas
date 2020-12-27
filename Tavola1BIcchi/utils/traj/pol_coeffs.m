function [a0, a1, a2, a3] = pol_coeffs(qi,dqi,qf,dqf,tf)

    a0 = size(qi,1);
    a1 = size(qi,1);
    a2 = size(qi,1);
    a3 = size(qi,1);    
    [r,c] = size(qi);
    
    for i = 1:1:r

        qStart = qi(i);
        dqStart = dqi(i);
        qEnd = qf(i);
        dqEnd = dqf(i);
        
        a0(i) = qStart;
        a1(i) = dqStart;
%         a3(i) = dqEnd/tf^2 - 2*(qEnd - a0(i) - a1(i)*tf)/tf^3 - a1(i)/tf^2;
%         a2(i) = (qEnd - a0(i) -a1(i)*tf -a3(i)*tf^3)/tf^2;
        a2(i) = 3*(qEnd - qStart)/(tf^2) - (dqEnd + 2*dqStart)/tf;
        a3(i) = 2*(qStart - qEnd)/(tf^3) + (dqStart + dqEnd)/(tf^2);

    end
    
end