


function [a0, a1, a2, a3] = InitSimulationAdaptiveCompTorque(q0, dq0, qf, dqf, Simulation_Time, Ts)



    %% generazione traiettorie
    nSample = Simulation_Time/Ts;
    qVec = size(nSample,size(q0,1));
    dqVec = size(nSample,size(q0,1));
    ddqVec = size(nSample,size(q0,1));

    [a0, a1, a2, a3] = pol_coeffs(q0, dq0, qf, dqf, Simulation_Time);

    [~,c] = size(a0);

    for i = 1:1:c
        j = 1;
        for t = 0:Ts:Simulation_Time    

            qVec(j,i)   = a3(i)*t^3 + a2(i)*t^2 + a1(i)*t + a0(i);
            dqVec(j,i)  = 3*a3(i)*t^2 + 2*a2(i)*t + a1(i);
            ddqVec(j,i) = 6*a3(i)*t + 2*a2(i);

            t_vec(j) = t;
            j = j+1;

        end
    end

    figure;
    plot(t_vec,qVec(:,:));

    for x = 1:1:6
        leg{x,1} = sprintf('q_%d\n', x);
    end

    legend(leg);
    grid on;
    
    

end